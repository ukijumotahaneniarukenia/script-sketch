#!/bin/bash

#要素数5、最初の要素ないし直前の計算結果に対して、最初の要素を除く値で式に基づき再計算

#>>> from functools import reduce
#>>> numbers = [6,7,8,9,10]
#>>> print(reduce(lambda a, b: a * b, numbers))
#30240

#6*7=42
#42*8=336
#336*9=3024
#3024*10=30240

#$./reduce6.sh | keta
#1  6 ||  0   0    0     0     0 =>   6*    6**     6***      6****      6***** ||  0   0    0     0 0 =>   6*    6**     6***      6****      6***** ||  6
#2  7 || 42   0    0     0     0 =>  7*6   7*6*    7*6**     7*6***     7*6**** || 42   0    0     0 0 =>  7*6   7*6*    7*6**     7*6***     7*6**** ||  7 6
#3  8 || 56 336    0     0     0 =>  8*7  8*7*6   8*7*6*    8*7*6**    8*7*6*** || 56 336    0     0 0 =>  8*7  8*7*6   8*7*6*    8*7*6**    8*7*6*** ||  8 7 6
#4  9 || 72 504 3024     0     0 =>  9*8  9*8*7  9*8*7*6   9*8*7*6*   9*8*7*6** || 72 504 3024     0 0 =>  9*8  9*8*7  9*8*7*6   9*8*7*6*   9*8*7*6** ||  9 8 7 6
#5 10 || 90 720 5040 30240 30240 => 10*9 10*9*8 10*9*8*7 10*9*8*7*6 10*9*8*7*6* || 90 720 5040 30240 0 => 10*9 10*9*8 10*9*8*7 10*9*8*7*6 10*9*8*7*6* || 10 9 8 7 6

echo {6..10} | tr ' '  ',' | awk '{cnt=gsub(",",",",$0)+1;for(i=1;i<=cnt;i++)print $0}' | \
  awk '{split($0,array,",");
    print "",
      NR,
      array[NR],
      "||",
      array[NR]*array[NR-1],
      array[NR]*array[NR-1]*array[NR-2],
      array[NR]*array[NR-1]*array[NR-2]*array[NR-3],
      array[NR]*array[NR-1]*array[NR-2]*array[NR-3]*array[NR-4],
      array[NR]*array[NR-1]*array[NR-2]*array[NR-3]*array[NR-4]+array[NR-5],
      "=>",
      array[NR]"*"array[NR-1],
      array[NR]"*"array[NR-1]"*"array[NR-2],
      array[NR]"*"array[NR-1]"*"array[NR-2]"*"array[NR-3],
      array[NR]"*"array[NR-1]"*"array[NR-2]"*"array[NR-3]"*"array[NR-4],
      array[NR]"*"array[NR-1]"*"array[NR-2]"*"array[NR-3]"*"array[NR-4]"*"array[NR-5],
      "||",
      cum[NR]=array[NR]*array[NR-1],
      cum[NR-1]=cum[NR]*array[NR-2],
      cum[NR-2]=cum[NR-1]*array[NR-3],
      cum[NR-3]=cum[NR-2]*array[NR-4],
      cum[NR-4]=cum[NR-3]*array[NR-5],
      "=>",
      array[NR]"*"array[NR-1],
      array[NR]"*"array[NR-1]"*"array[NR-2],
      array[NR]"*"array[NR-1]"*"array[NR-2]"*"array[NR-3],
      array[NR]"*"array[NR-1]"*"array[NR-2]"*"array[NR-3]"*"array[NR-4],
      array[NR]"*"array[NR-1]"*"array[NR-2]"*"array[NR-3]"*"array[NR-4]"*"array[NR-5],
      "||",
      array[NR],
      array[NR-1],
      array[NR-2],
      array[NR-3],
      array[NR-4],
      array[NR-5],
      ""
  }'
