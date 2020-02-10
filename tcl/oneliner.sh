#!/bin/bash

seq 3 | xargs -I@ bash -c 'tclsh -e cat <<EOS
puts "@"
EOS
'

tclsh -e cat <<EOS
puts "hello wolrd"
EOS


#[sqlite💟ceacf3fb0808 (木 11月 07 23:55:37) ~/script_scratch/tcl]$./oneliner.sh
#1
#2
#3
#hello wolrd
#
