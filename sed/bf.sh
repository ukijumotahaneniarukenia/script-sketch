#!/bin/bash


#最終行はエスケープ必要
seq 3 | sed -f <(cat <<EOS
p;
x;
H;
s;\n$;;;
\$!d;
EOS
)
