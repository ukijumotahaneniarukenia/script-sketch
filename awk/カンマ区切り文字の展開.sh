#!/bin/bash

#echo ,,python,"\x27",egison,'\',!,@,haskell,,'"',\\x22,そば,えび,肉,寿司,🍣 | awk '{cnt=gsub(",",",",$0)+1;for(i=1;i<=cnt;i++)print $0}' | \
#  awk '{split($0,array,",");print NR,array[NR-2],array[NR-1]","array[NR]}'

echo {1..10} | tr ' ' ',' | awk '{cnt=gsub(",",",",$0)+1;for(i=1;i<=cnt;i++)print $0}' | \
  awk '{split($0,a,",");
  print NR,
  a[NR-2]","a[NR-1]","a[NR],
  a[NR-1]","a[NR],
  a[NR+1]","a[NR],
  a[NR+2]","a[NR+1]","a[NR]
  }' | keta
#
#echo {a..z} | tr ' ' ',' | awk '{cnt=gsub(",",",",$0)+1;for(i=1;i<=cnt;i++)print $0}' | \
#  awk '{split($0,a,",");
#  print NR,
#  a[NR-2]","a[NR-1]","a[NR],
#  a[NR-1]","a[NR],
#  a[NR+1]","a[NR],
#  a[NR+2]","a[NR+1]","a[NR]
#  }' | keta
