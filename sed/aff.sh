#!/bin/bash

echo unko | sed -f <(cat <<EOS
s;$;💩;
#@置換対象はうんこ
tloop
#@ループ開始

:loop
#@うんこグループとうんこグループ以外
#@うんこグループの直後に改行いれてsplit
s;\(.\)\(.*💩\)\(.*\);\2\n\1\3;
#@置換対象なくなるまでループ
tloop
EOS
)|tac
