#!/usr/bin/env tclsh

proc usage {} {
  puts "

Usage:

  "
  exit 1
}

proc chk_args {argc argv} {
  if {$argc!=0} {
    set input $argv
    if {[string length $input]==0} {
      usage
    }
    set input_done "[split [lindex $input 0] "\n"] {}"
    set input_done_done [lrange $input_done 0 end-1]
    set init_args "\{$input_done_done\}"
    return $init_args
  } else {
    set stdin [open "| cat -"]
    set input [read $stdin]
    if {[string length $input]==1} {
      usage
    }
    set input_done "[split $input "\n"]"
    set input_done_done [lrange $input_done 0 end-1]
    set init_args "\{$input_done_done\}"
    return $init_args
  }
}

proc circle {rsv_args} {
  #https://wiki.tcl-lang.org/page/for
  set init_args $rsv_args
  for {set ind 0} {$ind < [llength [lindex $rsv_args 0]]} {incr ind} {
    set ele [lindex [lindex $init_args 0] 0] ;#先頭要素フェッチ[shift]
    set init_args "\{[lrange [lindex $init_args 0] 1 end]\}";#先頭要素以外取得
    set init_args "\{[linsert [lindex $init_args 0] end $ele]\}";#先頭要素を末尾に追加[push]
    puts $init_args
  }
}

proc main {argc argv} {
  #スコープはかぶらない。ファンクション内で閉じている。
  set init_args [chk_args $argc $argv]
  circle $init_args
}

main $argc $argv
