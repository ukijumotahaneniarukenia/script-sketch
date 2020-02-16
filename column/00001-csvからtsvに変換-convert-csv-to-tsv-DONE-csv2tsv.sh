#!/usr/bin/env bash

usage(){
  cat <<EOF
Usage:
  $0 test.csv
  or
  echo test.csv | $0
EOF
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ -z "${argv[@]:0:1}" ] && usage && exit 1
}

mock(){
  declare -a rcv_args=($(echo -e "$@"))
  for((idx=0;idx<${#rcv_args[@]};idx++)){
    cat "${rcv_args[@]:$idx:1}" | column -t -s,
  }
}

main(){
  local stdin="$(cat -)";
  chk_args ${stdin}
  mock ${stdin}
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
