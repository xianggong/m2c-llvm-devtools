#!/usr/bin/python
""" Trace analyzer for Multi2Sim """


import argparse
import collections
import numpy as np
import pandas as pd
from bokeh.charts import Bar
from bokeh.plotting import show, output_file
from bokeh.models.widgets import Panel, Tabs
from bokeh.io import gridplot
from bokeh.charts import defaults
import memparser as mp

SCREEN_WIDTH = 1560

defaults.width = int(SCREEN_WIDTH * 0.3)
defaults.height = int(SCREEN_WIDTH * 0.22)


def is_all_zeros(column):
    unique = column.unique()
    test = len(unique) == 1 and 0 in unique
    return bool(test)


class Report(object):
    """Memory report"""

    def __init__(self, report_file=None, dataframe=None):
        self.__dataframe = None
        if dataframe:
            self.__dataframe = dataframe
            return
        if report_file:
            self.__dataframe = mp.get_df(report_file)

    def substract(self, other):
        """ Substract 2 report """
        my_df = self.__dataframe
        other_df = other.get_dataframe()

        col_index = ['GPUConf',
                     'InstSched',
                     'WorkSize',
                     'ModuleName',
                     'ModuleId',

                     'Sets',
                     'Assoc',
                     'Policy',
                     'BlockSize',
                     'Latency',
                     'Ports']

        sub_index = ['Accesses',
                     'Hits',
                     'Misses',
                     'HitRatio',
                     'Evictions',
                     'Retries',

                     'Reads',
                     'ReadRetries',
                     'BlockingReads',
                     'NonBlockingReads',
                     'ReadHits',
                     'ReadMisses',

                     'Writes',
                     'WriteRetries',
                     'BlockingWrites',
                     'NonBlockingWrites',
                     'WriteHits',
                     'WriteMisses',

                     'NCWrites',
                     'NCWriteRetries',
                     'NCBlockingWrites',
                     'NCNonBlockingWrites',
                     'NCWriteHits',
                     'NCWriteMisses',
                     'Prefetches',
                     'PrefetchAborts',
                     'UselessPrefetches',

                     'NoRetryAccesses',
                     'NoRetryHits',
                     'NoRetryMisses',
                     'NoRetryHitRatio',
                     'NoRetryReads',
                     'NoRetryReadHits',
                     'NoRetryReadMisses',
                     'NoRetryWrites',
                     'NoRetryWriteHits',
                     'NoRetryWriteMisses',
                     'NoRetryNCWrites',
                     'NoRetryNCWriteHits',
                     'NoRetryNCWriteMisses']

        unchanged_df = my_df[col_index]
        substract_df = my_df[sub_index] - other_df[sub_index]
        self.__dataframe = pd.concat([unchanged_df, substract_df], axis=1)

    def get_dataframe(self):
        """ Get associated dataframe """
        return self.__dataframe

    def get_dataframe_by_module(self, module_name='l1'):
        """ Get dataframe by module name """
        dataframe = self.__dataframe
        return dataframe.loc[dataframe['ModuleName'] == module_name]

    def __get_figure_bar(self, dataframe_main, column_name, xlabel, ylabel):
        if not is_all_zeros(dataframe_main[column_name]):
            mean = np.round_(dataframe_main[column_name].mean(), 4)
            bar_ratio = Bar(dataframe_main,
                            values=column_name,
                            label='ModuleId',
                            xlabel=xlabel,
                            ylabel=ylabel,
                            title='Avg: ' + column_name + '=' + str(mean))
            return bar_ratio

    def __get_figure_bar_stack(self, dataframe_main, column_names,
                               xlabel, ylabel):
        dataframe_melt = pd.melt(dataframe_main,
                                 id_vars='ModuleId',
                                 value_vars=column_names,
                                 var_name='type',
                                 value_name='count')
        if not is_all_zeros(dataframe_melt['count']):
            title = 'Avg:'
            for column in column_names:
                mean = np.round_(dataframe_main[column].mean(), 4)
                title += column + '=' + str(mean) + ' '
            mean = np.round_(dataframe_melt['count'].mean(), 4)
            bar_stack = Bar(dataframe_melt,
                            values='count',
                            label='ModuleId',
                            stack='type',
                            legend='top_right',
                            xlabel=xlabel,
                            ylabel=ylabel,
                            title=title)
            return bar_stack

    def __get_figures_module_access(self, module_name='l1'):
        module_df = self.get_dataframe_by_module(module_name)

        figures_module = []

        # Plot accesses
        access_cols = ['ModuleName',
                       'ModuleId',
                       'Accesses',
                       'Hits',
                       'Misses',
                       'HitRatio',
                       'Evictions',
                       'Retries']
        access_df = module_df[access_cols]

        fig_bar = self.__get_figure_bar(access_df, 'HitRatio',
                                        module_name, 'Hit Ratio')
        if fig_bar:
            figures_module.append(fig_bar)

        fig_bar_stack = self.__get_figure_bar_stack(access_df,
                                                    ['Hits', 'Misses'],
                                                    module_name,
                                                    'Access Count')
        if fig_bar_stack:
            figures_module.append(fig_bar_stack)

        columns_misc = ['Evictions', 'Retries']
        for column in columns_misc:
            fig_bar = self.__get_figure_bar(
                access_df, column, module_name, 'Count')
            if fig_bar:
                figures_module.append(fig_bar)

        return figures_module

    def __get_figures_module_reads(self, module_name='l1'):
        module_df = self.get_dataframe_by_module(module_name)

        figures_module = []

        # Plot accesses
        access_cols = ['ModuleName',
                       'ModuleId',
                       'Reads',
                       'ReadRetries',
                       'BlockingReads',
                       'NonBlockingReads',
                       'ReadHits',
                       'ReadMisses']
        access_df = module_df[access_cols]

        fig_bar_stack = self.__get_figure_bar_stack(access_df,
                                                    ['ReadHits', 'ReadMisses'],
                                                    module_name,
                                                    'Access Count')
        figures_module.append(fig_bar_stack)

        columns_misc = ['ReadRetries', 'BlockingReads', 'NonBlockingReads']
        for column in columns_misc:
            fig_bar = self.__get_figure_bar(
                access_df, column, module_name, 'Count')
            if fig_bar:
                figures_module.append(fig_bar)

        return figures_module

    def __get_figures_module_writes(self, module_name='l1'):
        module_df = self.get_dataframe_by_module(module_name)

        figures_module = []

        # Plot accesses
        access_cols = ['ModuleName',
                       'ModuleId',
                       'Writes',
                       'WriteRetries',
                       'BlockingWrites',
                       'NonBlockingWrites',
                       'WriteHits',
                       'WriteMisses']
        access_df = module_df[access_cols]

        fig_bar_stack = self.__get_figure_bar_stack(
            access_df, ['WriteHits', 'WriteMisses'],
            module_name, 'Access Count')
        if fig_bar_stack:
            figures_module.append(fig_bar_stack)

        columns_misc = ['WriteRetries',
                        'BlockingWrites',
                        'NonBlockingWrites']
        for column in columns_misc:
            fig_bar = self.__get_figure_bar(
                access_df, column, module_name, 'Count')
            if fig_bar:
                figures_module.append(fig_bar)

        return figures_module

    def __get_figures_module_ncwrites(self, module_name='l1'):
        module_df = self.get_dataframe_by_module(module_name)

        figures_module = []

        # Plot accesses
        access_cols = ['ModuleName',
                       'ModuleId',
                       'NCWrites',
                       'NCWriteRetries',
                       'NCBlockingWrites',
                       'NCNonBlockingWrites',
                       'NCWriteHits',
                       'NCWriteMisses',
                       'Prefetches',
                       'PrefetchAborts',
                       'UselessPrefetches']
        access_df = module_df[access_cols]

        fig_bar_stack = self.__get_figure_bar_stack(
            access_df, ['NCWriteHits', 'NCWriteMisses'],
            module_name, 'Access Count')
        if fig_bar_stack:
            figures_module.append(fig_bar_stack)

        columns_misc = ['NCWriteRetries',
                        'NCBlockingWrites',
                        'NCNonBlockingWrites',
                        'Prefetches',
                        'PrefetchAborts',
                        'UselessPrefetches']
        for column in columns_misc:
            fig_bar = self.__get_figure_bar(
                access_df, column, module_name, 'Count')
            if fig_bar:
                figures_module.append(fig_bar)

        return figures_module

    def __get_figures_module_noretry(self, module_name='l1'):
        module_df = self.get_dataframe_by_module(module_name)

        figures_module = []

        # Plot accesses
        access_cols = ['ModuleName',
                       'ModuleId',
                       'NoRetryAccesses',
                       'NoRetryHits',
                       'NoRetryMisses',
                       'NoRetryHitRatio',
                       'NoRetryReads',
                       'NoRetryReadHits',
                       'NoRetryReadMisses',
                       'NoRetryWrites',
                       'NoRetryWriteHits',
                       'NoRetryWriteMisses',
                       'NoRetryNCWrites',
                       'NoRetryNCWriteHits',
                       'NoRetryNCWriteMisses']
        access_df = module_df[access_cols]

        fig_bar = self.__get_figure_bar(
            access_df, 'NoRetryHitRatio', module_name, 'NoRetryHitRatio')
        if fig_bar:
            figures_module.append(fig_bar)

        fig_bar_stack = self.__get_figure_bar_stack(
            access_df, ['NoRetryHits', 'NoRetryMisses'],
            module_name, 'Access Count')
        if fig_bar_stack:
            figures_module.append(fig_bar_stack)

        fig_bar_stack = self.__get_figure_bar_stack(
            access_df, ['NoRetryWriteHits', 'NoRetryWriteMisses'],
            module_name, 'Access Count')
        if fig_bar_stack:
            figures_module.append(fig_bar_stack)

        fig_bar_stack = self.__get_figure_bar_stack(
            access_df, ['NoRetryNCWriteHits', 'NoRetryNCWriteMisses'],
            module_name, 'Access Count')
        if fig_bar_stack:
            figures_module.append(fig_bar_stack)

        return figures_module

    def __get_figures_by_module(self, module_name='l1'):
        figures_module = collections.OrderedDict()
        figures_module['access'] = self.__get_figures_module_access(
            module_name)
        figures_module['reads'] = self.__get_figures_module_reads(module_name)
        figures_module['writes'] = self.__get_figures_module_writes(
            module_name)
        figures_module['ncwrites'] = self.__get_figures_module_ncwrites(
            module_name)
        figures_module['noretry'] = self.__get_figures_module_noretry(
            module_name)

        return figures_module

    def get_info(self):
        """ Get information of the report: figures and dataframe """
        info = {}
        figures = collections.OrderedDict()

        for module in self.__dataframe['ModuleName'].unique():
            figure_dict = self.__get_figures_by_module(module)
            for index, value in figure_dict.iteritems():
                name = module + '_' + index
                figures[name] = value

        info['figures'] = figures
        info['dataframe'] = self.__dataframe

        return info


class Reports(object):
    """ Plotter for memory reports """

    def __init__(self, report_files, enable_substract=True):
        self.__report_files = report_files
        self.__reports = []
        for report in self.__report_files:
            self.__reports.append(Report(report))

        # Substract dataframe
        if enable_substract:
            for index in range(1, len(self.__reports)):
                self.__reports[index].substract(self.__reports[0])

    def plot(self):
        """ Plot """
        output_file_name = 'mem_report'
        output_file_name += '.html'
        output_file_title = 'Mem report'
        output_file(output_file_name, title=output_file_title)

        # Create figure dict
        figures = collections.OrderedDict()
        for report in self.__reports:
            figure_dict = report.get_info()['figures']
            for key, value in figure_dict.iteritems():
                figures[key] = []

        # Fill figure dict
        for report in self.__reports:
            figure_dict = report.get_info()['figures']
            for key, value in figure_dict.iteritems():
                figures[key].append(value)

        # Plot all figures by tabs
        tabs_list = []
        for key, value in figures.iteritems():
            if value[0]:  # Ignore blank
                plot = gridplot(value)
                tabs_list.append(Panel(child=plot, title=key))

        tabs = Tabs(tabs=tabs_list)

        show(tabs)


def main():
    """ Main entry for Multi2Sim Memory Report Analyzer """

    # Arg parser
    parser = argparse.ArgumentParser(
        description='Multi2Sim simulation memory report analyzer')
    parser.add_argument('memRptFiles', nargs='+',
                        help='Multi2Sim memory report files')
    parser.add_argument("-s", "--substract",
                        action="store_true",
                        help='Substract the 1st file')

    args = parser.parse_args()

    reports = Reports(args.memRptFiles, args.substract)
    reports.plot()

if __name__ == '__main__':
    main()
