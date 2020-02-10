#!/bin/bash

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
#perm 0 a
perm 4 あ い う え お
#perm 3 {a..d}
#perm 2 {a..d}
#perm 1 {a..d}
