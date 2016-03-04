#!/usr/bin/python

import argparse
import os
import re
import random
import sqlite3
import time

import pandas as pd
from bokeh.plotting import figure, show, output_file
from bokeh.io import vplot


class pp():
    stall = 0
    fetch = 1
    issue = 2
    branch = 3
    mem_new = 4
    mem = 5
    lds = 6
    scalar = 7
    simd = 8
    count = 9

    strmap = {}
    strmap[stall] = "Stall"
    strmap[fetch] = "Fetch"
    strmap[issue] = "Issue"
    strmap[branch] = "Branch"
    strmap[mem_new] = "MemNew"
    strmap[mem] = "Mem"
    strmap[lds] = "LDS"
    strmap[scalar] = "Scalar"
    strmap[simd] = "SIMD"


class inst():
    start = 0
    length = 1
    fetch = 2
    issue = 3
    stall = 4
    active = 5
    cu = 6
    ib = 7
    wg = 8
    wf = 9
    uop = 10
    asm = 11
    lifelite = 12
    life = 13
    line = 14
    count = 15


class Trace:

    def __init__(self, file_name):
        # Trace information
        self._file_name = file_name
        self._trace = open(file_name, "r")

        self._database = None
        # Check if there is already an .db for the trace
        if os.path.isfile(self._file_name + ".db"):
            db = sqlite3.connect(self._file_name + '.db')
            c = db.cursor()
            db_name = str(c.execute('SELECT filename FROM misc').fetchone()[0])
            db_ctime = c.execute('SELECT ctime FROM misc').fetchone()[0]
            db_mtime = c.execute('SELECT mtime FROM misc').fetchone()[0]
            trace_ctime = str(time.ctime(os.path.getctime(self._file_name)))
            trace_mtime = str(time.ctime(os.path.getmtime(self._file_name)))
            if db_ctime == trace_ctime and db_mtime == trace_mtime \
                    and db_name == self._file_name:
                self._database = sqlite3.connect(self._file_name + '.db')
                self._database_ready = True
            else:
                is_delete = raw_input(
                    self._file_name + ".db outdated, update? [Y]/N: ")
                if is_delete == '' or is_delete == 'Y':
                    os.remove(self._file_name + '.db')

        self._color = "#%06x" % random.randint(0, 0xFFFFFF)

        # Cycle info
        self._is_cycle_range_set = False
        self._cycle_start = 0
        self._cycle_end = 0

        # Flags
        self._data_ready = False
        self._database_ready = False

        # Initialize statistics hashtables
        self._cycle_view = {}
        for index in range(pp.count):
            self._cycle_view[index] = {}

        self._inst_view = {}

    # Getters
    def decodeSIInst(self, keyword, line):
        if 'si.' in line:
            for item in line.split(' '):
                if keyword in item:
                    return item.split('=')[1]
        else:
            print "[ERR]: " + line

    # Instruction ID is only unique in a CU, so we need to patch it
    def getInstId(self, line):
        return str(self.decodeCU(line)) + str(self.decodeID(line))

    def decodeID(self, line):
        return int(self.decodeSIInst('id', line))

    def decodeCU(self, line):
        return int(self.decodeSIInst('cu', line))

    def decodeIB(self, line):
        return int(self.decodeSIInst('ib', line))

    def decodeWG(self, line):
        return int(self.decodeSIInst('wg', line))

    def decodeWF(self, line):
        return int(self.decodeSIInst('wf', line))

    def decodeUOP(self, line):
        return int(self.decodeSIInst('uop_id', line))

    def decodeSTG(self, line):
        try:
            return self.decodeSIInst('stg', line).replace('"', '')
        except AttributeError:
            return "err"

    def decodeASM(self, line):
        try:
            return re.search('asm=\"(.*)\"', line).group(1)
        except AttributeError:
            return "err"

    # Setters
    def setCycleRange(self, cycle_start, cycle_end):
        self._is_cycle_range_set = True
        self._cycle_start = cycle_start
        self._cycle_end = cycle_end
        self._cycle_counter = cycle_end - cycle_start

    # Functions
    def incCount(self, stat_name, cycle_index):
        dict = self._cycle_view[stat_name]
        count = 0
        if cycle_index in dict:
            count = dict[cycle_index]
        dict[cycle_index] = count + 1

    def incInstCount(self, field_name, line):
        inst_id = self.getInstId(line)
        self._inst_view[inst_id][field_name] += 1

    def setInstField(self, field_name, count, line):
        inst_id = self.getInstId(line)
        self._inst_view[inst_id][field_name] = count

    def setInstLife(self, cycle, line):
        inst_id = self.getInstId(line)
        inst_stg = self.decodeSTG(line).replace('\n', '')
        inst_life = str(cycle) + inst_stg + ";"
        self._inst_view[inst_id][inst.life] += inst_life

    def setInstLifeEnd(self, line):
        inst_id = self.getInstId(line)
        inst_info = self._inst_view[inst_id][inst.life].replace("\n", "")

        # Compact version of the life of an instruction
        inst_life = re.findall("(\d+)(\w+(-\w+)*)", inst_info)
        inst_life_lite = []
        index = 0
        while index < len(inst_life):
            try:
                curr_index = index
                next_index = index + 1
                curr_stage = inst_life[curr_index][1]
                next_stage = inst_life[next_index][1]
                while curr_stage == next_stage:
                    next_index += 1
                    next_stage = inst_life[next_index][1]
                index = next_index
                cycle = int(inst_life[next_index][0]) - \
                    int(inst_life[curr_index][0])
                inst_life_lite.append((str(cycle), curr_stage))
            except IndexError:
                break

        # Save instruction life information into a single string
        count = {"f": 0, "s": 0, "i": 0, "a": 0}
        inst_life_string = ""
        for item in inst_life_lite:
            inst_life_string += item[0] + " " + item[1] + ", "
            if item[1] == "f":
                count[item[1]] += int(item[0])
            elif item[1] == "s":
                count[item[1]] += int(item[0])
            elif item[1] == "i":
                count[item[1]] += int(item[0])
            else:
                count["a"] += int(item[0])

        # Update counters
        self._inst_view[inst_id][inst.fetch] = count["f"]
        self._inst_view[inst_id][inst.stall] = count["s"]
        self._inst_view[inst_id][inst.issue] = count["i"]
        self._inst_view[inst_id][inst.active] = count["a"]

        inst_life_string = inst_life_string[:-2]
        self._inst_view[inst_id][inst.lifelite] = inst_life_string

    def getInstCount(self, field_name, line):
        inst_id = self.getInstId(line)
        return self._inst_view[inst_id][field_name]

    def parseTrace(self):
        if self._is_cycle_range_set:
            self._cycle_counter = self._cycle_end - self._cycle_start
        else:
            self._cycle_counter = 0

        # Start from cycle 0
        cycle_index = 0
        line_num = 0
        for line in self._trace:
            line_num += 1
            if 'clk' in line:
                # Find which cycle and inc cycle counter
                cycle = int(re.search('(\d+)', line).group(1))
                cycle_index = cycle
                self._cycle_counter += 1
                self._cycle_end = cycle

                # Set cycle entry in all hashtable to 0
                for index in range(pp.count):
                    self._cycle_view[index][cycle_index] = 0

            elif 'stg="s"' in line:
                self.incCount(pp.stall, cycle_index)
                self.setInstLife(cycle_index, line)

            elif 'si.new_inst' in line:
                inst_id = self.getInstId(line)
                cu = self.decodeCU(line)
                ib = self.decodeIB(line)
                wg = self.decodeWG(line)
                wf = self.decodeWF(line)
                uop = self.decodeUOP(line)
                asm = self.decodeASM(line)

                self._inst_view[inst_id] = [0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, asm, "", "", 0]
                self.setInstField(inst.start, cycle_index, line)
                self.setInstField(inst.cu, cu, line)
                self.setInstField(inst.ib, ib, line)
                self.setInstField(inst.wg, wg, line)
                self.setInstField(inst.wf, wf, line)
                self.setInstField(inst.uop, uop, line)
                self.setInstField(inst.asm, asm, line)
                self.setInstField(inst.line, line_num, line)

                # Also handle stg="f"
                self.incCount(pp.fetch, cycle_index)
                self.setInstLife(cycle_index, line)

            elif 'si.end_inst' in line:
                inst_start_cycle = self.getInstCount(inst.start, line)
                self.setInstField(inst.length, cycle_index -
                                  inst_start_cycle, line)
                self.setInstLife(cycle_index, line)
                self.setInstLifeEnd(line)

            elif 'stg="i"' in line:
                self.incCount(pp.issue, cycle_index)
                self.setInstLife(cycle_index, line)

            elif 'mem.new_access ' in line:
                self.incCount(pp.mem_new, cycle_index)

            elif 'stg="mem' in line:
                self.incCount(pp.mem, cycle_index)
                self.setInstLife(cycle_index, line)

            elif 'stg="lds' in line:
                self.incCount(pp.lds, cycle_index)
                self.setInstLife(cycle_index, line)

            elif 'stg="bu' in line:
                self.incCount(pp.branch, cycle_index)
                self.setInstLife(cycle_index, line)

            elif 'stg="su' in line:
                self.incCount(pp.scalar, cycle_index)
                self.setInstLife(cycle_index, line)

            elif 'stg="simd' in line:
                self.incCount(pp.simd, cycle_index)
                self.setInstLife(cycle_index, line)

            # Update flag
            self._data_ready = True

    def buildDatabase(self):
        if self._database_ready:
            return

        if not self._data_ready:
            self.parseTrace()

        db = sqlite3.connect(self._file_name + '.db')
        c = db.cursor()

        # Create cycle view table
        c.execute('''CREATE TABLE IF NOT EXISTS cycle
            (cycle INTEGER, stall INTEGER,
             fetch INTEGER, issue INTEGER,
             branch INTEGER, mem_new INTEGER,
             mem INTEGER, lds INTEGER,
             scalar INTEGER, simd INTEGER)''')

        # Create instruction view table
        c.execute('''CREATE TABLE IF NOT EXISTS inst
            (inst_id text,
             cycle_start INTEGER, length INTEGER, \
             fetch INTEGER, issue INTEGER, \
             stall INTEGER, active INTEGER, \
             cu INTEGER, ib INTEGER, wg INTEGER, wf INTEGER, \
             uop INTEGER, asm text, lifelite text, life text, \
             line INTEGER)''')

        # Create misc info table
        c.execute('''CREATE TABLE IF NOT EXISTS misc
            (filename text, ctime text, mtime text)''')

        # Add cycle view data
        for key in self._cycle_view[pp.stall].keys():
            cycle = key
            stall = self._cycle_view[pp.stall][key]
            fetch = self._cycle_view[pp.fetch][key]
            issue = self._cycle_view[pp.issue][key]
            branch = self._cycle_view[pp.branch][key]
            mem_new = self._cycle_view[pp.mem_new][key]
            mem = self._cycle_view[pp.mem][key]
            lds = self._cycle_view[pp.lds][key]
            scalar = self._cycle_view[pp.scalar][key]
            simd = self._cycle_view[pp.simd][key]

            c.execute('INSERT INTO cycle VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
                      (cycle, stall, fetch, issue, branch,
                       mem_new, mem, lds, scalar, simd))

        # Add instruction view data
        for key in self._inst_view:
            inst_id = key
            cycle_start = self._inst_view[key][inst.start]
            length = self._inst_view[key][inst.length]
            fetch = self._inst_view[key][inst.fetch]
            issue = self._inst_view[key][inst.issue]
            stall = self._inst_view[key][inst.stall]
            active = self._inst_view[key][inst.active]
            cu = self._inst_view[key][inst.cu]
            ib = self._inst_view[key][inst.ib]
            wg = self._inst_view[key][inst.wg]
            wf = self._inst_view[key][inst.wf]
            uop = self._inst_view[key][inst.uop]
            asm = self._inst_view[key][inst.asm]
            lifelite = self._inst_view[key][inst.lifelite]
            life = self._inst_view[key][inst.life]
            line = self._inst_view[key][inst.line]

            c.execute('INSERT INTO inst VALUES(?, ?, ?, ?, ?, ?, ?, ?, \
                                               ?, ?, ?, ?, ?, ?, ?, ?)',
                      (inst_id, cycle_start, length, fetch, issue, stall,
                       active, cu, ib, wg, wf, uop, asm, lifelite, life, line))

        # Add misc info data
        name = self._file_name
        ctime = str(time.ctime(os.path.getctime(self._file_name)))
        mtime = str(time.ctime(os.path.getmtime(self._file_name)))
        c.execute('INSERT INTO misc VALUES(?, ?, ?)', (name, ctime, mtime))

        # Save (commit) the changes
        db.commit()

        # We can also close the connection if we are done with it.
        # Just be sure any changes have been committed or they will be lost.
        db.close()

        # Update flag
        self._database_ready = True
        self._database = sqlite3.connect(self._file_name + '.db')

    # Statistics getters
    def getColumn(self, table_name, column_name):
        if self._database is None:
            self.buildDatabase()

        c = self._database.cursor()
        sql_query = 'SELECT ' + column_name + ' FROM ' + table_name

        return c.execute(sql_query)

    def getMax(self, table_name, column_name):
        if self._database is None:
            self.buildDatabase()

        c = self._database.cursor()
        sql_query = 'SELECT Max(' + column_name + ') FROM ' + table_name
        max_val = c.execute(sql_query).fetchone()[0]

        return int(max_val)

    def getCount(self, table_name, column_name):
        if self._database is None:
            self.buildDatabase()

        c = self._database.cursor()
        sql_query = 'SELECT SUM(' + column_name + ') FROM ' + table_name
        count = c.execute(sql_query).fetchone()[0]

        return column_name + '\t\t\t' + str(count)

    def getAllCount(self):
        print "Cycle " + str(self._cycle_start) + " to " + str(self._cycle_end)
        print self.getCount('cycle', 'stall')
        print self.getCount('cycle', 'fetch')
        print self.getCount('cycle', 'issue')
        print self.getCount('cycle', 'branch')
        print self.getCount('cycle', 'mem_new')
        print self.getCount('cycle', 'mem')
        print self.getCount('cycle', 'lds')
        print self.getCount('cycle', 'scalar')
        print self.getCount('cycle', 'simd')


class Traces():

    def __init__(self, trace_files):

        self.trace_files = trace_files
        self.traces = []
        self.plot_width = 1560
        self.plot_height = 400

        for trace in trace_files:
            t = Trace(trace)
            self.traces.append(t)

    def stat(self):
        for trace in self.traces:
            trace.getAllCount()

    def plot(self, table_name, x_column_name, y_column_name):

        # Output to static HTML file
        output_file(y_column_name + x_column_name + '.html')

        # List of figures
        figures = []

        # Set y axis range
        x_max = 0
        y_max = 0
        for trace in self.traces:
            x_max = max(trace.getMax(table_name, x_column_name), x_max)
            y_max = max(trace.getMax(table_name, y_column_name), y_max)
        x_max *= 1.01
        y_max *= 1.05

        # Plotting
        all_in_one = figure(webgl=True,
                            plot_width=self.plot_width,
                            plot_height=self.plot_height,
                            x_range=(0, x_max),
                            y_range=(0, y_max),
                            title='Combined view')
        all_in_one.xaxis.axis_label = x_column_name
        all_in_one.yaxis.axis_label = "# of " + y_column_name

        for trace in self.traces:
            sql_query = 'SELECT ' + x_column_name + ',' + y_column_name + \
                ' FROM ' + table_name
            df = pd.read_sql_query(sql_query, trace._database)

            plot = figure(webgl=True,
                          plot_width=self.plot_width,
                          plot_height=self.plot_height,
                          x_range=(0, x_max),
                          y_range=(0, y_max),
                          title=trace._file_name)
            plot.xaxis.axis_label = x_column_name
            plot.yaxis.axis_label = "# of " + y_column_name

            plot.circle(df[x_column_name],
                        df[y_column_name],
                        color=trace._color,
                        size=5)

            all_in_one.circle(df[x_column_name],
                              df[y_column_name],
                              color=trace._color,
                              size=5)

            figures.append(plot)

        figures.append(all_in_one)

        # Plot all figures
        p = vplot(*figures)
        show(p)


def main():
    # Arg parser
    parser = argparse.ArgumentParser(
        description='Multi2Sim simulation trace analyzer')
    parser.add_argument('traceFiles', nargs='+',
                        help='Uncompressed Multi2Sim trace file')
    parser.add_argument("-t", "--table", nargs=1,
                        default="cycle",
                        help='Choose table name')
    parser.add_argument("-x", "--xaxis", nargs=1,
                        default="cycle",
                        help='Choose x axis statistic name')
    parser.add_argument("-y", "--yaxis", nargs=1,
                        default="stall",
                        help='Choose y axis statistic name')
    parser.add_argument("-s", "--stat",
                        action="store_true",
                        help='Show statistics')
    parser.add_argument("-v", "--visual",
                        action="store_true",
                        help='Visualize statistics')
    args = parser.parse_args()

    # Traces
    traces = Traces(args.traceFiles)

    # Statistics
    if args.stat:
        traces.stat()

    if args.visual:
        traces.plot(args.table[0], args.xaxis[0], args.yaxis[0])

if __name__ == '__main__':
    main()
