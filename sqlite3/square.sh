#!/bin/bash

usage(){
  cat <<EOF
Usage:
\$$0 '\U1f4a'{0..9}
\$echo -e '\U1f4'{a..b}{{0..9},{A..F}} | $0
\$$0 '\U1f4a'{{0..9},{A..F}}
EOF
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
}

circle(){
  paste -d' ' <(echo "$@" | ./left_stair.sh 2>/dev/null) <(echo "$@" | rev | ./right_stair.sh 2>/dev/null)
  paste -d' ' <(echo "$@" | ./right_stair.sh 2>/dev/null) <(echo "$@" | rev | ./left_stair.sh 2>/dev/null)
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
