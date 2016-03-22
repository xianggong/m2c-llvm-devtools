#!/usr/bin/python

import argparse
import tracedatabase as td
import tracemisc as tm

import pandas as pd
from bokeh.charts import Histogram, Bar
from bokeh.plotting import figure, show, output_file
from bokeh.io import vplot, gridplot
from bokeh.charts import defaults

SCREEN_WIDTH = 1560

defaults.width = int(SCREEN_WIDTH * 0.3)
defaults.height = defaults.width


class Trace:

    def __init__(self, file_name):
        # Trace information
        self._file_name = file_name
        self._trace = open(file_name, "r")

        # Try to load database if there is one
        self._database = td.load_database(self._file_name)

        self._color = tm.get_random_color()

    def __build_database(self):
        self._database = td.load_database(self._file_name)

    # Statistics getters
    def get_column(self, table_name, column_name):
        """ Get a column from database """
        if self._database is None:
            self.__build_database()

        cursor = self._database.cursor()
        sql_query = 'SELECT ' + column_name + ' FROM ' + table_name

        return cursor.execute(sql_query)

    def get_column_function(self,
                            table_name, column_name,
                            func_name, conditions=''):
        """ Get a column from database, apply with function """
        if self._database is None:
            self.__build_database()

        cursor = self._database.cursor()
        sql_query = 'SELECT ' + func_name
        sql_query += '(' + column_name + ') FROM ' + table_name + ' '
        sql_query += conditions
        return cursor.execute(sql_query).fetchone()[0]

    def get_max(self, table_name, column_name, conditions=''):
        """ Get the maximum of a column from database """
        return int(self.get_column_function(table_name, column_name,
                                            'MAX', conditions))

    def get_sum(self, table_name, column_name, conditions=''):
        """ Get the sum of a column from database """
        return int(self.get_column_function(table_name, column_name,
                                            'SUM', conditions))

    def get_count(self, table_name, column_name, conditions=''):
        """ Get the count of a column from database """
        return int(self.get_column_function(table_name, column_name,
                                            'COUNT', conditions))

    def get_all_count(self):
        """ Get all the count """
        print "Cycle 0 to " + str(self.get_max("cycle", "cycle"))
        print 'stall' + '\t\t\t' + str(self.get_sum('cycle', 'stall'))
        print 'fetch' + '\t\t\t' + str(self.get_sum('cycle', 'fetch'))
        print 'issue' + '\t\t\t' + str(self.get_sum('cycle', 'issue'))
        print 'branch' + '\t\t\t' + str(self.get_sum('cycle', 'branch'))
        print 'mem_new' + '\t\t\t' + str(self.get_sum('cycle', 'mem_new'))
        print 'mem' + '\t\t\t' + str(self.get_sum('cycle', 'mem'))
        print 'lds' + '\t\t\t' + str(self.get_sum('cycle', 'lds'))
        print 'scalar' + '\t\t\t' + str(self.get_sum('cycle', 'scalar'))
        print 'simd' + '\t\t\t' + str(self.get_sum('cycle', 'simd'))

    def get_all_count_as_list(self):
        """ Get all the count as list """
        stats = []

        # stats.append(self._file_name)
        stats.append(self.get_max("cycle", "cycle"))
        stats.append(self.get_sum('cycle', 'stall'))
        stats.append(self.get_sum('cycle', 'fetch'))
        stats.append(self.get_sum('cycle', 'issue'))
        stats.append(self.get_sum('cycle', 'branch'))
        stats.append(self.get_sum('cycle', 'mem_new'))
        stats.append(self.get_sum('cycle', 'mem'))
        stats.append(self.get_sum('cycle', 'lds'))
        stats.append(self.get_sum('cycle', 'scalar'))
        stats.append(self.get_sum('cycle', 'simd'))

        return stats


class Traces():

    def __init__(self, trace_files):

        self.trace_files = trace_files
        self.traces = []
        self.plot_height = defaults.height
        self.plot_width = SCREEN_WIDTH - self.plot_height

        for trace in trace_files:
            t = Trace(trace)
            self.traces.append(t)

    def stat(self):
        for trace in self.traces:
            trace.get_all_count()

    def plot(self, table_name, x_column_name, y_column_name):

        # Output to static HTML file
        prefix = self.trace_files[0].split('_')
        output_file_name = prefix[0] + "_"
        output_file_name += y_column_name + "_" + x_column_name
        output_file_name += "_" + prefix[4]
        output_file(output_file_name + '.html', title=output_file_name)

        # List of figures
        figures = []

        # Set y axis range
        x_max = 0
        y_max = 0
        for trace in self.traces:
            x_max = max(trace.get_max(table_name, x_column_name), x_max)
            y_max = max(trace.get_max(table_name, y_column_name), y_max)
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
        all_in_one.yaxis.axis_label = y_column_name

        # Statistics table
        stats = {}
        stats['data'] = []
        stats['name'] = []
        stats['catagory'] = []
        catagory = ['cycle',
                    'stall',
                    'fetch',
                    'issue',
                    'branch',
                    'mem_new',
                    'mem',
                    'lds',
                    'scalar',
                    'simd']
        stats_colors = []

        count = 0
        for trace in self.traces:
            # Build stats table
            stats['data'].extend(trace.get_all_count_as_list())
            stats['name'].extend([count] * 10)
            stats['catagory'].extend(catagory)
            stats_colors.append(str(trace._color))
            count += 1

            # Get the data from database
            sql_query = 'SELECT ' + x_column_name + ',' + y_column_name + \
                ' FROM ' + table_name
            df = pd.read_sql_query(sql_query, trace._database)

            # Plot the main view
            plot_title = trace._file_name + " : " + \
                str(trace.get_max("cycle", "cycle")) + " cycles"
            plot = figure(webgl=True,
                          plot_width=self.plot_width,
                          plot_height=self.plot_height,
                          x_range=all_in_one.x_range,
                          y_range=all_in_one.y_range,
                          title=plot_title)
            plot.xaxis.axis_label = x_column_name
            plot.yaxis.axis_label = y_column_name

            plot.segment(x0=df[x_column_name],
                         y0=df[y_column_name],
                         x1=df[x_column_name],
                         y1=0,
                         line_width=1,
                         legend=trace._file_name,
                         color=trace._color)

            # Plot histogram on the right
            plot_hist = Histogram(df[y_column_name],
                                  y_column_name,
                                  bins=max(int(y_max / 10), 50),
                                  color=trace._color,
                                  title='Distribution of ' + y_column_name)

            all_in_one.segment(x0=df[x_column_name],
                               y0=df[y_column_name],
                               x1=df[x_column_name],
                               y1=0,
                               line_width=1,
                               legend=trace._file_name,
                               color=trace._color)

            figures.append([plot, plot_hist])

        # Plot statistics
        stats_compare = Bar(stats,
                            values='data',
                            group='name',
                            label='catagory',
                            color=stats_colors,
                            legend='top_left',
                            ylabel='Count',
                            title='Normalized statistics')

        figures.append([all_in_one, stats_compare])

        # Plot all figures
        p = gridplot(figures)
        show(p)

    def plotPipeline(self, cu_id):

        # Output to static HTML file
        prefix = self.trace_files[0].split('_')
        output_file_name = prefix[0] + "_pipeline"
        if int(cu_id) != -1:
            output_file_name += '_cu_' + str(cu_id) + "_"
        else:
            output_file_name += '_all_cu_'
        output_file_name += prefix[4]
        output_file(output_file_name + '.html', title=output_file_name)

        # List of figures
        figures = []

        # Set y axis range
        x_max = 1
        y_max = 1
        for trace in self.traces:
            if int(cu_id) != -1:
                condition = 'WHERE cu=' + cu_id
                x_max = max(trace.get_max(
                    "inst", "cycle_start + length", condition), x_max)
                y_max = max(trace.get_count("inst", "line", condition), y_max)
            else:
                x_max = max(trace.get_max(
                    "inst", "cycle_start + length"), x_max)
                y_max = max(trace.get_count("inst", "line"), y_max)
        x_max *= 1.01
        y_max *= 1.05

        # Plotting
        all_in_one = figure(webgl=True,
                            plot_width=self.plot_width,
                            plot_height=self.plot_height,
                            x_range=(0, x_max),
                            y_range=(0, y_max),
                            title='Combined view')
        all_in_one.xaxis.axis_label = "cycle"
        all_in_one.yaxis.axis_label = "inst_id"

        for trace in self.traces:
            sql_query = 'SELECT cycle_start,length FROM inst'
            if int(cu_id) != -1:
                sql_query += ' WHERE cu=' + cu_id
            sql_query += ' ORDER by line'
            df = pd.read_sql_query(sql_query, trace._database)

            if int(cu_id) != -1:
                condition = 'WHERE cu=' + cu_id
                cycle_count = trace.get_max(
                    "inst", "cycle_start + length", condition)
                trace_title = trace._file_name + ": " + str(cycle_count)
            else:
                trace_title = trace._file_name

            plot = figure(webgl=True,
                          plot_width=self.plot_width,
                          plot_height=self.plot_height,
                          x_range=all_in_one.x_range,
                          y_range=all_in_one.y_range,
                          title=trace_title)
            plot.xaxis.axis_label = "cycle"
            plot.yaxis.axis_label = "inst_id"

            y_axis = range(len(df.index))

            plot.segment(x0=df["cycle_start"],
                         y0=y_axis,
                         x1=df["cycle_start"] + df["length"],
                         y1=y_axis,
                         line_width=1,
                         legend=trace._file_name,
                         color=trace._color)
            plot.legend.location = "top_left"

            all_in_one.segment(x0=df["cycle_start"],
                               y0=y_axis,
                               x1=df["cycle_start"] + df["length"],
                               y1=y_axis,
                               line_width=1,
                               legend=trace._file_name,
                               color=trace._color)
            all_in_one.legend.location = "top_left"

            figures.append(plot)

        figures.append(all_in_one)

        # Plot all figures
        p = vplot(*figures)
        show(p)

    def plotMemory(self, mode='pipeline'):
        # Output to static HTML file
        prefix = self.trace_files[0].split('_')
        output_file_name = prefix[0] + "_memory_" + mode + "_"
        output_file_name += prefix[4]
        output_file(output_file_name + '.html', title=output_file_name)

        # List of figures
        figures = []

        # Set y axis range
        x_max = 1
        y_max = 1
        for trace in self.traces:
            if mode == 'pipeline':
                x_max = max(trace.get_max(
                    "memory", "cycle_start + length"), x_max)
                y_max = max(trace.get_count("memory", "mem_access_id"), y_max)
            elif mode == 'statistic':
                x_max = max(trace.get_count("memory", "mem_access_id"), x_max)
                y_max = max(trace.get_max("memory", "length"), y_max)
        x_max *= 1.01
        y_max *= 1.05

        # Plotting
        all_in_one = figure(webgl=True,
                            plot_width=self.plot_width,
                            plot_height=self.plot_height,
                            x_range=(0, x_max),
                            y_range=(0, y_max),
                            title='Combined view')
        all_in_one.xaxis.axis_label = "cycle"
        all_in_one.yaxis.axis_label = "mem access id"

        access_filter = ['access_type="nc_store"',
                         'access_type="load" and access_location!="LDS[0]"',
                         'access_type="store" and access_location!="LDS[0]"',
                         'access_type="load" and access_location="LDS[0]"',
                         'access_type="store" and access_location="LDS[0]"'
                         ]

        accees_legend = ['Global Memory: NC Store',
                         'Global Memory: Load ',
                         'Global Memory, Store ',
                         'LDS: Load',
                         'LDS: Store',
                         ]

        for trace in self.traces:
            plot = figure(webgl=True,
                          plot_width=self.plot_width,
                          plot_height=self.plot_height,
                          x_range=all_in_one.x_range,
                          y_range=all_in_one.y_range,
                          title=trace._file_name)

            for index in range(len(access_filter)):
                sql_query = 'SELECT cycle_start,length,mem_access_id \
                            FROM memory'
                sql_query += ' WHERE ' + access_filter[index]
                sql_query += ' ORDER by line'
                df = pd.read_sql_query(sql_query, trace._database)

                color = tm.get_random_color()
                if mode == 'statistic':
                    plot.xaxis.axis_label = "mem access id"
                    plot.yaxis.axis_label = "cycle"
                    plot.segment(x0=df["mem_access_id"],
                                 y0=0,
                                 x1=df["mem_access_id"],
                                 y1=df["length"],
                                 line_width=1,
                                 legend=accees_legend[index],
                                 color=color)

                    # Plot histogram on the right
                    # print df["length"]
                    plot_hist = Histogram(df["length"],
                                          bins=max(int(y_max / 10), 50),
                                          color=color,
                                          title='Distribution of length')

                    all_in_one.segment(x0=df["mem_access_id"],
                                       y0=0,
                                       x1=df["mem_access_id"],
                                       y1=df["length"],
                                       line_width=1,
                                       legend=trace._file_name,
                                       color=color)
                    # all_in_one.legend.location = "top_left"
                elif mode == 'pipeline':
                    plot.xaxis.axis_label = "cycle"
                    plot.yaxis.axis_label = "mem access id"
                    plot.segment(x0=df["cycle_start"],
                                 y0=df["mem_access_id"],
                                 x1=df["cycle_start"] + df["length"],
                                 y1=df["mem_access_id"],
                                 line_width=1,
                                 legend=accees_legend[index],
                                 color=color)

                    # Plot histogram on the right
                    plot_hist = Histogram(df["length"],
                                          bins=max(int(y_max / 10), 50),
                                          color=color,
                                          title='Distribution of length')

                    all_in_one.segment(x0=df["cycle_start"],
                                       y0=df["mem_access_id"],
                                       x1=df["cycle_start"] + df["length"],
                                       y1=df["mem_access_id"],
                                       line_width=1,
                                       legend=trace._file_name,
                                       color=color)
                    # all_in_one.legend.location = "top_left"

            figures.append([plot, plot_hist])

        figures.append([all_in_one, None])

        # Plot all figures
        p = gridplot(figures)
        show(p)


def main():
    # Arg parser
    parser = argparse.ArgumentParser(
        description='Multi2Sim simulation trace analyzer')
    parser.add_argument('traceFiles', nargs='+',
                        help='Multi2Sim trace files')
    parser.add_argument("-t", "--table", nargs=1,
                        default="cycle",
                        help='Choose table name')
    parser.add_argument("-x", "--xaxis", nargs=1,
                        default="cycle",
                        help='Choose x axis statistic name')
    parser.add_argument("-y", "--yaxis", nargs=1,
                        default="stall",
                        help='Choose y axis statistic name')
    parser.add_argument("-cu", "--cuid", nargs=1,
                        default=-1,
                        help='Filter on cumpute unit')
    parser.add_argument("-s", "--stat",
                        action="store_true",
                        help='Show statistics')
    parser.add_argument("-v", "--visual",
                        action="store_true",
                        help='Visualize statistics')
    parser.add_argument("-p", "--pipeline",
                        action="store_true",
                        help='Visualize pipeline')
    parser.add_argument("-m", "--memory",
                        choices=['pipe', 'stat'],
                        help='Visualize memory pipeline')
    args = parser.parse_args()

    # Traces
    traces = Traces(args.traceFiles)

    # Statistics
    if args.stat:
        traces.stat()

    if args.visual:
        traces.plot(args.table[0], args.xaxis[0], args.yaxis[0])

    if args.pipeline:
        traces.plotPipeline(args.cuid[0])

    if args.memory:
        traces.plotMemory(args.memory)

if __name__ == '__main__':
    main()
