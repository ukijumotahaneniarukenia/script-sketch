#!/bin/bash

echo -e {1..3} | xargs -I@ egison -e '(match-all {@} (set integer) [<join $x $xs> [x xs]])'

echo -e {a..c} | xargs -I@ egison -e '(match-all {@} (set string) [<join $x $xs> [x xs]])'
