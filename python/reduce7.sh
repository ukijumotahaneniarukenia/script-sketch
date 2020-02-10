#!/bin/bash

#要素数5、最初の要素ないし直前の計算結果に対して、最初の要素を除く値で式に基づき再計算
#計算回数4回?


#>>> from functools import reduce
#>>> numbers = [6,7,8,9,10]
#>>> print(reduce(lambda a,b:a+a,num))
#96

#6+6=12
#12+(6+6+6)=30
#30+(6+6+6+6)=54
#54+(6+6+6+6+6)=84
#
#6+7=13
#13+8=21
#21+9=30
#30+10=40
#
#6+7=13
#13+(6+7+8)=34
#34+(6+7+8+9)=64
#64+(6+7+8+9+10)=104
#
#6+7=13
#13+(6+7)=26
#26+(6+7+8)=47
#47+(6+7+8+9)=77

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
      #####################################################################
      #このやりかただと前回の蓄積結果を参照できていない。
      #####################################################################
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
      #####################################################################
      #前回の蓄積結果を参照
      #####################################################################
      "||",
      cum[NR]=array[NR]+array[NR-1],
      cum[NR-1]=cum[NR]+array[NR-2],
      cum[NR-2]=cum[NR-1]+array[NR-3],
      cum[NR-3]=cum[NR-2]+array[NR-4],
      cum[NR-4]=cum[NR-3]+array[NR-5],
      #"=>",
      #array[NR]"+"array[NR-1],
      #array[NR]"+"array[NR-1]"+"array[NR-2],
      #array[NR]"+"array[NR-1]"+"array[NR-2]"+"array[NR-3],
      #array[NR]"+"array[NR-1]"+"array[NR-2]"+"array[NR-3]"+"array[NR-4],
      #array[NR]"+"array[NR-1]"+"array[NR-2]"+"array[NR-3]"+"array[NR-4]"+"array[NR-5],
      "||",
      array[NR],
      array[NR-1],
      array[NR-2],
      array[NR-3],
      array[NR-4],
      array[NR-5],
      ""
  }'
