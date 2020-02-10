gets stdin line
if { [regexp {^$} $line] } {
  #空行チェック
  puts "USAGE: $::argv0 
  単一行の引数が必要です
  \$echo compiler compile compiler | tclsh $::argv0
  compiler
  compiler,compile
  compiler,compile,compiler
  "
  exit 1
}

foreach {val} $line {
  append tmp_liz "," $val
  #puts "[string trimleft $tmp_liz ","]"
}
