gets stdin line
if { [regexp {^$} $line] } {
  #空行チェック
  puts "USAGE: $::argv0 
  単一行の引数が必要です
  \$echo 'item \"apple\" price 100 qty 6' | tclsh $::argv0
  item=apple
  item=apple,price=100
  item=apple,price=100,qty=6
  "
  exit 1
}
foreach {key val} $line {
  append tmp_mapliz "," $key "=" $val
  puts "[string trimleft $tmp_mapliz ","]"
}
