#!/usr/bin/python

import argparse
import re
import random
import sqlite3
from bokeh.io import output_file, show, vplot
from bokeh.plotting import figure


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
    count = 12


class Trace:

    def __init__(self, file_name):
        # Trace file info
        self._file_name = file_name
        self._trace = open(file_name, "r")
        self._color = "#%06x" % random.randint(0, 0xFFFFFF)

        # Cycle info
        self._is_cycle_range_set = False
        self._cycle_start = 0
        self._cycle_end = 0

        self._data_processed = False

        # Initialize statistics hashtables
        self._info = {}
        for index in range(pp.count):
            self._info[index] = {}

        self._inst = {}

    # Getters
    def decodeSIInst(self, keyword, line):
        if 'si.' in line:
            for item in line.split(' '):
                if keyword in item:
                    return item.split('=')[1]
        else:
            print "[ERR]: " + line

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
        return int(self.decodeSIInst('uop', line))

    def decodeSTG(self, line):
        return self.decodeSIInst('stg', line).replace("\"", "")

    def decodeASM(self, line):
        return self.decodeSIInst('asm', line).replace("\"", "")

    # Setters
    def setCycleRange(self, cycle_start, cycle_end):
        self._is_cycle_range_set = True
        self._cycle_start = cycle_start
        self._cycle_end = cycle_end
        self._cycle_counter = cycle_end - cycle_start

    # Functions
    def incCount(self, stat_name, cycle_index):
        dict = self._info[stat_name]
        count = 0
        if cycle_index in dict:
            count = dict[cycle_index]
        dict[cycle_index] = count + 1

    def incInstCount(self, field_name, line):
        inst_id = self.decodeID(line)
        self._inst[inst_id][field_name] += 1

    def setInstField(self, field_name, count, line):
        inst_id = self.decodeID(line)
        self._inst[inst_id][field_name] = count

    def getInstCount(self, field_name, line):
        inst_id = self.decodeID(line)
        return self._inst[inst_id][field_name]

    def processData(self):
        if self._is_cycle_range_set:
            self._cycle_counter = self._cycle_end - self._cycle_start
        else:
            self._cycle_counter = 0

        # Start from cycle 0
        cycle_index = 0
        for line in self._trace:
            if 'clk' in line:
                # Find which cycle and inc cycle counter
                cycle = int(re.search('(\d+)', line).group(1))
                cycle_index = cycle
                self._cycle_counter += 1
                self._cycle_end = cycle

                # Set cycle entry in all hashtable to 0
                for index in range(pp.count):
                    self._info[index][cycle_index] = 0

            elif 'stg="s"' in line:
                self.incCount(pp.stall, cycle_index)
                self.incInstCount(inst.stall, line)

            elif 'new_inst' in line:
                inst_id = self.decodeID(line)
                cu = self.decodeCU(line)
                ib = self.decodeIB(line)
                wg = self.decodeWG(line)
                wf = self.decodeWF(line)
                uop = self.decodeUOP(line)
                asm = self.decodeASM(line)

                self._inst[inst_id] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, asm]
                self.setInstField(inst.start, cycle_index, line)
                self.setInstField(inst.cu, cu, line)
                self.setInstField(inst.ib, ib, line)
                self.setInstField(inst.wg, wg, line)
                self.setInstField(inst.wf, wf, line)
                self.setInstField(inst.uop, uop, line)
                self.setInstField(inst.asm, asm, line)

                # Also handle stg="f"
                self.incCount(pp.fetch, cycle_index)
                self.setInstField(inst.fetch, 4, line)

            elif 'end_inst' in line:
                inst_start_cycle = self.getInstCount(inst.start, line)
                self.setInstField(inst.length, cycle_index -
                                  inst_start_cycle, line)

            elif 'stg="i"' in line:
                self.incCount(pp.issue, cycle_index)
                self.incInstCount(inst.issue, line)

            elif 'mem.new_access ' in line:
                self.incCount(pp.mem_new, cycle_index)

            elif 'stg="mem' in line:
                self.incCount(pp.mem, cycle_index)
                self.incInstCount(inst.active, line)

            elif 'stg="lds' in line:
                self.incCount(pp.lds, cycle_index)
                self.incInstCount(inst.active, line)

            elif 'stg="bu' in line:
                self.incCount(pp.branch, cycle_index)
                self.incInstCount(inst.active, line)

            elif 'stg="su' in line:
                self.incCount(pp.scalar, cycle_index)
                self.incInstCount(inst.active, line)

            elif 'stg="simd' in line:
                self.incCount(pp.simd, cycle_index)
                self.incInstCount(inst.active, line)

            self._data_processed = True

    def saveToDatabase(self):
        if not self._data_processed:
            self.processData()

        db = sqlite3.connect(self._file_name + '.db')
        c = db.cursor()

        # Create tables
        c.execute('''CREATE TABLE IF NOT EXISTS stat
            (cycle INTEGER, stall INTEGER,
             fetch INTEGER, issue INTEGER,
             branch INTEGER, mem_new INTEGER,
             mem INTEGER, lds INTEGER,
             scalar INTEGER, simd INTEGER)''')

        c.execute('''CREATE TABLE IF NOT EXISTS inst
            (inst_id INTEGER,
             cycle_start INTEGER, length INTEGER, \
             fetch INTEGER, issue INTEGER, \
             stall INTEGER, active INTEGER, \
             cu INTEGER, ib INTEGER, wg INTEGER, wf INTEGER, \
             uop INTEGER, asm text )''')

        for key in self._info[pp.stall].keys():
            cycle = key
            stall = self._info[pp.stall][key]
            fetch = self._info[pp.fetch][key]
            issue = self._info[pp.issue][key]
            branch = self._info[pp.branch][key]
            mem_new = self._info[pp.mem_new][key]
            mem = self._info[pp.mem][key]
            lds = self._info[pp.lds][key]
            scalar = self._info[pp.scalar][key]
            simd = self._info[pp.simd][key]

            c.execute('INSERT INTO stat VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
                      (cycle, stall, fetch, issue, branch,
                       mem_new, mem, lds, scalar, simd))

        for key in self._inst.keys():
            inst_id = key
            cycle_start = self._inst[key][inst.start]
            length = self._inst[key][inst.length]
            fetch = self._inst[key][inst.fetch]
            issue = self._inst[key][inst.issue]
            stall = self._inst[key][inst.stall]
            active = self._inst[key][inst.active]
            cu = self._inst[key][inst.cu]
            ib = self._inst[key][inst.ib]
            wg = self._inst[key][inst.wg]
            wf = self._inst[key][inst.wf]
            uop = self._inst[key][inst.uop]
            asm = self._inst[key][inst.asm]

            c.execute('INSERT INTO inst VALUES(?, ?, ?, ?, ?, ?, ?, \
                                               ?, ?, ?, ?, ?, ?)',
                      (inst_id, cycle_start, length, fetch, issue, stall,
                       active, cu, ib, wg, wf, uop, asm))

        # Save (commit) the changes
        db.commit()

        # We can also close the connection if we are done with it.
        # Just be sure any changes have been committed or they will be lost.
        db.close()

    # Deprecated: too slow
    def processDatabase(self):
        db = sqlite3.connect(self._file_name + '.db')
        c = db.cursor()

        # Create tables
        c.execute('''CREATE TABLE IF NOT EXISTS stat
            (cycle INTEGER, stall INTEGER,
             fetch INTEGER, issue INTEGER,
             branch INTEGER, mem_new INTEGER,
             mem INTEGER, lds INTEGER,
             scalar INTEGER, simd INTEGER)''')

        c.execute('''CREATE TABLE IF NOT EXISTS inst
            (inst_id INTEGER,
             cycle_start INTEGER, length INTEGER, \
             fetch INTEGER, issue INTEGER, \
             stall INTEGER, active INTEGER, \
             cu INTEGER, ib INTEGER, wg INTEGER, wf INTEGER, \
             uop INTEGER, asm text )''')

        # Start from cycle 0
        cycle_index = 0
        for line in self._trace:
            if 'clk' in line:
                # Find which cycle and inc cycle counter
                cycle = int(re.search('(\d+)', line).group(1))
                cycle_index = cycle
                self._cycle_end = cycle

                # Set cycle entry in all tables to 0
                c.execute('INSERT INTO stat VALUES (?, ?, ?, ?, ?, \
                                                ?, ?, ?, ?, ?)',
                          (cycle_index, 0, 0, 0, 0,
                           0, 0, 0, 0, 0))

            elif 'stg="s"' in line:
                c.execute('UPDATE stat SET stall=stall+1 WHERE cycle=?',
                          (cycle_index,))
                c.execute('UPDATE inst SET stall=stall+1 WHERE inst_id=?',
                          (self.decodeID(line),))

            elif 'new_inst' in line:
                inst_id = self.decodeID(line)
                cu = self.decodeCU(line)
                ib = self.decodeIB(line)
                wg = self.decodeWG(line)
                wf = self.decodeWF(line)
                uop = self.decodeUOP(line)
                asm = self.decodeASM(line)

                c.execute('INSERT INTO inst VALUES (?,\
                                                    ?, ?, ?, ?, ?, ?, \
                                                    ?, ?, ?, ?, ?, ? )',
                          (inst_id,
                           cycle_index, 0, 0, 0, 0, 0,
                           0, 0, 0, 0, 0, ''))
                c.execute('UPDATE inst SET cu=? WHERE inst_id=?',
                          (cu, inst_id))
                c.execute('UPDATE inst SET ib=? WHERE inst_id=?',
                          (ib, inst_id))
                c.execute('UPDATE inst SET wg=? WHERE inst_id=?',
                          (wg, inst_id))
                c.execute('UPDATE inst SET wf=? WHERE inst_id=?',
                          (wf, inst_id))
                c.execute('UPDATE inst SET uop=? WHERE inst_id=?',
                          (uop, inst_id))
                c.execute('UPDATE inst SET asm=? WHERE inst_id=?',
                          (asm, inst_id))

                # Also handle stg="f"
                c.execute('UPDATE stat SET fetch=fetch+1 WHERE cycle=?',
                          (cycle_index,))
                c.execute('UPDATE inst SET fetch=4 WHERE inst_id=?',
                          (self.decodeID(line),))

            elif 'end_inst' in line:
                c.execute('UPDATE inst SET length=?-cycle_start WHERE inst_id=?',
                          (cycle_index, self.decodeID(line)))

            elif 'stg="i"' in line:
                c.execute('UPDATE stat SET issue=issue+1 WHERE cycle=?',
                          (cycle_index,))
                c.execute('UPDATE inst SET issue=1 WHERE inst_id=?',
                          (self.decodeID(line),))

            elif 'mem.new_access ' in line:
                c.execute('UPDATE stat SET mem_new=mem_new+1 WHERE cycle=?',
                          (cycle_index,))

            elif 'stg="mem' in line:
                c.execute('UPDATE stat SET mem=mem+1 WHERE cycle=?',
                          (cycle_index,))
                c.execute('UPDATE inst SET active=active+1 WHERE inst_id=?',
                          (self.decodeID(line),))

            elif 'stg="lds' in line:
                c.execute('UPDATE stat SET lds=lds+1 WHERE cycle=?',
                          (cycle_index,))
                c.execute('UPDATE inst SET active=active+1 WHERE inst_id=?',
                          (self.decodeID(line),))

            elif 'stg="bu' in line:
                c.execute('UPDATE stat SET branch=branch+1 WHERE cycle=?',
                          (cycle_index,))
                c.execute('UPDATE inst SET active=active+1 WHERE inst_id=?',
                          (self.decodeID(line),))

            elif 'stg="su' in line:
                c.execute('UPDATE stat SET scalar=scalar+1 WHERE cycle=?',
                          (cycle_index,))
                c.execute('UPDATE inst SET active=active+1 WHERE inst_id=?',
                          (self.decodeID(line),))

            elif 'stg="simd' in line:
                c.execute('UPDATE stat SET simd=simd+1 WHERE cycle=?',
                          (cycle_index,))
                c.execute('UPDATE inst SET active=active+1 WHERE inst_id=?',
                          (self.decodeID(line),))

        # Save (commit) the changes
        db.commit()

        # We can also close the connection if we are done with it.
        # Just be sure any changes have been committed or they will be lost.
        db.close()

    def getStatistics(self, dict, dict_name):
        if not self._data_processed:
            self.processData()

        # Count of all given values in dict
        count = sum(dict.values())

        # Ratio of cycles with non-zero values
        num_non_zero_cycles = 0
        for value in dict.values():
            if value != 0:
                num_non_zero_cycles += 1
        cycle_ratio = float(num_non_zero_cycles) / \
            float(self._cycle_counter) * 100

        print("  %s\t\t%d\t%f" % (dict_name, count, cycle_ratio))

    # Statistics getters
    def getStall(self):
        self.getStatistics(self._info[pp.stall], "Stall ")

    def getFetch(self):
        self.getStatistics(self._info[pp.fetch], "Fetch ")

    def getIssue(self):
        self.getStatistics(self._info[pp.issue], "Issue ")

    def getBranch(self):
        self.getStatistics(self._info[pp.branch], "Branch")

    def getMemNewAccess(self):
        self.getStatistics(self._info[pp.mem_new], "NewAcc")

    def getMemAll(self):
        self.getStatistics(self._info[pp.mem], "Mem   ")

    def getLDS(self):
        self.getStatistics(self._info[pp.lds], "LDS   ")

    def getScalarUnit(self):
        self.getStatistics(self._info[pp.scalar], "Scalar")

    def getSIMD(self):
        self.getStatistics(self._info[pp.simd], "SIMD  ")

    def getInstStats(self):
        for index in range(len(self._inst)):
            print self._inst[index]

    def getAllStats(self):
        print "Cycle " + str(self._cycle_start) + " to " + str(self._cycle_end)
        self.getStall()
        self.getFetch()
        self.getIssue()
        self.getBranch()
        self.getMemNewAccess()
        self.getMemAll()
        self.getScalarUnit()
        self.getSIMD()
        self.getLDS()

    def plot(self, name):
        f = figure(webgl=True, plot_width=1580, plot_height=400)
        f.ray(self._info[name].keys(),
              self._info[name].values(),
              length=45,
              angle=90,
              angle_units="deg",
              color="#FB8072",
              line_width=2)
        return f


class Traces():

    def __init__(self, trace_files):

        self.trace_files = trace_files
        self.traces = []

        for trace in trace_files:
            t = Trace(trace)
            self.traces.append(t)

    def stat(self):
        for trace in self.traces:
            trace.processData()
            trace.saveToDatabase()
            # trace.processDatabase()
            trace.getAllStats()

    def plot(self, name):
        # output to static HTML file
        output_file(pp.strmap[name] + '.html')

        figures = []

        # Set y axis range
        x_max = 0
        y_max = 0
        for index in range(len(self.traces)):
            k_max = max(self.traces[index]._info[name].keys())
            v_max = max(self.traces[index]._info[name].values())
            x_max = max(x_max, k_max) * 1.1
            y_max = max(y_max, v_max) * 1.1

        for trace in self.traces:
            f = figure(webgl=True, plot_width=1580, plot_height=400,
                       x_range=(0, x_max), y_range=(0, y_max),
                       title=trace._file_name)
            # f.ray(trace._info[name].keys(),
            #       trace._info[name].values(),
            #       length=y_max,
            #       angle=270,
            #       angle_units="deg",
            #       color=c,
            #       line_width=2)
            # f.line(trace._info[name].keys(),
            #        trace._info[name].values(),
            #        color=c,
            #        line_width=2)
            f.circle(trace._info[name].keys(),
                     trace._info[name].values(),
                     color=trace._color,
                     size=5)
            figures.append(f)
        combined = figure(webgl=True, plot_width=1580, plot_height=400,
                          x_range=(0, x_max), y_range=(0, y_max),
                          title='Combined view')
        for trace in self.traces:
            # combined.ray(trace._info[name].keys(),
            #              trace._info[name].values(),
            #              length=y_max,
            #              angle=270,
            #              angle_units="deg",
            #              color=colors[index],
            #              line_width=2)
            # combined.line(trace._info[name].keys(),
            #               trace._info[name].values(),
            #               color=colors[index],
            #               line_width=2)
            combined.circle(trace._info[name].keys(),
                            trace._info[name].values(),
                            color=trace._color,
                            size=5)
        figures.append(combined)

        p = vplot(*figures)
        # p = vplot(figures[0], figures[1], figures[2], figures[3])
        show(p)


def main():
    # Arg parser
    parser = argparse.ArgumentParser(
        description='Multi2Sim simulation trace analyzer')
    parser.add_argument('traceFiles', nargs='+',
                        help='Uncompressed Multi2Sim trace file')

    args = parser.parse_args()

    traces = Traces(args.traceFiles)
    traces.stat()
    traces.plot(pp.mem_new)
    traces.plot(pp.stall)

if __name__ == '__main__':
    main()
