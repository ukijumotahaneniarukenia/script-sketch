#!/bin/bash

#割り算は暗算では無理やったわ
#bcコマンドかdcコマンドつかおう
#NVL関数的な空文字だったら、まるまるの機能が必要
#()による優先度の表現
#コンパイラ作成楽しそう
#[sqlite❣29231fdc7920 (月 10月 28 11:51:23) ~/script_scratch/python]$python
#Python 3.7.4 (default, Oct 23 2019, 21:56:45) 
#[GCC 4.8.5 20150623 (Red Hat 4.8.5-39)] on linux
#Type "help", "copyright", "credits" or "license" for more information.
#>>> from functools import reduce
#>>> numbers = [6,7,8,9,10]
#>>> print(reduce(lambda a, b: a / b, numbers))
#0.0011904761904761904
#>>> print(reduce(lambda a, b: b / a, numbers))
#7.619047619047619

#[sqlite❣29231fdc7920 (月 10月 28 11:55:22) ~/script_scratch/python]$./reduce4.sh | keta
#awk: コマンドライン:6: (FILENAME=- FNR=1) 致命的: ゼロによる除算が試みられました

#$./reduce4.sh | keta
#1  6 || =>   6/    6//     6///      6////      6///// ||  6
#2  7 || =>  7/6   7/6/    7/6//     7/6///     7/6//// ||  7 6
#3  8 || =>  8/7  8/7/6   8/7/6/    8/7/6//    8/7/6/// ||  8 7 6
#4  9 || =>  9/8  9/8/7  9/8/7/6   9/8/7/6/   9/8/7/6// ||  9 8 7 6
#5 10 || => 10/9 10/9/8 10/9/8/7 10/9/8/7/6 10/9/8/7/6/ || 10 9 8 7 6

echo {6..10} | tr ' '  ',' | awk '{cnt=gsub(",",",",$0)+1;for(i=1;i<=cnt;i++)print $0}' | \
  awk '{split($0,array,",");
    print "",
      NR,
      array[NR],
      "||",
      #array[NR]/array[NR-1],
      #array[NR]/array[NR-1]/array[NR-2],
      #array[NR]/array[NR-1]/array[NR-2]/array[NR-3],
      #array[NR]/array[NR-1]/array[NR-2]/array[NR-3]/array[NR-4],
      #array[NR]/array[NR-1]/array[NR-2]/array[NR-3]/array[NR-4]/array[NR-5],
      "=>",
      array[NR]"/"array[NR-1],
      array[NR]"/"array[NR-1]"/"array[NR-2],
      array[NR]"/"array[NR-1]"/"array[NR-2]"/"array[NR-3],
      array[NR]"/"array[NR-1]"/"array[NR-2]"/"array[NR-3]"/"array[NR-4],
      array[NR]"/"array[NR-1]"/"array[NR-2]"/"array[NR-3]"/"array[NR-4]"/"array[NR-5],
      "||",
      array[NR],
      array[NR-1],
      array[NR-2],
      array[NR-3],
      array[NR-4],
      array[NR-5],
      ""
  }'
