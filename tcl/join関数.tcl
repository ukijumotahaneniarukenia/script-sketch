#!/usr/bin/tclsh

#https://blog.it-see.net/it-dokata/tcl-tk/format/


puts "argc:$argc"

proc h {rsv_args} {
  puts "$rsv_args"
}

proc v {rsv_args} {
  puts [join "$rsv_args" "\n"]
}

h $argv
v $argv
