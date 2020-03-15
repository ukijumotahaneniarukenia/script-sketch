#!/bin/bash

day=$1;shift;
range=$1;shift;
nn=$1;shift;
tag=$1;shift;

mdate -e $day/+$range | tarr | shuf -rn$nn >done-dtm-$tag
