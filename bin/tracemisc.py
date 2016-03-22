#!/usr/bin/python
""" This module contains misc functions """

import random


def get_random_color():
    """ Get random color """
    return "#%06x" % random.randint(0, 0xFFFFFF)
