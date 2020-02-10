#!/bin/bash

usage(){
cat <<EOS
パイプから入力してちょ
Usage:
\$echo unko | sed "s#\$#UNKO#"
EOS
}

[ -p /dev/stdin ] && cat - | sed "s#\$#$@#"
[ -p /dev/stdin ] || usage && exit 1
