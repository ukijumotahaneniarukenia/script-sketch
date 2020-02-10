#!/bin/bash


#egison -e '
#(let {[$odd? (lambda [$n] (eq? (modulo n 2) 1))]}
#  (filter odd? {1 2 3}))
#'

#;;(match-all (split-string " " "@") (list string)[(loop $i [1 (length(split-string " " "@"))] <join $x_i $x_i> map( (lambda [] ) (split-string " " "@")))])
#echo "$@" | xargs -I@ -t egison -e '
#(match-all {1 2 3} (set string) [<cons $x <cons $y _>> [x y]])
#'

#perm(){
#  cnt=$1;shift;
#  tgt=$@;
#  seq $cnt | xargs -I@ echo @ $tgt |xargs -I% bash -c 'egison -T -e "(match-all (cdr {%})(set string)[(loop \$i [1 (car {%})] <cons $x <cons \$x_i ...>> _) (map (lambda [\$i] x_i) (between 1 (car {%})))])"'
#}
#perm 4 {a..d}

#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {1 2 3} (set string) [<cons $x <cons $y <cons $z _>>> [x y z]])
#'
#
#echo "$@" | xargs -I@ -t egison -T -e '
#(match-all {1 2 3} (set string) [<cons $x <cons $y _>> [x y z]])
#'

#echo "$@" | xargs -I@ -t egison -e '
#(min {@})
#'

#echo "$@" | xargs -I@ -t egison -e '
#(max {1 @})
#'

#echo "$@" | xargs -I% -t egison -e '
#(max {1 @(cdr {%})})
#'

#echo "$@" | xargs -I% -t egison -e '
#(max {1 (length (cdr {%}))})
#'

#echo "$@" | xargs -I% -t egison -e '
#(max {(car {%}) (length (cdr {%}))})
#'

#echo "$@" | xargs -I% -t egison -e '
#(cdr {%})
#'

#echo "$@" | xargs -I% -t egison -e '
#{@(cdr {%})}
#'

#perm(){
#  cnt=$1;shift;
#  tgt=$@;
#  seq $cnt | xargs -I@ echo @ $tgt |xargs -I% bash -c 'egison -T -e "(match-all (cdr {%})(list string)[(loop \$i [1 (car {%})] <join _ <cons \$x_i ...>> _) (map (lambda [\$i] x_i) (between 1 (car {%})))])"'
#}
#perm 4 {a..d}

#f(){
#  args=$1;shift;
#  echo $args "$@" | xargs -I% egison -e ' (max {(car {%}) (length (cdr {%}))})'
#}
#f 5 {1..4}



#f(){
#echo "$@" | xargs -I% egison -e '
#(let {[$mn (min {(car {%}) (length (cdr {%}))})]} mn)
#'
#}
#f(){
#  echo "$@" | xargs -I% egison -e '
#  (
#    let {[$mn (min {(car {%}) (length (cdr {%}))})]}
#    (between 1 mn)
#  )
#'
#}
#
perm(){
  echo "$@" | xargs -I% egison -T -e '
  (
    let {[$mn (min {(car {%}) (length (cdr {%}))})]}
    (
      match-all (cdr {%}) (multiset string)
      [
        (loop $i [1 mn] <cons $x_i ...> _)
          (map (lambda [$i] x_i) (between 1 mn))
      ]
    )
  )
'
}
f 5 {a..d}
