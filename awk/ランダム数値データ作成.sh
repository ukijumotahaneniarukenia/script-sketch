#!/bin/bash

#https://qiita.com/neko_the_shadow/items/f4f3d339d1919240b6ee
#http://tounderlinedk.blogspot.com/2010/06/srand-awk.html

for _ in $(seq 5); do
  awk -v seed="${RANDOM}" 'BEGIN{srand(seed); print(rand(), rand(), rand())}' 
done

