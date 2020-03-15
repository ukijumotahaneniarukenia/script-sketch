#!/bin/bash

mx=$1;shift
nn=$1;shift
tag=$1;shift

strings /dev/urandom | tr -dc 'A-Za-z' | head -c $(($mx*100)) | fold -b -w $mx | shuf -rn $nn >done-str-$tag
