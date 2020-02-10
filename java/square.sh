#!/bin/bash
#完全バッファリング
#https://katsumiinoue.wordpress.com/2019/02/02/bash-sed-grep-%E5%85%A5%E5%87%BA%E5%8A%9B%E3%83%90%E3%83%83%E3%83%95%E3%82%A1%E3%83%AA%E3%83%B3%E3%82%B0%E5%95%8F%E9%A1%8C%E3%81%A7%E5%B5%8C%E3%82%8B/
#https://blog.amedama.jp/entry/2017/11/23/162226
#https://linuxcommand.net/stdbuf/
usage(){
  cat <<EOF
Usage:
\$$0 \$(echo -e '\U1f4a'{0..9})
\$$0 '\U1f4a'{0..9}
\$echo -e '\U1f4a'{0..9} | $0
\$seq 10 | xargs -n4 | $0
EOF
  exit 1
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

chk_argc(){
  #引数個数チェック
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
}

single_circle(){
  local rsv_args="$@";
  #単一行の場合
  while read ln;do
    paste -d' ' <(echo "${ln}" | java Left_Stair.java) <(echo "${ln}" | rev | java Right_Stair.java)
    paste -d' ' <(echo "${ln}" | java Right_Stair.java) <(echo "${ln}" | rev | java Left_Stair.java)
  done <<<"${rsv_args}"
  exit 0
}

multip_circle(){
  local rsv_args="$@";
  #複数行の場合
  while read ln;do
    paste -d' ' <(echo "${ln}" | java Left_Stair.java) <(echo "${ln}" | tac | java Right_Stair.java)
    paste -d' ' <(echo "${ln}" | java Right_Stair.java) <(echo "${ln}" | tac | java Left_Stair.java)
  done <<<"${rsv_args}"
  exit 0
}

main(){
  local init_args="$(cat -)";
  chk_argc "${init_args}"
  ret=$(chk_single_row "${init_args}")
  [ $ret -eq 0 ] && single_circle "${init_args}"
  [ $ret -eq 1 ] && multip_circle "${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
