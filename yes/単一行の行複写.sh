#!/bin/bash

usage(){
cat <<EOS
Usage:
$./単一行の行複写.sh 2 'echo unko'
echo unko
echo unko
$./単一行の行複写.sh 2 'echo unko' | sh
unko
unko
$./単一行の行複写.sh 2 'echo {a..c}'
echo a b c
echo a b c
$./単一行の行複写.sh 2 'echo {a..c}' | sh
a b c
a b c
$./単一行の行複写.sh 2 'seq 3'
seq 3
seq 3
$./単一行の行複写.sh 2 'seq 3' | sh
1
2
3
1
2
3
$./単一行の行複写.sh 2 \$(printf "%s %s" seq 3)
seq 3
seq 3
$./単一行の行複写.sh 2 \$(printf "%s %s" seq 3) | sh
1
2
3
1
2
3
\$echo 2 seq 3 | ./単一行の行複写.sh
seq 3
seq 3
\$echo 2 seq 3 | ./単一行の行複写.sh | sh
1
2
3
1
2
3
EOS
}

dupl(){
  local incr="$1";shift;
  local unit="$@";
  echo "${unit}" | xargs -I@ echo "yes @|head -n$incr" | bash
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
  incr="${argv}"
  #数値チェック
  echo "${incr}" | grep -v "[0-9]" 1>/dev/null 2>/dev/null && usage && exit 1;
  unit="${argv[@]:1}"
}

chk_stdin(){
  #単一行チェック
  echo "$@" | xxd -ps -c1 | sed '$ s/0a//' | grep "^0a$" 1>/dev/null 2>/dev/null && usage && exit 1;
}

main(){
  local init_args="$(cat -)";
  chk_stdin "${init_args}"
  chk_args "${init_args}"
  dupl "${incr}" "${unit}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
