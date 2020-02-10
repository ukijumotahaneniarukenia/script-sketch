#!/bin/bash

#echo {a..c} | xargs -I% egison -T -e '
#(let* {[$tgt (split-string " " "%")] [$cnt (length tgt)]}
#  (
#    match-all tgt (list string)
#    [
#      (loop $i [1 cnt] <join $x_i ...> _)
#        (map (lambda [$i] x_i) (between 1 cnt))
#    ]
#  )
#)
#'

#部分集合の位置関係網羅パタン
#$./パタン1.sh
#{}	{}	{}
#{}	{}	{"a"}
#{}	{"a"}	{}
#{"a"}	{}	{}
#{}	{}	{"a" "b"}
#{}	{"a"}	{"b"}
#{}	{"a" "b"}	{}
#{"a"}	{}	{"b"}
#{"a"}	{"b"}	{}
#{"a" "b"}	{}	{}
#{}	{}	{"a" "b" "c"}
#{}	{"a"}	{"b" "c"}
#{}	{"a" "b"}	{"c"}
#{}	{"a" "b" "c"}	{}
#{"a"}	{}	{"b" "c"}
#{"a"}	{"b"}	{"c"}
#{"a"}	{"b" "c"}	{}
#{"a" "b"}	{}	{"c"}
#{"a" "b"}	{"c"}	{}
#{"a" "b" "c"}	{}	{}
