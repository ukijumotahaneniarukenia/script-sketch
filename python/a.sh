#!/bin/bash

#printf "%s\n" abc def | python3 -c '
#import sys;
#import re;
#a=list(map(lambda x:x.strip().split(),sys.stdin.readlines()));
#b=list(map(lambda x:re.split("",*x),a));
#c=list(map(lambda x:list(filter(lambda y:0!=len(y),x)),b));
#print(c);
#'

printf "%s\n" abc def ghi | xargs -n2 | python3 -c '
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
  c=list(map(lambda x:list(filter(lambda y:0!=len(y),x)),b));
else:
  #複数列の場合
  c=list(map(lambda x:x,b));
print(b);
print(c);
'
