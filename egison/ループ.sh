#!/bin/bash

#echo {a..d} | xargs -I% egison -e '
#  (
#    match-all (split-string " " "%") (list string)
#    [
#    <join $x $xx> x    
#    ]
#  )
#'

#echo {a..d} | xargs -I% egison -e '
#  (let {[$tgt (split-string " " "%")]}
#    (
#      match-all tgt (list string)
#      [
#       <join $x $xx> x    
#      ]
#    )
#  )
#'

#saikou 
#echo {a..d} | xargs -I% egison -T -e '
#(let* {[$tgt (split-string " " "%")] [$cnt (length $tgt)]}
#    (
#      match-all tgt (list string)
#      [
#      <join $xx <join $xx _>> xx
#      ;;      (loop $i [1 cnt] <join >)   
#      ]
#    )
#  )
#'

#{}	{"a" "b" "c" "d"}
#{"a"}	{"b" "c" "d"}
#{"a" "b"}	{"c" "d"}
#{"a" "b" "c"}	{"d"}
#{"a" "b" "c" "d"}	{}

#"a"	"b"	"c"	"d"
#"b"	"c"	"d"
#"c"	"d"
#"d"


#"a"
#
#"a"	"b"
#"b"
#
#"a"	"b"	"c"
#"b"	"c"
#"c"
#
#"a"	"b"	"c"	"d"
#"b"	"c"	"d"
#"c"	"d"
#"d"


#echo {a..d} | xargs -I% egison -T -e '
#(let* {[$tgt (split-string " " "%")] [$cnt (length tgt)]}
#    (
#      ;;match-all tgt (list string)
#      match-all tgt (multiset string)
#      ;;match-all tgt (set string)
#      [
#      ;;<join $lft $rgt> lft
#      ;;<join $lft $rgt> rgt
#      ;;<join $lft $rgt> {lft rgt}
#      ;;<join $lft _> lft
#      ;;<join _ $rgt> rgt
#      ;;<join $lft <join $lftt $rgt>> {lft lftt}
#
#      ;;<cons $lft $rgt> lft
#      ;;<cons $lft $rgt> rgt
#      ;;<cons $lft $rgt> {lft rgt} ;;自身とそれ以外
#      ;;<cons $lft <cons $lftt $rgt>> {lft lftt rgt}
#      ;;<cons $lft <cons $lftt <cons $lfttt $rgt>>> {lft lftt lfttt rgt}
#      <cons $lft <cons $lftt <cons $lfttt <cons $lftttt $rgt>>>> {lft lftt lfttt lftttt rgt}
#      ;;<join _ <join $x $xx>> xx
#      ;;<join _ <join $x _>> x ;;strrr
#      ;;<join _ <join _ <join $x _>>> x ;;strrr
#      ;;<join _ <join _ <join _ <join $x _>>>> x ;;strrr
#      ;;<join _ <cons $x $xx>> x ;;
#      ;;<cons _ <cons _ <cons _ <cons $x _>>>> x ;;
#      ;;<cons _ <cons $lft _>> {lft rgt} ;;
#      ]
#    )
#  )
#'



echo {a..c} | xargs -I% egison -T -e '
(let* {[$tgt (split-string " " "%")] [$cnt (length tgt)]}
  (
    match-all tgt (multiset string)
    [
      (loop $i [1 cnt] <cons $x_i ...> _)
        (map (lambda [$i] x_i) (between 1 cnt))
    ]
  )
)
'
