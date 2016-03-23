#!/usr/bin/python
""" This module contains helper functions to build database """

import os
import sqlite3
import re

import traceparser as tp

STAT_STALL = 0
STAT_FETCH = 1
STAT_ISSUE = 2
STAT_BRANCH = 3
STAT_MEM = 4
STAT_LDS = 5
STAT_SCALAR = 6
STAT_SIMD = 7
STAT_MEM_NEW_ALL = 8
STAT_MEM_NEW_LDS = 9
STAT_MEM_NEW_MM = 10
STAT_COUNT = 11

INST_START = 0
INST_LENGTH = 1
INST_FETCH = 2
INST_ISSUE = 3
INST_STALL = 4
INST_ACTIVE = 5
INST_CU = 6
INST_IB = 7
INST_WG = 8
INST_WF = 9
INST_UOP = 10
INST_ASM = 11
INST_LIFELITE = 12
INST_LIFE = 13
INST_LINE = 14
INST_COUNT = 15

MEM_NAME = 0
MEM_ACCESS_TYPE = 1
MEM_ACCESS_STATE = 2
MEM_ACCESS_LOCATION = 3
MEM_START = 4
MEM_LENGTH = 5
MEM_ADDR = 6
MEM_L1_ID = 7
MEM_L1_MISS_COUNT = 8
MEM_L2_ID = 9
MEM_L2_MISS_COUNT = 10
MEM_L3_ID = 11
MEM_L3_MISS_COUNT = 12
MEM_MM_ID = 13
MEM_MM_MISS_COUNT = 14
MEM_LINE = 15
MEM_ACCESS_ID = 16


class DatabaseBuilder(object):
    """ Database builder for trace """

    def __init__(self, trace_name):
        self.__trace_name = trace_name
        self.__trace = open(trace_name, "r")

        # Initialize statistics hashtables
        self.__stat_view = {}
        for index in range(STAT_COUNT):
            self.__stat_view[index] = {}

        self.__inst_view = {}

        self.__mem_view = {}

    def __inc_count(self, stat_name, cycle):
        """ Increment count of a statistic """
        count = 0
        stat_dict = self.__stat_view[stat_name]
        if cycle in stat_dict:
            count = stat_dict[cycle]
        stat_dict[cycle] = count + 1

    def __inc_inst_count(self, field_name, line):
        """ Increment count of an instruction """
        inst_id = tp.get_inst_uid(line)
        self.__inst_view[inst_id][field_name] += 1

    def __set_inst_field(self, field_name, count, line):
        """ Set count of a instruction statistic """
        inst_id = tp.get_inst_uid(line)
        self.__inst_view[inst_id][field_name] = count

    def __upd_inst_life(self, cycle, line):
        """ Update the life of an instruction """
        inst_id = tp.get_inst_uid(line)
        inst_stg = tp.get_stg(line)
        inst_life = str(cycle) + inst_stg + ";"
        self.__inst_view[inst_id][INST_LIFE] += inst_life

    def __upd_inst_life_end(self, line):
        """ Final update of instruction life """
        inst_id = tp.get_inst_uid(line)
        inst_info = self.__inst_view[inst_id][INST_LIFE].replace("\n", "")

        # Compact version of the life of an instruction
        inst_life = re.findall('(\d+)(\w+(-\w+)*)', inst_info)
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
        self.__inst_view[inst_id][INST_FETCH] = count["f"]
        self.__inst_view[inst_id][INST_STALL] = count["s"]
        self.__inst_view[inst_id][INST_ISSUE] = count["i"]
        self.__inst_view[inst_id][INST_ACTIVE] = count["a"]

        inst_life_string = inst_life_string[:-2]
        self.__inst_view[inst_id][INST_LIFELITE] = inst_life_string

    def __get_inst_stat(self, field_name, line):
        """ Get count of instruction """
        inst_id = tp.get_inst_uid(line)
        return self.__inst_view[inst_id][field_name]

    def __parse_inst(self, cycle, line_num, line):
        """ Parse instruction info """
        if 'si.' in line:
            if 'si.new_inst' in line:
                inst_id = tp.get_inst_uid(line)
                cu_id = tp.get_cu(line)
                ib_id = tp.get_ib(line)
                wg_id = tp.get_wg(line)
                wf_id = tp.get_wf(line)
                uop = tp.get_uop(line)
                asm = tp.get_asm(line)

                self.__inst_view[inst_id] = [0, 0, 0, 0, 0, 0, 0,
                                             0, 0, 0, 0, asm, "", "", 0]
                self.__set_inst_field(INST_START, cycle, line)
                self.__set_inst_field(INST_CU, cu_id, line)
                self.__set_inst_field(INST_IB, ib_id, line)
                self.__set_inst_field(INST_WG, wg_id, line)
                self.__set_inst_field(INST_WF, wf_id, line)
                self.__set_inst_field(INST_UOP, uop, line)
                self.__set_inst_field(INST_ASM, asm, line)
                self.__set_inst_field(INST_LINE, line_num, line)

                # Also handle stg="f"
                self.__inc_count(STAT_FETCH, cycle)
                self.__upd_inst_life(cycle, line)

            elif 'si.end_inst' in line:
                inst_start_cycle = self.__get_inst_stat(INST_START, line)
                self.__set_inst_field(INST_LENGTH, cycle -
                                      inst_start_cycle, line)
                self.__upd_inst_life(cycle, line)
                self.__upd_inst_life_end(line)

            elif 'si.inst' in line:
                if 'stg="s"' in line:
                    self.__inc_count(STAT_STALL, cycle)
                    self.__upd_inst_life(cycle, line)

                elif 'stg="i"' in line:
                    self.__inc_count(STAT_ISSUE, cycle)
                    self.__upd_inst_life(cycle, line)

                elif 'stg="mem' in line:
                    self.__inc_count(STAT_MEM, cycle)
                    self.__upd_inst_life(cycle, line)

                elif 'stg="lds' in line:
                    self.__inc_count(STAT_LDS, cycle)
                    self.__upd_inst_life(cycle, line)

                elif 'stg="bu' in line:
                    self.__inc_count(STAT_BRANCH, cycle)
                    self.__upd_inst_life(cycle, line)

                elif 'stg="su' in line:
                    self.__inc_count(STAT_SCALAR, cycle)
                    self.__upd_inst_life(cycle, line)

                elif 'stg="simd' in line:
                    self.__inc_count(STAT_SIMD, cycle)
                    self.__upd_inst_life(cycle, line)

    def __parse_mem(self, cycle, line_num, line):
        """ Parse memory info """
        if 'mem.' in line:
            if 'mem.new_access ' in line:
                self.__inc_count(STAT_MEM_NEW_ALL, cycle)
                if 'LDS' in line:
                    self.__inc_count(STAT_MEM_NEW_LDS, cycle)
                else:
                    self.__inc_count(STAT_MEM_NEW_MM, cycle)

                mem_access_name = tp.get_name(line)
                mem_access_addr = tp.get_name(line)
                mem_access_type = tp.get_type(line)
                mem_access_state = tp.get_state(line)
                mem_access_location = tp.get_state_location(line)
                mem_access_id = tp.get_access_id(line)
                self.__mem_view[mem_access_name] = [mem_access_name,
                                                    mem_access_type,
                                                    mem_access_state,
                                                    mem_access_location,
                                                    cycle,
                                                    -1,
                                                    mem_access_addr,
                                                    -1, -1,
                                                    -1, -1,
                                                    -1, -1,
                                                    -1, -1,
                                                    line_num,
                                                    mem_access_id]

            elif 'mem.end_access ' in line:
                mem_access_name = tp.get_name(line)
                mem_access_start = self.__mem_view[
                    mem_access_name][MEM_START]
                mem_access_length = cycle - mem_access_start
                self.__mem_view[mem_access_name][
                    MEM_LENGTH] = mem_access_length

    def __parse_trace(self):
        """ Parse trace and save info to internal tables """
        # Start from cycle 0
        cycle = 0
        line_num = 0
        for line in self.__trace:
            line_num += 1
            if 'clk' in line:
                # Find which cycle and inc cycle counter
                cycle = int(re.search('(\d+)', line).group(1))
                # Set cycle entry in all hashtable to 0
                for index in range(STAT_COUNT):
                    self.__stat_view[index][cycle] = 0

            self.__parse_inst(cycle, line_num, line)
            self.__parse_mem(cycle, line_num, line)

    def __write_database_stat(self):
        """ Write stat to database """
        database = sqlite3.connect(self.__trace_name + '.db')
        cursor = database.cursor()

        # Create stat view table
        cursor.execute('''CREATE TABLE IF NOT EXISTS cycle
            (cycle INTEGER, stall INTEGER,
             fetch INTEGER, issue INTEGER,
             branch INTEGER, mem INTEGER,
             lds INTEGER, scalar INTEGER,
             simd INTEGER, mem_new_all INTEGER,
             mem_new_lds INTEGER, mem_new_mm INTEGER)''')

        # Add stat view data
        for key in self.__stat_view[STAT_STALL].keys():
            cycle = key
            stall = self.__stat_view[STAT_STALL][key]
            fetch = self.__stat_view[STAT_FETCH][key]
            issue = self.__stat_view[STAT_ISSUE][key]
            branch = self.__stat_view[STAT_BRANCH][key]
            mem = self.__stat_view[STAT_MEM][key]
            lds = self.__stat_view[STAT_LDS][key]
            scalar = self.__stat_view[STAT_SCALAR][key]
            simd = self.__stat_view[STAT_SIMD][key]
            mem_new_all = self.__stat_view[STAT_MEM_NEW_ALL][key]
            mem_new_lds = self.__stat_view[STAT_MEM_NEW_LDS][key]
            mem_new_mm = self.__stat_view[STAT_MEM_NEW_MM][key]

            cursor.execute('INSERT INTO cycle VALUES\
                           (?, ?, ?, ?, \
                            ?, ?, ?, ?, \
                            ?, ?, ?, ?)',
                           (cycle, stall, fetch, issue,
                            branch, mem, lds, scalar,
                            simd, mem_new_all, mem_new_lds, mem_new_mm))

        # Save (commit) the changes
        database.commit()

        # We can also close the connection if we are done with it.
        # Just be sure any changes have been committed or they will be lost.
        database.close()

    def __write_database_inst(self):
        """ Write inst to database """
        database = sqlite3.connect(self.__trace_name + '.db')
        cursor = database.cursor()

        # Create instruction view table
        cursor.execute('''CREATE TABLE IF NOT EXISTS inst
            (inst_id text,
             cycle_start INTEGER, length INTEGER, \
             fetch INTEGER, issue INTEGER, \
             stall INTEGER, active INTEGER, \
             cu INTEGER, ib INTEGER, wg INTEGER, wf INTEGER, \
             uop INTEGER, asm text, lifelite text, life text, \
             line INTEGER)''')

        # Add instruction view data
        for key in self.__inst_view:
            inst_id = key
            cycle_start = self.__inst_view[key][INST_START]
            length = self.__inst_view[key][INST_LENGTH]
            fetch = self.__inst_view[key][INST_FETCH]
            issue = self.__inst_view[key][INST_ISSUE]
            stall = self.__inst_view[key][INST_STALL]
            active = self.__inst_view[key][INST_ACTIVE]
            cu_id = self.__inst_view[key][INST_CU]
            ib_id = self.__inst_view[key][INST_IB]
            wg_id = self.__inst_view[key][INST_WG]
            wf_id = self.__inst_view[key][INST_WF]
            uop = self.__inst_view[key][INST_UOP]
            asm = self.__inst_view[key][INST_ASM]
            lifelite = self.__inst_view[key][INST_LIFELITE]
            life = self.__inst_view[key][INST_LIFE]
            line = self.__inst_view[key][INST_LINE]

            cursor.execute('INSERT INTO inst VALUES(?, ?, ?, ?, \
                                                    ?, ?, ?, ?, \
                                                    ?, ?, ?, ?, \
                                                    ?, ?, ?, ?)',
                           (inst_id, cycle_start, length, fetch,
                            issue, stall, active, cu_id,
                            ib_id, wg_id, wf_id, uop,
                            asm, lifelite, life, line))

        # Save (commit) the changes
        database.commit()

        # We can also close the connection if we are done with it.
        # Just be sure any changes have been committed or they will be lost.
        database.close()

    def __write_database_mem(self):
        """ Write mem to database """
        database = sqlite3.connect(self.__trace_name + '.db')
        cursor = database.cursor()

        # Create memory access table
        cursor.execute('''CREATE TABLE IF NOT EXISTS memory
            (name text, \
             access_type text, access_state text, access_location text, \
             cycle_start INTEGER, length INTEGER, addr text, \
             l1_id text, l1_miss_count INTEGER, \
             l2_id text, l2_miss_count INTEGER, \
             l3_id text, l3_miss_count INTEGER, \
             mm_id text, mm_miss_count INTEGER, \
             line INTEGER, mem_access_id INTEGER)''')

        # Add memory access data
        for key in self.__mem_view:
            name = self.__mem_view[key][MEM_NAME]
            access_type = self.__mem_view[key][MEM_ACCESS_TYPE]
            access_state = self.__mem_view[key][MEM_ACCESS_STATE]
            access_location = self.__mem_view[key][MEM_ACCESS_LOCATION]
            start = self.__mem_view[key][MEM_START]
            length = self.__mem_view[key][MEM_LENGTH]
            addr = self.__mem_view[key][MEM_ADDR]
            l1_id = self.__mem_view[key][MEM_L1_ID]
            l1_miss_count = self.__mem_view[key][MEM_L1_MISS_COUNT]
            l2_id = self.__mem_view[key][MEM_L2_ID]
            l2_miss_count = self.__mem_view[key][MEM_L2_MISS_COUNT]
            l3_id = self.__mem_view[key][MEM_L3_ID]
            l3_miss_count = self.__mem_view[key][MEM_L3_MISS_COUNT]
            mm_id = self.__mem_view[key][MEM_MM_ID]
            mm_miss_count = self.__mem_view[key][MEM_MM_MISS_COUNT]
            line = self.__mem_view[key][MEM_LINE]
            mem_access_id = self.__mem_view[key][MEM_ACCESS_ID]

            cursor.execute('INSERT INTO memory VALUES(?, ?, ?, ?, \
                                                 ?, ?, ?, \
                                                 ?, ?, \
                                                 ?, ?, \
                                                 ?, ?, \
                                                 ?, ?, \
                                                 ?, ?)',
                           (name, access_type, access_state, access_location,
                            start, length, addr,
                            l1_id, l1_miss_count,
                            l2_id, l2_miss_count,
                            l3_id, l3_miss_count,
                            mm_id, mm_miss_count,
                            line, mem_access_id))

        # Save (commit) the changes
        database.commit()

        # We can also close the connection if we are done with it.
        # Just be sure any changes have been committed or they will be lost.
        database.close()

    def __write_database(self):
        """ Write to database """
        self.__write_database_stat()
        self.__write_database_inst()
        self.__write_database_mem()

    def run(self):
        """ Run parser and save to database """
        self.__parse_trace()
        self.__write_database()
        if os.path.isfile(self.__trace_name + ".db"):
            return sqlite3.connect(self.__trace_name + '.db')


def load_database(trace_name):
    """ Load database """
    if os.path.isfile(trace_name + ".db"):
        return sqlite3.connect(trace_name + '.db')
    else:
        db_builder = DatabaseBuilder(trace_name)
        return db_builder.run()
