#!/usr/bin/bash

puts [string repeat "=" 80]
set liz {a b c d}
puts $liz
string cat $liz

#https://wiki.tcl-lang.org/page/string+repeat

puts [string repeat "=" 80]
set liz {a {b c} d}
puts $liz

