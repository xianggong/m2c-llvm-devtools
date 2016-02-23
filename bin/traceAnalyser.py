#!/usr/bin/python

import matplotlib.pyplot as plt
import argparse
import re


class Trace:

    def __init__(self, input_file):
        # Read file
        self.trace_ = open(input_file, "r")
        self.is_cycle_range_set_ = False
        self.cycle_start_ = 0
        self.cycle_end_ = 0

        self.stall_ = {}
        self.fetch_ = {}
        self.issue_ = {}
        self.branch_ = {}
        self.mem_new_access_ = {}
        self.scalar_unit_ = {}
        self.mem_ = {}
        self.simd_ = {}
        self.lds_ = {}

    def setCycleRange(self, cycle_start, cycle_end):
        self.is_cycle_range_set_ = True
        self.cycle_start_ = cycle_start
        self.cycle_end_ = cycle_end

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
                count_in_cycle = 0
                if cycle_index in self.stall_:
                    count_in_cycle = self.stall_[cycle_index]
                self.stall_[cycle_index] = count_in_cycle + 1

            elif re.search('stg="f"', line):
                count_in_cycle = 0
                if cycle_index in self.fetch_:
                    count_in_cycle = self.fetch_[cycle_index]
                self.fetch_[cycle_index] = count_in_cycle + 1

            elif re.search('stg="i"', line):
                count_in_cycle = 0
                if cycle_index in self.issue_:
                    count_in_cycle = self.issue_[cycle_index]
                self.issue_[cycle_index] = count_in_cycle + 1

            elif re.search('stg="bu', line):
                count_in_cycle = 0
                if cycle_index in self.branch_:
                    count_in_cycle = self.branch_[cycle_index]
                self.branch_[cycle_index] = count_in_cycle + 1

            elif re.search('mem.new_access ', line):
                count_in_cycle = 0
                if cycle_index in self.mem_new_access_:
                    count_in_cycle = self.mem_new_access_[cycle_index]
                self.mem_new_access_[cycle_index] = count_in_cycle + 1

            elif re.search('stg="mem', line):
                count_in_cycle = 0
                if cycle_index in self.mem_:
                    count_in_cycle = self.mem_[cycle_index]
                self.mem_[cycle_index] = count_in_cycle + 1

            elif re.search('stg="su', line):
                count_in_cycle = 0
                if cycle_index in self.scalar_unit_:
                    count_in_cycle = self.scalar_unit_[cycle_index]
                self.scalar_unit_[cycle_index] = count_in_cycle + 1

            elif re.search('stg="simd', line):
                count_in_cycle = 0
                if cycle_index in self.simd_:
                    count_in_cycle = self.simd_[cycle_index]
                self.simd_[cycle_index] = count_in_cycle + 1

            elif re.search('stg="lds', line):
                count_in_cycle = 0
                if cycle_index in self.lds_:
                    count_in_cycle = self.lds_[cycle_index]
                self.lds_[cycle_index] = count_in_cycle + 1

    def getStatistics(self, dict, dict_name):

        # Count of all given values in dict
        count = sum(dict.values())

        # Ratio of cycles with non-zero values
        cycle_count = 0
        for value in dict.values():
            if value != 0:
                cycle_count += 1
        cycle_ratio = float(cycle_count) / float(self.cycle_count) * 100

        print "  " + dict_name + " count = " + str(count)
        print "  " + dict_name + " cycle ratio = " + str(cycle_ratio) + "%"

    def plotStatistics(self, dict, dict_name):
        plt.style.use('ggplot')
        plt.plot(dict.keys(), dict.values())
        plt.title(dict_name)
        plt.show()

    # Statistics getters
    def getStall(self):
        self.getStatistics(self.stall_, "Stall")

    def getFetch(self):
        self.getStatistics(self.fetch_, "Fetch")

    def getIssue(self):
        self.getStatistics(self.issue_, "Issue")

    def getBranch(self):
        self.getStatistics(self.branch_, "Branch")

    def getMemNewAccess(self):
        self.getStatistics(self.mem_new_access_, "Mem New Access")

    def getMemAll(self):
        self.getStatistics(self.mem_, "Mem")

    def getScalarUnit(self):
        self.getStatistics(self.scalar_unit_, "Scalar Unit")

    def getSIMD(self):
        self.getStatistics(self.simd_, "SIMD")

    def getLDS(self):
        self.getStatistics(self.lds_, "LDS")

    def getAll(self):
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

        trace0.getAll()
        trace1.getAll()

        trace0.plotAll()
        trace1.plotAll()

        plt.style.use('ggplot')

        # Trace 0
        plt.subplot(3, 1, 1)
        plt.plot(trace0.mem_new_access_.keys(),
                 trace0.mem_new_access_.values(),
                 label=args.traceFile,
                 color=plt.rcParams['axes.color_cycle'][0])
        plt.title("New Mem Access: " + args.traceFile)
        plt.legend()

        # Trace 1
        plt.subplot(3, 1, 2)
        plt.plot(trace1.mem_new_access_.keys(),
                 trace1.mem_new_access_.values(),
                 label=args.additional,
                 color=plt.rcParams['axes.color_cycle'][1])
        plt.title("New Mem Access: " + args.additional)
        plt.legend()

        # Both traces
        plt.subplot(3, 1, 3)
        plt.plot(trace0.mem_new_access_.keys(),
                 trace0.mem_new_access_.values(),
                 label=args.traceFile,
                 color=plt.rcParams['axes.color_cycle'][0])
        plt.plot(trace1.mem_new_access_.keys(),
                 trace1.mem_new_access_.values(),
                 label=args.additional,
                 color=plt.rcParams['axes.color_cycle'][1])
        plt.title("New Mem Access: " + args.traceFile +
                  " + " + args.additional)
        plt.legend()

        plt.show()

    else:
        trace = Trace(args.traceFile)
        if args.range is not None:
            trace.setCycleRange(int(args.range[0]), int(args.range[1]))
        trace.processData()
        trace.plotMemNewAccess()


if __name__ == '__main__':
    main()
