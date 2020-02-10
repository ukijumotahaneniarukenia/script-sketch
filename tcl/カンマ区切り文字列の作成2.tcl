foreach {val} {item price qty} {
  puts "val:$val"
  append tmp_liz "," $val
  puts "tmp_liz:$tmp_liz"
}
puts "liz:[string trimleft $tmp_liz ","]"
