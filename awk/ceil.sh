#!/bin/bash

seq 10 | awk '
   function ceil(valor,m)
   {
      return (valor/m == int(valor/m)) ? valor/m : int(valor/m)+1
   }
{
   printf "%s,%d\n", $1,ceil($1,5)
} '

#http://aoki2.si.gunma-u.ac.jp/Hanasi/Algo/awk-function.html

#apache@e87790399472 ~/script-sketch/sed$./ceil.sh
#1,1
#2,1
#3,1
#4,1
#5,1
#6,2
#7,2
#8,2
#9,2
#10,2


$printf "%s\n" {a..j} | xargs -n3 | awk -v OFS="": '{c=split($0,a," ");for(e in a){print e,a[e]}}'
1:a
2:b
3:c
1:d
2:e
3:f
1:g
2:h
3:i
1:j

$printf "%s\n" {a..j} | xargs -n3 | awk -v RS="" -v OFS="": '{c=split($0,a," ");for(e in a){print e,a[e]}}'
4:d
5:e
6:f
7:g
8:h
9:i
10:j
1:a
2:b
3:c

$printf "%s\n" {a..j} | xargs -n3 | awk -v RS="" -v OFS="": '{c=split($0,a," ");for(e in a){print e,a[e]}}' | sort -nk1
1:a
2:b
3:c
4:d
5:e
6:f
7:g
8:h
9:i
10:j
