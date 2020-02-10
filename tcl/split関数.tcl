#!/usr/bin/tclsh

#$tclsh split関数.tcl {a..d}
#a b c d
#{a b c d}


#文字列
puts $argv 

#リスト
puts [split $argv "\n"]
