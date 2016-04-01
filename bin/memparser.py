#!/usr/bin/python
""" Memory report parser for Multi2Sim """
import re
import pandas as pd

INDEX = [
    'Sets',
    'Assoc',
    'Policy',
    'BlockSize',
    'Latency',
    'Ports',

    'Accesses',
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
    'NoRetryNCWriteMisses',
]


def __parse(report):
    """ Parse report """
    mem_info = {}
    curr_module = None
    for line in report:
        # Ignore network information
        if 'Network' in line:
            break

        # Get module name
        module = re.search(r'[\[]\s(?P<module_name>\w+\-\w+)\s[\]]', line)
        module_name = module.groupdict()['module_name'] if module else None
        if module_name:
            mem_info[module_name] = []
            curr_module = module_name
            continue

        # Process statistic
        field = re.search(
            r'\w+\s=\s(?P<stat_value>(.*))', line)
        if field:
            stat_value = field.groupdict()['stat_value']
            if stat_value != 'LRU':
                if '.' not in stat_value:
                    stat_value = int(stat_value)
                else:
                    stat_value = float(stat_value)
            mem_info[curr_module].append(stat_value)

    dataframe = pd.DataFrame(mem_info, index=INDEX)
    dataframe = dataframe.transpose()
    print dataframe
    return mem_info


def get_df(report_file):
    """ Return dataframe of the report """
    report = open(report_file, 'r')
    return __parse(report)
