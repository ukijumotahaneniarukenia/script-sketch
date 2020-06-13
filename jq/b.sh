#!/usr/bin/env bash

echo ポルコ 紅の豚 ジーナ マルコ| while read l;do
  r=2
  cmd="echo $l | jq -s -cRr  'split(\" \")|map(sub(\"\n$\";\"\")) as \$a|(\$a|length) as \$n|[range(1;(\$n+1))]|[combinations($r)|sort]|unique|map(select(unique|length==$r))|.[]|map(\$a[.-1])|join(\"\t\")'"
  echo $cmd
done
