#!/bin/bash

#egison -e '(intercalate {# #} {{1 2}{3 3}{4}})'
echo @@@@@ {a..d} | xargs -I% egison -e '
(let* {[$rsv-args (split-string " " "%")] [$tkn (car rsv-args)] [$tgt (cdr rsv-args)]}
  (intercalate {tkn} {{} {(car tgt)} {}})
  )
'

echo "=" {1..10} | xargs -I% egison -e '
(let* {[$rsv-args (split-string " " "%")] [$tkn (car rsv-args)] [$tgt (cdr rsv-args)]}
  (intercalate {tkn} {{} {(cdr tgt)} {}})
  )
'
