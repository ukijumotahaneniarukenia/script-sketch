#!/bin/bash

mx=$1;shift
nn=$1;shift

strings /dev/urandom | tr -dc 'A-Za-z' | head -c $(($mx*100+1)) | fold -b -w $mx | shuf -rn $nn


#kuraine ubuntu-19-10-vim ~/script-sketch/Tukubai$time ./d.sh 32 10000000 >done
#
#real	0m0.499s
#user	0m0.291s
#sys	0m0.213s
#kuraine ubuntu-19-10-vim ~/script-sketch/Tukubai$ll -lh done
#-rw-rw-r--. 1 kuraine kuraine 312M  3月 15 03:42 done

