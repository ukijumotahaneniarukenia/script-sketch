#!/bin/bash

#https://ref.xaio.jp/ruby/classes/array/element_assign
#https://ref.xaio.jp/ruby/classes/array/insert
#https://ref.xaio.jp/ruby/classes/array/element_ref

#echo {a..e} | xargs -I@ ruby -e 'ary="@".split(" ");ary.each_with_index do |ele,ind|puts "#{ind}"+":"+"#{ele}"end'
#echo {a..e} | xargs -I@ ruby -e 'ary="@".split(" ");ary.each_with_index do |ind,ele|puts "#{ind}"+":"+"#{ele}"end'

#echo -e '\U1f4a'{0..9} | xargs -I@ ruby -e 'ary="@".split(" ");p ary;

#echo {a..e} | xargs -I@ ruby -e 'ary="@".split(" ");p ary;
#ary.each_with_index do |x,i|
#  puts "ary[#{i}]"
#  print eval("ary[#{i}]")
#  eval("ary[#{i}]")
#  puts ary
#end
#'

#パタン０
#echo {a..e} | xargs -I@ ruby -e 'ary="@".split(" ");
#ary.each_with_index do |x,i|
#  ele=ary.slice!(0)
#  ary["@".split.length-1]="#{ele}"
#  print ary
#  puts
#end
#'
#
##パタン１
#echo {a..e} | xargs -I@ ruby -e 'ary="@".split(" ");
#ary.each_with_index do |x,i|
#  ele=ary.slice!(0)
#  ary.insert("@".split.length-1,"#{ele}")
#  print ary
#  puts
#end
#'
#
##パタン２
#echo {a..e} | xargs -I@ ruby -e 'ary="@".split(" ");
#ary.each_with_index do |x,i|
#  ele=ary.slice!("@".split.length-1)
#  ary.insert(0,"#{ele}")
#  print ary
#  puts
#end
#'
