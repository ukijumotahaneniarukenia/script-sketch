#!/bin/bash

mx=$1;shift
nn=$1;shift

strings /dev/urandom | tr -dc 'A-Za-z' | head -c $(($mx*100+1)) | fold -b -w $mx | shuf -rn $nn
