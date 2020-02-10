#!/bin/bash

usage(){
cat <<EOS
Usage:
  $./unko.sh 3
   array[NR],
   array[NR],","array[NR-1],
   array[NR],","array[NR-1],","array[NR-2],
   array[NR],","array[NR-1],","array[NR-2],","array[NR-3],
   array[NR],
   array[NR],","array[NR+1],
   array[NR],","array[NR+1],","array[NR+2],
   array[NR],","array[NR+1],","array[NR+2],","array[NR+3]
  $./unko.sh 2
   array[NR],
   array[NR],","array[NR-1],
   array[NR],","array[NR-1],","array[NR-2],
   array[NR],
   array[NR],","array[NR+1],
   array[NR],","array[NR+1],","array[NR+2]
  $./unko.sh 1
   array[NR],
   array[NR],","array[NR-1],
   array[NR],
   array[NR],","array[NR+1]
  \$seq 1 | ./unko.sh 
   array[NR],
   array[NR],","array[NR-1],
   array[NR],
   array[NR],","array[NR+1]
EOS
}

make_dyn_cmd(){
  #seq 0 "$@" | tac | xargs -I@ printf "array[NR+%s]\n" @ | awk '{array[NR]=array[NR-1]"\x22,\x22"$1",";}{print array[NR]}' | sed 's;+0;;'
  #seq 0 "$@" | tac | xargs -I@ printf "array[NR-%s]\n" @ | awk '{array[NR]=array[NR-1]"\x22,\x22"$1",";}{print array[NR]}' | sed 's;-0;;'
  seq 0 "$@" | tac | xargs -I@ printf "array[NR+%s]\n" @ 
  #seq 0 "$@" | tac | xargs -I@ printf "array[NR-%s]\n" @ 
}

chk_args(){
  #https://wiki.bash-hackers.org/syntax/pattern
  #うんこでるところまでがOK
  local init_args="$@";
  #単一行チェック
  echo "${init_args}" | xxd -ps -c1 | sed '$ s/0a//' | grep -E "^0a$|^20$" 1>/dev/null 2>/dev/null && usage && exit 1;
  #空文字チェック
  [ -z ${init_args} ] && usage && exit 1;
  #数値以外除外チェック
  echo $init_args | grep -v "[0-9]" 1>/dev/null 2>/dev/null && usage && exit 1;
  #数値1以上チェック
  [ ${init_args} -le 0 ] && usage && exit 1;
#  echo 💩
  return 0;
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  #行頭の[","]をとって、最終行の行末のカンマを削除する。
  [ $? -eq 0 ] && make_dyn_cmd "${init_args}" | sed 's;^",";;' | sed '$ s/,$//'
}

#単体実行用のインターフェース
[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main

#結合テスト用のインターフェース
#環境変数で親シェルから子シェルに値を渡す$MX_RANGE_NUM
#親シェル(当該スクリプトの呼び出し元)ではexportして渡す。忘れてた。
#echo -ne "${MX_RANGE_NUM}" | main
