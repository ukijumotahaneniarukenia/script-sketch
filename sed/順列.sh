#!/bin/bash

echo {a..c} | tr -d ' ' | sed -ne '
s;$;💩;
:loop
p;
s;\(.\)\(.*💩\);\2\1;
tloop
'

#最後のパターンスペースの出力を抑止 -n
seq 15 | xargs -I@ printf %x @ | tr -d ' ' | sed -ne '
s;$;💩;
:loop
p;
s;\(.\)\(.*💩\);\2\1;
tloop
';echo;

#サブシェルで出力ためこむ
( seq 15 | xargs -I@ printf %x @  | sed -ne '
s;$;💩;
:loop
p;
s;\(.\)\(.*💩\);\2\1;
tloop
';echo; )|textimg -s
