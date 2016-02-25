#!/usr/bin/python

import matplotlib.pyplot as plt
import argparse
import re


class Trace:

    def __init__(self, input_file):
        self.input_file_ = input_file
        self.trace_ = open(input_file, "r")
        self.is_cycle_range_set_ = False
        self.cycle_start_ = 0
        self.cycle_end_ = 0

        self.stall_ = {}
        self.fetch_ = {}
        self.issue_ = {}
        self.branch_ = {}
        self.mem_new_access_ = {}
        self.mem_ = {}
        self.lds_ = {}
        self.scalar_unit_ = {}
        self.simd_ = {}

        self.inst_ = {}

    def setCycleRange(self, cycle_start, cycle_end):
        self.is_cycle_range_set_ = True
        self.cycle_start_ = cycle_start
        self.cycle_end_ = cycle_end

    def insertDic(self, dict, cycle_index):
        count_in_cycle = 0
        if cycle_index in dict:
            count_in_cycle = dict[cycle_index]
        dict[cycle_index] = count_in_cycle + 1

    def processData(self):
        if self.is_cycle_range_set_:
            self.cycle_count = self.cycle_end_ - self.cycle_start_
        else:
            self.cycle_count = 0

        cycle_index = 0
        for line in self.trace_:
            if re.search('clk', line):
                cycle = int(re.search('(\d+)', line).group(1))
                if self.is_cycle_range_set_:
                    if cycle in range(self.cycle_start_, self.cycle_end_):
                        cycle_index = cycle
                        self.stall_[cycle_index] = 0
                        self.fetch_[cycle_index] = 0
                        self.issue_[cycle_index] = 0
                        self.branch_[cycle_index] = 0
                        self.mem_new_access_[cycle_index] = 0
                        self.scalar_unit_[cycle_index] = 0
                        self.mem_[cycle_index] = 0
                        self.simd_[cycle_index] = 0
                        self.lds_[cycle_index] = 0
                    else:
                        break
                else:
                    self.cycle_count += 1
                    cycle_index = cycle
                    self.cycle_end_ = self.cycle_count
                    self.stall_[cycle_index] = 0
                    self.fetch_[cycle_index] = 0
                    self.issue_[cycle_index] = 0
                    self.branch_[cycle_index] = 0
                    self.mem_new_access_[cycle_index] = 0
                    self.scalar_unit_[cycle_index] = 0
                    self.mem_[cycle_index] = 0
                    self.simd_[cycle_index] = 0
                    self.lds_[cycle_index] = 0

            # Processing data
            elif re.search('stg="s"', line):
                self.insertDic(self.stall_, cycle_index)
                inst_id = int(
                    re.search(' id=\d+', line).group(0).split('=')[1])
                self.inst_[inst_id][4] += 1

            elif re.search('stg="f"', line):
                self.insertDic(self.fetch_, cycle_index)
                inst_id = int(
                    re.search(' id=\d+', line).group(0).split('=')[1])
                # list contains: 0 = start cycle
                #                1 = whole count of cycles
                #                2 = fetch cycles, default 4
                #                3 = issue cycles
                #                4 = stall cycles
                #                5 = active cycles
                #                6 = assembly
                self.inst_[inst_id] = [cycle_index, 0, 4, 0, 0, 0, line]

            elif re.search('stg="i"', line):
                self.insertDic(self.issue_, cycle_index)
                inst_id = int(
                    re.search(' id=\d+', line).group(0).split('=')[1])
                self.inst_[inst_id][3] += 1

            elif re.search('stg="bu', line):
                self.insertDic(self.branch_, cycle_index)
                inst_id = int(
                    re.search(' id=\d+', line).group(0).split('=')[1])
                self.inst_[inst_id][5] += 1

            elif re.search('mem.new_access ', line):
                self.insertDic(self.mem_new_access_, cycle_index)

            elif re.search('stg="mem', line):
                self.insertDic(self.mem_, cycle_index)

            elif re.search('stg="su', line):
                self.insertDic(self.scalar_unit_, cycle_index)
                inst_id = int(
                    re.search(' id=\d+', line).group(0).split('=')[1])
                self.inst_[inst_id][5] += 1

            elif re.search('stg="simd', line):
                self.insertDic(self.simd_, cycle_index)
                inst_id = int(
                    re.search(' id=\d+', line).group(0).split('=')[1])
                self.inst_[inst_id][5] += 1

            elif re.search('stg="lds', line):
                self.insertDic(self.lds_, cycle_index)

            # elif re.search('si.new_inst ', line):
            #     inst_id = int(
            #         re.search(' id=\d+', line).group(0).split('=')[1])
            #     print "New inst: " + str(inst_id)
            #     self.inst_[inst_id] = cycle_index

            elif re.search('si.end_inst ', line):
                inst_id = int(
                    re.search(' id=\d+', line).group(0).split('=')[1])
                inst_start_cycle = self.inst_[inst_id][0]
                self.inst_[inst_id][1] = cycle_index - inst_start_cycle
                # print self.inst_[inst_id]

    def getStatistics(self, dict, dict_name):

        # Count of all given values in dict
        count = sum(dict.values())

        # Ratio of cycles with non-zero values
        cycle_count = 0
        for value in dict.values():
            if value != 0:
                cycle_count += 1
        cycle_ratio = float(cycle_count) / float(self.cycle_count) * 100

        print("  %s\t\t%d\t%f" % (dict_name, count, cycle_ratio))

    def plotStatistics(self, dict, dict_name):
        plt.style.use('ggplot')
        f, (ax0) = plt.subplots(1)
        ax0.plot(dict.keys(), dict.values())
        ax0.set_title(dict_name)
        plt.draw()

    # Statistics getters
    def getStall(self):
        self.getStatistics(self.stall_, "Stall ")

    def getFetch(self):
        self.getStatistics(self.fetch_, "Fetch ")

    def getIssue(self):
        self.getStatistics(self.issue_, "Issue ")

    def getBranch(self):
        self.getStatistics(self.branch_, "Branch")

    def getMemNewAccess(self):
        self.getStatistics(self.mem_new_access_, "NewAcc")

    def getMemAll(self):
        self.getStatistics(self.mem_, "Mem   ")

    def getScalarUnit(self):
        self.getStatistics(self.scalar_unit_, "Scalar")

    def getSIMD(self):
        self.getStatistics(self.simd_, "SIMD  ")

    def getLDS(self):
        self.getStatistics(self.lds_, "LDS   ")

    def getAllStats(self):
        print "Cycle " + str(self.cycle_start_) + " to " + str(self.cycle_end_)
        self.getStall()
        self.getFetch()
        self.getIssue()
        self.getBranch()
        self.getMemNewAccess()
        self.getMemAll()
        self.getScalarUnit()
        self.getSIMD()
        self.getLDS()

    # Statistics renderers
    def plotStall(self):
        self.plotStatistics(self.stall_, "Stall")

    def plotFetch(self):
        self.plotStatistics(self.fetch_, "Fetch")

    def plotIssue(self):
        self.plotStatistics(self.issue_, "Issue")

    def plotBranch(self):
        self.plotStatistics(self.branch_, "Branch")

    def plotMemNewAccess(self):
        self.plotStatistics(self.mem_new_access_, "Mem New Access")

    def plotMemAll(self):
        self.plotStatistics(self.mem_, "Mem")

    def plotScalarUnit(self):
        self.plotStatistics(self.scalar_unit_, "Scalar Unit")

    def plotSIMD(self):
        self.plotStatistics(self.simd_, "SIMD")

    def plotLDS(self):
        self.plotStatistics(self.lds_, "LDS")

    def plotInstCycles(self):
        plt.style.use('ggplot')
        f, (ax0) = plt.subplots(1)
        ax0.plot(self.inst_.keys(), self.inst_.values())
        ax0.set_title("Inst cycles")
        plt.draw()

    def plotAll(self):
        self.plotStall()
        self.plotFetch()
        self.plotIssue()
        self.plotBranch()
        self.plotMemNewAccess()
        self.plotMemAll()
        self.plotScalarUnit()
        self.plotSIMD()
        self.plotLDS()


class PlotCompare():

    def __init__(self):
        self.figure = 0

    def plot(self, dict0, dict1, filename0, filename1, dict_name):
        plt.style.use('ggplot')

        f, (ax0, ax1, ax2) = plt.subplots(3, sharex=True, sharey=True)

        # Trace 0
        ax0.plot(dict0.keys(),
                 dict0.values(),
                 label=filename0,
                 color=plt.rcParams['axes.color_cycle'][0])
        ax0.set_title(dict_name + ": " + filename0)
        ax0.legend()

        # Trace 1
        ax1.plot(dict1.keys(),
                 dict1.values(),
                 label=filename1,
                 color=plt.rcParams['axes.color_cycle'][1])
        ax1.set_title(dict_name + ": " + filename1)
        ax1.legend()

        # Both traces
        ax2.plot(dict0.keys(),
                 dict0.values(),
                 label=filename0,
                 color=plt.rcParams['axes.color_cycle'][0])
        ax2.plot(dict1.keys(),
                 dict1.values(),
                 label=filename1,
                 color=plt.rcParams['axes.color_cycle'][1])
        ax2.set_title(dict_name + ": " + filename0 + " + " + filename1)
        ax2.legend()

        # Draw
        plt.draw()

    def show(self):
        plt.show()


def main():
    # Arg parser
    parser = argparse.ArgumentParser(
        description='Multi2Sim simulation trace analyzer')
    parser.add_argument('traceFile', help='Uncompressed Multi2Sim trace file')
    parser.add_argument('-a', "--additional", help='Additional trace file')
    parser.add_argument('-r', "--range", nargs=2, help='Cycle range')

    args = parser.parse_args()

    if args.additional is not None:
        trace0 = Trace(args.traceFile)
        trace1 = Trace(args.additional)

        if args.range is not None:
            trace0.setCycleRange(int(args.range[0]), int(args.range[1]))
            trace1.setCycleRange(int(args.range[0]), int(args.range[1]))

        trace0.processData()
        trace1.processData()

        trace0.getAllStats()
        trace1.getAllStats()

        # Compare results visually
        pltcmp = PlotCompare()

        pltcmp.plot(trace0.stall_, trace1.stall_,
                    trace0.input_file_, trace1.input_file_, "Stall")

        pltcmp.plot(trace0.fetch_, trace1.fetch_,
                    trace0.input_file_, trace1.input_file_, "Fetch")

        pltcmp.plot(trace0.issue_, trace1.fetch_,
                    trace0.input_file_, trace1.input_file_, "Issue")

        pltcmp.plot(trace0.branch_, trace1.branch_,
                    trace0.input_file_, trace1.input_file_, "Branch")

        pltcmp.plot(trace0.mem_, trace1.mem_,
                    trace0.input_file_, trace1.input_file_, "Mem")

        pltcmp.plot(trace0.mem_new_access_, trace1.mem_new_access_,
                    trace0.input_file_, trace1.input_file_, "Mem New Access")

        pltcmp.plot(trace0.scalar_unit_, trace1.scalar_unit_,
                    trace0.input_file_, trace1.input_file_, "Scalar Unit")

        pltcmp.plot(trace0.simd_, trace1.simd_,
                    trace0.input_file_, trace1.input_file_, "SIMD")

        pltcmp.plot(trace0.lds_, trace1.lds_,
                    trace0.input_file_, trace1.input_file_, "LDS")

        # pltcmp.plot(trace0.inst_, trace1.inst_,
        #             trace0.input_file_, trace1.input_file_, "Inst Cycle")

        pltcmp.show()

    else:
        trace = Trace(args.traceFile)
        if args.range is not None:
            trace.setCycleRange(int(args.range[0]), int(args.range[1]))
        trace.processData()
        trace.plotMemNewAccess()


if __name__ == '__main__':
    main()
