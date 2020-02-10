#! /usr/local/bin/python3.7

from functools import reduce

numbers = [-8, 5, -1, 4, -9, 2]
print(reduce(lambda a, b: a + b, numbers))
