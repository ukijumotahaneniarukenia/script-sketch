#!/bin/bash

echo "$@" | xargs -I@ -t egison -e '
<<<<<<< HEAD
(match-all @ (list integer)[<cons $x $xs> [x xs]])
'
=======
(length(split-string " " "@"))
'
#
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $x $xs> [x]])
#'
#
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $x $xs> [xs]])
#'
#
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $xs $x> [x xs]])
#'
#
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $xs $x> [x]])
#'
#
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $xs $x> [xs]])
#'

#Error: something can only match with a pattern variable. not: <cons>
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons> [xs]])
#'

#Error: something can only match with a pattern variable. not: <cons $x>
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $x> [xs]])
#'

#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $x $xs> [xs]])
#'

#Error: something can only match with a pattern variable. not: <cons _ $x $xs>

#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons _ $x $xs> [xs]])
#'

#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons _ $x> [x]])
#'
#
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $xs _> [xs]])
#'

#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $x <cons $xx $xxx>> [x xx xxx]])
#'
#
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $x <cons $xx $xxx>> [xxx]])
#'
#
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $x <cons $xx $xxx>> [xx]])
#'
#
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $x <cons $xx $xxx>> [x]])
#'

#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $x <cons $xx <cons $xxx $xxxx>>> [x xx xxx xxxx]])
#'
#

#2つにグルーピング
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list integer)[<join $x $xx> [x xx]])
#'

#3つにグルーピング
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list integer)[<join $x <join $xx $xxx>> [x xx xxx]])
#'

#4つにグルーピング
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list integer)[<join $x <join $xx <join $xxx $xxxx>>> [x xx xxx xxxx]])
#'

#4つにグルーピング(欠損あり)
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list integer)[<join $x <join $xx <join $xxx _>>> [x xx xxx]])
#'
#
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<join _ $x> {x}])
#'

#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<join $x _ > {x}])
#'

#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<cons _ $x> {x}])
#'
#
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<cons $x _ > {x}])
#'

#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<cons $x $x> {x}])
#'

#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<cons $x $xx > {xx}])
#'
#
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<cons $x $xx > {x}])
#'
#
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<cons $x $xx > {}])
#'
#
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<cons $xx $x> {x xx}])
#'
#
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<cons $xx $x > {xx}])
#'
#
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<cons $xx $x > {x}])
#'
#
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<cons $xx $x > {}])
#'

#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {@} (list string)[<join $x <cons $xx $xxx>> {x xx xxx}])
#'

#Error: something can only match with a pattern variable. not: <cons $xss $xs $x>
#egison -e 
#(match-all {1 2 3 4 5 6 7 8 9 10} (list integer)[<cons $xss $xs $x> [x]])

#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $xss $xs $x> [xss xs x]])
#'
#
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {@} (list integer)[<cons $xss $xs $x> [x]])
#'
>>>>>>> e13dd4ea255f42cdb49b658c01b932da3e5cf35a
