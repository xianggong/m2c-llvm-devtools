#!/usr/bin/python
""" Trace analyzer for Multi2Sim """


import argparse

import memparser as mp


class Report(object):
    """Memory report"""

    def __init__(self, report_file):
        self.__report_file = report_file
        self.dataframe = mp.get_df(report_file)

    def get_


class Reports(object):
    """ Plotter for memory reports """

    def __init__(self, report_files):
        self.__report_files = report_files
        self.__reports = None
        for report in self.__report_files:
            self.__reports.append(Report(report))


def main():
    """ Main entry for Multi2Sim Memory Report Analyzer """
    # Arg parser
    parser = argparse.ArgumentParser(
        description='Multi2Sim simulation memory report analyzer')
    parser.add_argument('memRptFiles', nargs='+',
                        help='Multi2Sim memory report files')

if __name__ == '__main__':
    main()
