#!/bin/bash

echo {a..d} | xargs -I% egison -e '
  (map (lambda [$i] i) (split-string " " "%"))
'

echo 10 | xargs -I% egison -e '
  (map (lambda [$i] i) (take % nats))
'

echo 11 | xargs -I% egison -e '
  (map (lambda [$i] i) (take % nats0))
'

echo 11 | xargs -I% egison -e '
(map (lambda [$i] (* i i)) (take % nats0))
'

echo 11 | xargs -I% egison -e '
(map (lambda [$i] (* i i i)) (take % nats0))
'

