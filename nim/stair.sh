#!/bin/bash

cat <<EOS >stair.nim && nim c stair.nim 2>/dev/null && echo {a..c} | tr -d ' ' | ./stair
var stdin=readLine(stdin)
for i in 0..len(stdin)-1:
  echo stdin[0..i]
EOS
