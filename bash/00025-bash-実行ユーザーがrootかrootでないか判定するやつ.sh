#!/usr/bin/env bash

uid=$(id | grep -oP uid=[0-9]+ | sed -r 's/.+=([0-9]+)/\1/')

if [ $uid -eq 0 ];then
  echo root
else
  echo non-root
fi
