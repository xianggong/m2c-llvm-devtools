#!/usr/bin/python
""" Trace analyzer for Multi2Sim """


import argparse
import pandas as pd
from bokeh.charts import Bar
from bokeh.plotting import show, output_file
from bokeh.io import gridplot
from bokeh.charts import defaults
import memparser as mp

SCREEN_WIDTH = 1560

defaults.width = int(SCREEN_WIDTH * 0.25)
defaults.height = defaults.width


def is_all_zeros(column):
    unique = column.unique()
    if len(unique) == 1 and 0 in unique:
        return True
    else:
        return False


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
        access_df_count = pd.melt(access_df,
                                  id_vars='ModuleId',
                                  value_vars=['Hits', 'Misses'],
                                  var_name='type',
                                  value_name='count')
        access_df_misc = pd.melt(access_df,
                                 id_vars='ModuleId',
                                 value_vars=['Evictions', 'Retries'],
                                 var_name='group',
                                 value_name='count')

        if not is_all_zeros(access_df['HitRatio']):
            bar_ratio = Bar(access_df,
                            values='HitRatio',
                            label='ModuleId',
                            xlabel=module_name,
                            ylabel='Hit Ratio')
            figures_module.append(bar_ratio)

        bar_count = Bar(access_df_count,
                        values='count',
                        label='ModuleId',
                        stack='type',
                        legend='top_right',
                        xlabel=module_name,
                        ylabel='Access count')
        figures_module.append(bar_count)

        if not is_all_zeros(access_df_misc['count']):
            bar_misc = Bar(access_df_misc,
                           label='ModuleId',
                           values='count',
                           group='group',
                           legend='top_right',
                           xlabel=module_name,
                           ylabel='Count')
            figures_module.append(bar_misc)

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
        access_df_count = pd.melt(access_df,
                                  id_vars='ModuleId',
                                  value_vars=['ReadHits', 'ReadMisses'],
                                  var_name='type',
                                  value_name='count')
        access_df_misc = pd.melt(access_df,
                                 id_vars='ModuleId',
                                 value_vars=['ReadRetries',
                                             'BlockingReads',
                                             'NonBlockingReads'],
                                 var_name='group',
                                 value_name='count')

        bar_count = Bar(access_df_count,
                        values='count',
                        label='ModuleId',
                        stack='type',
                        legend='top_right',
                        xlabel=module_name,
                        ylabel='Access count')
        figures_module.append(bar_count)

        if not is_all_zeros(access_df_misc['count']):
            bar_misc = Bar(access_df_misc,
                           label='ModuleId',
                           values='count',
                           group='group',
                           legend='top_right',
                           xlabel=module_name,
                           ylabel='Count')
            figures_module.append(bar_misc)

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
        access_df_count = pd.melt(access_df,
                                  id_vars='ModuleId',
                                  value_vars=['WriteHits', 'WriteMisses'],
                                  var_name='type',
                                  value_name='count')
        access_df_misc = pd.melt(access_df,
                                 id_vars='ModuleId',
                                 value_vars=['WriteRetries',
                                             'BlockingWrites',
                                             'NonBlockingWrites'],
                                 var_name='group',
                                 value_name='count')

        if not is_all_zeros(access_df_count['count']):
            bar_count = Bar(access_df_count,
                            values='count',
                            label='ModuleId',
                            stack='type',
                            legend='top_right',
                            xlabel=module_name,
                            ylabel='Access count')
            figures_module.append(bar_count)

        if not is_all_zeros(access_df_misc['count']):
            bar_misc = Bar(access_df_misc,
                           label='ModuleId',
                           values='count',
                           group='group',
                           legend='top_right',
                           xlabel=module_name,
                           ylabel='Count')
            figures_module.append(bar_misc)

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
                       'UselessPrefetches'
                       ]
        access_df = module_df[access_cols]
        access_df_count = pd.melt(access_df,
                                  id_vars='ModuleId',
                                  value_vars=['NCWriteHits', 'NCWriteMisses'],
                                  var_name='type',
                                  value_name='count')
        access_df_misc = pd.melt(access_df,
                                 id_vars='ModuleId',
                                 value_vars=['NCWriteRetries',
                                             'NCBlockingWrites',
                                             'NCNonBlockingWrites',
                                             'Prefetches',
                                             'PrefetchAborts',
                                             'UselessPrefetches'],
                                 var_name='group',
                                 value_name='count')

        if not is_all_zeros(access_df_count['count']):
            bar_count = Bar(access_df_count,
                            values='count',
                            label='ModuleId',
                            stack='type',
                            legend='top_right',
                            xlabel=module_name,
                            ylabel='Access count')
            figures_module.append(bar_count)

        if not is_all_zeros(access_df_misc['count']):
            bar_misc = Bar(access_df_misc,
                           label='ModuleId',
                           values='count',
                           group='group',
                           legend='top_right',
                           xlabel=module_name,
                           ylabel='Count')
            figures_module.append(bar_misc)

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
        access_df_count = pd.melt(access_df,
                                  id_vars='ModuleId',
                                  value_vars=['NoRetryHits', 'NoRetryMisses'],
                                  var_name='type',
                                  value_name='count')
        access_df_misc = pd.melt(access_df,
                                 id_vars='ModuleId',
                                 value_vars=['NoRetryReads',
                                             'NoRetryReadHits',
                                             'NoRetryReadMisses',
                                             'NoRetryWrites',
                                             'NoRetryWriteHits',
                                             'NoRetryWriteMisses',
                                             'NoRetryNCWrites',
                                             'NoRetryNCWriteHits',
                                             'NoRetryNCWriteMisses'],
                                 var_name='group',
                                 value_name='count')

        if not is_all_zeros(access_df['NoRetryHitRatio']):
            bar_ratio = Bar(access_df,
                            values='NoRetryHitRatio',
                            label='ModuleId',
                            xlabel=module_name,
                            ylabel='Hit Ratio')
            figures_module.append(bar_ratio)

        if not is_all_zeros(access_df_count['count']):
            bar_count = Bar(access_df_count,
                            values='count',
                            label='ModuleId',
                            stack='type',
                            legend='top_right',
                            xlabel=module_name,
                            ylabel='Access count')
            figures_module.append(bar_count)

        if not is_all_zeros(access_df_misc['count']):
            bar_misc = Bar(access_df_misc,
                           label='ModuleId',
                           values='count',
                           group='group',
                           legend='top_right',
                           xlabel=module_name,
                           ylabel='Count')
            figures_module.append(bar_misc)

        return figures_module

    def __get_figures_by_module(self, module_name='l1'):
        figures_module = []
        figures_module.extend(self.__get_figures_module_access(module_name))
        figures_module.extend(self.__get_figures_module_reads(module_name))
        figures_module.extend(self.__get_figures_module_writes(module_name))
        figures_module.extend(self.__get_figures_module_ncwrites(module_name))
        figures_module.extend(self.__get_figures_module_noretry(module_name))

        return figures_module

    def get_info(self):
        """ Get information of the report: figures and dataframe """
        info = {}
        figures = []

        for module in self.__dataframe['ModuleName'].unique():
            figures.extend(self.__get_figures_by_module(module))

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
