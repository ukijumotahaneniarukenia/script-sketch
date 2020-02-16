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

