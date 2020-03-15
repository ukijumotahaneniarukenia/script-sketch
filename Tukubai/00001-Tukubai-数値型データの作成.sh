#!/bin/bash

mx=$1;shift
nn=$1;shift
tag=$1;shift

seq 0 9 >a

for i in $(seq 1 $mx | maezero 1.2);do
  mkfifo a-$i
  cat a | shuf -rn$nn >a-$i &
done

paste a-* | tr -d '\t' >done-num-$tag

sed -i "1i$tag" done-num-$tag

rm -rf a-* a
