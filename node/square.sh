#!/bin/bash

usage(){
  cat <<EOF
Usage:
\$$0 \$(echo -e '\U1f4a'{0..9})
EOF
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
}

circle(){
  paste -d' ' <(./left_stair.sh $(echo -e "$@")) <(./right_stair.sh $(echo -e "$@"|rev))
  paste -d' ' <(./right_stair.sh $(echo -e "$@")) <(./left_stair.sh $(echo -e "$@"|rev))
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main

