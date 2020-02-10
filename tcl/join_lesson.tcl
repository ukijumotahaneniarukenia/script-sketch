#!/usr/bin/tclsh

#https://wiki.tcl-lang.org/page/join

set liz {a b c}

#スペース区切りで出力
puts stdout $liz

#unko区切りで出力
puts stdout [join $liz " unko "]

#concat
puts stdout [join $liz ""]

puts stdout [join $liz "+"]
