#!/bin/bash

usage(){
cat <<EOS
Usage:
   IN: seq 10 | $0
  OUT: 1
    or
   IN: seq 1 | $0
  OUT: 0
    or
   IN: seq 1 | xargs -n3 | $0
  OUT: 0
    or
   IN: seq 10 | xargs -n3 | $0
  OUT: 1
EOS
}

chk_single_row(){
  #単一行チェック
  local CNT=0
  while read ln;do
    [ $(echo $ln | grep -c "0a") -eq 1 ] && CNT=$((CNT + 1))
  done < <(echo "$@" | xxd -ps -c1)
  [ $CNT -gt 1 ] || echo 0
  [ $CNT -gt 1 ] && echo 1
}

main(){
  n="$(cat -)";
  [ -z "$n" ] && usage
  chk_single_row "$n"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
