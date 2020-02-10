foreach {key val} { item "apple" price 100 qty 6 } {
  append tmp_mapliz "," $key "=" $val
}
puts "mapliz:[string trimleft $tmp_mapliz ","]"
