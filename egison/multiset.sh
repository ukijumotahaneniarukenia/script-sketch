#!/bin/bash

echo -e {1..3} | xargs -I@ egison -e '(match-all {@} (multiset integer) [<join $x $xs> [x xs]])'

echo -e {a..c} | xargs -I@ egison -e '(match-all {@} (multiset string) [<join $x $xs> [x xs]])'
