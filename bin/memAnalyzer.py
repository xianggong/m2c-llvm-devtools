#!/usr/bin/python
""" Trace analyzer for Multi2Sim """


import argparse
import pandas as pd
import numpy as np
from bokeh.charts import Histogram, Bar, Donut
from bokeh.plotting import figure, show, output_file
from bokeh.io import vplot, gridplot
from bokeh.charts import defaults
import memparser as mp


class Report(object):
    """Memory report"""

    def __init__(self, report_file):
        self.__report_file = report_file
        self.__dataframe = mp.get_df(report_file)

    def get_dataframe(self):
        """ Get associated dataframe """
        return self.__dataframe

    def get_dataframe_by_module(self, module_name='l1'):
        """ Get dataframe by module name """
        dataframe = self.__dataframe
        return dataframe.loc[dataframe['ModuleName'] == module_name]

    def __get_figures_by_moddule(self, module_name='l1'):
        module_df = self.get_dataframe_by_module(module_name)

        figures_module = []

        # Plot accesses
        access_cols = ['ModuleName',
                       'Accesses',
                       'Hits',
                       'Misses',
                       'HitRatio',
                       'Evictions',
                       'Retries']
        access_df = module_df[access_cols]
        access_df_main = pd.melt(access_df,
                                 value_vars=['Hits', 'Misses'],
                                 var_name='type')
        bar_main = Bar(access_df_main, values='value', stack='type')
        figures_module.append(bar_main)

        return figures_module

    def get_info(self):
        """ Get information of the report: figures and dataframe """
        info = {}
        figures = []

        for module in self.__dataframe['ModuleName'].unique():
            figures.extend(self.__get_figures_by_moddule(module))

        info['figures'] = figures
        info['dataframe'] = self.__dataframe

        return info


class Reports(object):
    """ Plotter for memory reports """

    def __init__(self, report_files):
        self.__report_files = report_files
        self.__reports = []
        for report in self.__report_files:
            self.__reports.append(Report(report))

    def plot(self):

        output_file_name = 'mem_report'
        output_file_name += '.html'
        output_file_title = 'Mem report'
        output_file(output_file_name, title=output_file_title)

        # Get all figures
        figures = []
        for report in self.__reports:
            figures.append(report.get_info()['figures'])

        # Plot all figures
        plot = gridplot(figures)
        show(plot)


def main():
    """ Main entry for Multi2Sim Memory Report Analyzer """

    # Arg parser
    parser = argparse.ArgumentParser(
        description='Multi2Sim simulation memory report analyzer')
    parser.add_argument('memRptFiles', nargs='+',
                        help='Multi2Sim memory report files')
    args = parser.parse_args()

    reports = Reports(args.memRptFiles)
    reports.plot()

if __name__ == '__main__':
    main()
