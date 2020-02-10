#!/bin/bash

#雑にやるやつ
#echo "cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 8 | sort | uniq | while read ln;do";
#seq 10 | awk '{print "echo $ln | awk \x27{print substr($0,1,"$0")}\x27"}'
#seq 10 | awk '{print "echo $ln | rev | awk \x27{print substr($0,1,"$0")}\x27"}'
#echo "done"

usage(){
  cat <<EOS
Usage:
\$echo 3 | ./ランダムデータ作成.sh | sh | xargs | sed -e 's; ;\\x27,\\x27;g' -e 's;^;my \$array=[\\x27;' -e 's;$;\\x27]\\;;' -e '1i#!/usr/local/bin/perl' -e '\$a1;'


$./ランダムデータ作成.sh 3 | sh | xargs
E Et Etw w wt wtE L LD LDJ J JD JDL q q0 q07 7 70 70q
\$echo 2 | ./ランダムデータ作成.sh | sh | xargs
6 63 3 36 t to o ot
\$time echo 1 | ./ランダムデータ作成.sh | sh | xargs | tr ' ' '\n' | grep -c ''
2

real	0m0.017s
user	0m0.016s
sys	0m0.027s
\$time echo 2 | ./ランダムデータ作成.sh | sh | xargs | tr ' ' '\n' | grep -c ''
8

real	0m0.024s
user	0m0.024s
sys	0m0.031s
\$time echo 3 | ./ランダムデータ作成.sh | sh | xargs | tr ' ' '\n' | grep -c ''
18

real	0m0.038s
user	0m0.041s
sys	0m0.036s
\$time echo 4 | ./ランダムデータ作成.sh | sh | xargs | tr ' ' '\n' | grep -c ''
32

real	0m0.061s
user	0m0.051s
sys	0m0.061s
\$time echo 5 | ./ランダムデータ作成.sh | sh | xargs | tr ' ' '\n' | grep -c ''
50

real	0m0.090s
user	0m0.073s
sys	0m0.082s
\$time echo 10 | ./ランダムデータ作成.sh | sh | xargs | tr ' ' '\n' | grep -c ''
200

real	0m0.284s
user	0m0.216s
sys	0m0.241s
EOS
}

chk_args(){
  #空文字チェック
  [ -z "$@" ] && usage && exit 1
  #数値以外除外チェック
  echo "$@" | grep -v "[0-9]" 1>/dev/null 2>/dev/null && usage && exit 1;
  #数値1以上チェック
  [ "$@" -le 0 ] && usage && exit 1;
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  cmd="${cmd}""$(echo "cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w "${init_args}" | head -n "${init_args}" | sort | uniq | while read ln;do")"
  cmd="${cmd}""\n""$(seq "${init_args}" | awk '{print "echo $ln | awk \x27{print substr($0,1,"$0")}\x27"}')"
  cmd="${cmd}""\n""$(seq "${init_args}" | awk '{print "echo $ln | rev | awk \x27{print substr($0,1,"$0")}\x27"}')"
  cmd="${cmd}""\n""$(echo "done")"
  echo -e "${cmd}"
  #下でも変わらない100アイテムで20秒ぐらい
  #echo "cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w "${init_args}" | head -n "${init_args}" | sort | uniq | while read ln;do";
  #seq "${init_args}" | awk '{print "echo $ln | awk \x27{print substr($0,1,"$0")}\x27"}'
  #seq "${init_args}" | awk '{print "echo $ln | rev | awk \x27{print substr($0,1,"$0")}\x27"}'
  #echo "done"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
