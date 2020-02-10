#!/bin/bash

#>>> from functools import reduce
#>>> numbers = [6,7,8,9,10]
#>>> print(reduce(lambda a, b: a + b, numbers))
#40

#6+7=13
#13+8=21
#21+9=30
#30+10=40

#$./reduce.sh | keta
#1  6 ||  6  6  6  6  6 =>   6+    6++     6+++      6++++      6+++++ ||  6
#2  7 || 13 13 13 13 13 =>  7+6   7+6+    7+6++     7+6+++     7+6++++ ||  7 6
#3  8 || 15 21 21 21 21 =>  8+7  8+7+6   8+7+6+    8+7+6++    8+7+6+++ ||  8 7 6
#4  9 || 17 24 30 30 30 =>  9+8  9+8+7  9+8+7+6   9+8+7+6+   9+8+7+6++ ||  9 8 7 6
#5 10 || 19 27 34 40 40 => 10+9 10+9+8 10+9+8+7 10+9+8+7+6 10+9+8+7+6+ || 10 9 8 7 6

echo {6..10} | tr ' '  ',' | awk '{cnt=gsub(",",",",$0)+1;for(i=1;i<=cnt;i++)print $0}' | \
  awk '{split($0,array,",");
    print "",
      NR,
      array[NR],
      "||",
      array[NR]+array[NR-1],
      array[NR]+array[NR-1]+array[NR-2],
      array[NR]+array[NR-1]+array[NR-2]+array[NR-3],
      array[NR]+array[NR-1]+array[NR-2]+array[NR-3]+array[NR-4],
      array[NR]+array[NR-1]+array[NR-2]+array[NR-3]+array[NR-4]+array[NR-5],
      "=>",
      array[NR]"+"array[NR-1],
      array[NR]"+"array[NR-1]"+"array[NR-2],
      array[NR]"+"array[NR-1]"+"array[NR-2]"+"array[NR-3],
      array[NR]"+"array[NR-1]"+"array[NR-2]"+"array[NR-3]"+"array[NR-4],
      array[NR]"+"array[NR-1]"+"array[NR-2]"+"array[NR-3]"+"array[NR-4]"+"array[NR-5],
      "||",
      array[NR],
      array[NR-1],
      array[NR-2],
      array[NR-3],
      array[NR-4],
      array[NR-5],
      ""
  }'
