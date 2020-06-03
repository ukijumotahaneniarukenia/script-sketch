#!/usr/bin/env bash

for file in $@; do
  vim -X -N -u NONE -i NONE -V1 -e --cmd "source $file | qall!" 2>&1
done
