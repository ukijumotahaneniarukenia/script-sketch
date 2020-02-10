#!/usr/local/bin/python3.7
def liz():
  return[x for x in range(15) if x%2==0 and x%3==0 ];

import my_common;

my_common.print_meta_info();

print("non_dyn_call:");
print(liz());

print("dyn_call:");
_tobe_called_func="liz";
print(eval(_tobe_called_func)());
