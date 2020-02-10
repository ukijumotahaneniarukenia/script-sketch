#!/usr/local/bin/python3.7

import numpy as np

def circle(rsv_args):
  for ind in range(len(rsv_args)):
    #print(np.roll(rsv_args,ind))
    print(np.roll(rsv_args,-ind))

circle(['💠', '💡', '💢', '💣', '💤', '💥', '💦', '💧', '💨', '💩'])
