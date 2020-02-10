#!/bin/bash

echo {a..d} | xargs -I% egison -e '
(map (lambda [$tgt] (match-all tgt (list string) [<join _ $x> x])) (split-string " " "%"))
'

echo {a..d} | xargs -I% egison -e '
(map (lambda [$tgt] (match-all tgt (list string) [<join $x _> x])) (split-string " " "%"))
'

echo {a..d} | xargs -I% egison -e '
(match-all (split-string " " "%") (list string) [<join $x _> x])
'

echo {a..d} | xargs -I% egison -e '
(map (lambda [$tgt] (match-all tgt (multiset string) [<join _ $x> x])) (split-string " " "%"))
'

echo {a..d} | xargs -I% egison -e '
(map (lambda [$tgt] (match-all tgt (multiset string) [<join $x _> x])) (split-string " " "%"))
'

echo {a..d} | xargs -I% egison -e '
(match-all (split-string " " "%") (multiset string) [<join $x _> x])
'

echo {a..d} | xargs -I% egison -e '
(map (lambda [$tgt] (match-all tgt (set string) [<join _ $x> x])) (split-string " " "%"))
'

echo {a..d} | xargs -I% egison -e '
(map (lambda [$tgt] (match-all tgt (set string) [<join $x _> x])) (split-string " " "%"))
'

echo {a..d} | xargs -I% egison -e '
(match-all (split-string " " "%") (set string) [<join $x _> x])
'
