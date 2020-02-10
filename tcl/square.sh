#!/bin/bash

usage(){
  cat <<EOF
Usage:
$echo -e 1 '\U1f4a'{1..9} | $0
\$$0 1 '\U1f4a'{1..9}
EOF
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 2 ] && usage && exit 1
}

circle(){
  local grp="$1";shift
  local args="$@";shift
  paste -d' ' <(echo "${args}" | xargs -n"${grp}" | ./left_stair.tcl) <(echo "${args}" | rev | xargs -n"${grp}" | ./right_stair.tcl)
  paste -d' ' <(echo "${args}" | xargs -n"${grp}" | ./right_stair.tcl) <(echo "${args}" | rev | xargs -n"${grp}" | ./left_stair.tcl)
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read grp args;do circle "${grp}" "${args}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
