#!/usr/bin/tcl


proc print_args {rsv_args} {
  set ind 0
  puts $rsv_args
  foreach ele $rsv_args {
    puts "ind:$ind,ele:$ele"
    incr ind
  }
}

proc main {rsv_args} {
  print_args $rsv_args
}

main $argv
