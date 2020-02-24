#!/usr/bin/env bash

seq 20200101 20201231 | awk -v FS='' '{print $1$2$3$4"-"$5$6"-"$7$8}' | xargs -I@ date "+%Y-%m-%d" -d @ 2>/dev/null
