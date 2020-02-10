#!/bin/bash

usage(){
cat <<EOS
Usage:
\$echo 10 | ./テキスト型のカラム列の作成.sh
col1 text,col2 text,col3 text,col4 text,col5 text,col6 text,col7 text,col8 text,col9 text,col10 text
$./テキスト型のカラム列の作成.sh 10
col1 text,col2 text,col3 text,col4 text,col5 text,col6 text,col7 text,col8 text,col9 text,col10 text
$./テキスト型のカラム列の作成.sh \$(seq 1)
col1 text
\$circle \$(./テキスト型のカラム列の作成.sh \$(seq 1))
col1 text
text col1
EOS
}

colz(){
  seq "$@" | awk '{print "col"NR"@text"}' | sed '$ s/0a//' | xargs | tr ' ' ',' | tr '@' ' '
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 0 ] && usage && exit 1
  local incr="${argv}"
  #数値チェック
  echo "${incr}" | grep -v "[0-9]" 1>/dev/null 2>/dev/null && usage && exit 1;
}

chk_stdin(){
  #単一行チェック
  echo "$@" | xxd -ps -c1 | sed '$ s/0a//' | grep "^0a$" 1>/dev/null 2>/dev/null && usage && exit 1;
  #単一列チェック
  awk '{print $2}'<<<"$@" | grep -v "^$" 1>/dev/null 2>/dev/null && usage && exit 1;
}

main(){
  local init_args="$(cat -)";
  chk_stdin "${init_args}"
  chk_args "${init_args}"
  colz "${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
