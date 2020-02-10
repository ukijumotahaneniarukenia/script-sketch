#!/usr/bin/tclsh

#proc unko nm {
#  upvar 1 $nm var
#  set var 5
#}
#unko a
#puts $a

#proc unko nm {
#  #upvar 1 $nm var
#  #変数の定義レベルをupvar関数の第一引数で指定しているぽい。
#  #省略時はデフォで1。
#  #別名貼りたいとき便利そう。
#  #ダイナミックに制御できる。
#  upvar $nm var
#  set var 5
#}
#unko a
#puts $a

#https://wiki.tcl-lang.org/page/upvar

proc unko2 {nm val} {
  #upvar 1 $nm var
  #変数の定義レベルをupvar関数の第一引数で指定しているぽい。
  #省略時はデフォで1。
  #別名貼りたいとき便利そう。
  #ダイナミックに制御できる。
  upvar $nm var
  set var $val
}
#unko2 a 10
#puts $a



set liz [list a b c]

puts $liz
