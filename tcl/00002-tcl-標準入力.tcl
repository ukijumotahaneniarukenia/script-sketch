#!/usr/bin/env tclsh

proc usage {} {
  puts "
Usage:
\$[info script] \"\$(echo {a..g} | xargs -n3)\"
{{a b c} {d e f} g}

コマンドライン経由引数

\$echo {a..g} | xargs -n3 | [info script]
{{a b c} {d e f} g}

パイプ経由引数

\$echo {1..100} | xargs -n15 | [info script]
{{1 2 3 4 5 6 7 8 9 10 11 12 13 14 15} {16 17 18 19 20 21 22 23 24 25 26 27 28 29 30} {31 32 33 34 35 36 37 38 39 40 41 42 43 44 45} {46 47 48 49 50 51 52 53 54 55 56 57 58 59 60} {61 62 63 64 65 66 67 68 69 70 71 72 73 74 75} {76 77 78 79 80 81 82 83 84 85 86 87 88 89 90} {91 92 93 94 95 96 97 98 99 100}}

パイプ経由引数

  "
  exit 1
}

proc main {argc argv} {
  if {$argc!=0} {
    #コマンドライン経由引数
    set input $argv
    if {[string length $input]==0} {
      usage
    }
    set input_done "[split [lindex $input 0] "\n"] {}"
    set input_done_done [lrange $input_done 0 end-1]
    set init_args "\{$input_done_done\}"
    puts $init_args
  } else {
    #パイプ経由引数
    set stdin [open "| cat -"]
    set input [read $stdin]
    if {[string length $input]==1} {
      usage
    }
    set input_done "[split $input "\n"]"
    set input_done_done [lrange $input_done 0 end-1]
    set init_args "\{$input_done_done\}"
    puts $init_args
  }
}

main $argc $argv
