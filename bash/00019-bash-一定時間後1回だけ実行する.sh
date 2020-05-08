#!/bin/bash

a=10

echo うんこ

while [[ 0 -le $a ]] && echo moriougai
do
  if [[ $a -eq 0 ]];then
    echo mori
    break
  else
    echo $((--a)) 1>/dev/null
    sleep 1
  fi
done
