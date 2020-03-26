#!/usr/bin/env python3

import sys;
import re;
from functools import reduce;
from operator import add;
a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));
aa=list(map(lambda x:len(x),a));
aaa=reduce(add,aa);
b=list(map(lambda x:list(map(lambda y:re.split("",y),x)),a));
if(aaa==len(a)):
  #単一列の場合
  c=list(map(lambda x:list(filter(lambda y:0!=len(y),*x)),b));
else:
  #複数列の場合
  c=list(map(lambda x:list(map(lambda y:list(filter(lambda z:0!=len(z),y)),x)),b));
print(b);
print(c);
