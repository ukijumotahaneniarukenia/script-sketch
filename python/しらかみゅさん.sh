#!/usr/local/bin/python3.7

import sys

def left_stair1(rsv_args):
  for ind in range(len(rsv_args)):
    print(rsv_args[:ind]);

left_stair1(['💠', '💡', '💢', '💣', '💤', '💥', '💦', '💧', '💨', '💩'])
def left_stair2(rsv_args):
  for ind in range(len(rsv_args)):
    print(rsv_args[ind:]);

left_stair2(['💠', '💡', '💢', '💣', '💤', '💥', '💦', '💧', '💨', '💩'])

def left_stair3(rsv_args):
  for ind in range(len(rsv_args)):
    print(rsv_args[ind:]+rsv_args[:ind]);

left_stair3(['💠', '💡', '💢', '💣', '💤', '💥', '💦', '💧', '💨', '💩'])

def right_stair1(rsv_args):
  for ind in range(len(rsv_args)):
    print(rsv_args[:-ind]);

right_stair1(['💠', '💡', '💢', '💣', '💤', '💥', '💦', '💧', '💨', '💩'])

def right_stair2(rsv_args):
  for ind in range(len(rsv_args)):
    print(rsv_args[-ind:]);

right_stair2(['💠', '💡', '💢', '💣', '💤', '💥', '💦', '💧', '💨', '💩'])

def right_stair3(rsv_args):
  for ind in range(len(rsv_args)):
    print(rsv_args[-ind:]+rsv_args[:-ind]);

right_stair3(['💠', '💡', '💢', '💣', '💤', '💥', '💦', '💧', '💨', '💩'])
