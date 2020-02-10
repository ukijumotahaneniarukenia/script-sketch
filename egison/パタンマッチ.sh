#!/bin/bash

#cons

egison -e '(match-all {1 2 3} (multiset integer)
          [<cons $x $xs> [x xs]])'

egison -e '(match-all {1 2 3} (multiset integer)
  [<cons $x <cons $y _>> [x y]])'

#前回の結果を分配して要素を求めている
egison -e '(match-all {1 2 3} (multiset integer)
  [<cons $x
    <cons $y _>> [x y]])'
