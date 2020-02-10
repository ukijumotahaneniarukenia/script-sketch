#!/bin/bash

usage(){
  cat <<EOF
Usage:
\$echo U1f4{a..b}{{0..9},{A..F}} | $0
\$$0 U30{4..4}{{1..9},{A..F}} U30{5..8}{{0..9},{A..F}} U30{9..9}{{0..6},{9..9},{A..F}}
\$$0 U30{A..F}{{0..9},{A..F}}
\$$0 U00{2..7}{{0..9},{A..E}}
\$$0 U30{3..4}{{0..9},{A..F}}
\$$0 U1f4a{{0..9},{A..F}}
\$$0 U1f4{a..b}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}
EOF
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
}

circle(){
  paste -d' ' <(echo "$@" | ./left_stair.sh) <(echo "$@" | tr ' ' '\n' | tac | xargs | ./right_stair.sh)
  paste -d' ' <(echo "$@" | ./right_stair.sh) <(echo "$@" | tr ' ' '\n' | tac | xargs | ./left_stair.sh)
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
