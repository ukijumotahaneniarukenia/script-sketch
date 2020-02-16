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
  declare -a rsv_args=($(echo -e "$@"))
  for((ind=0;ind<${#rsv_args[@]};ind++)){
    cat "${rsv_args[@]:$ind:1}" | column -t -s,
  }
}

main(){
  local init_args="$(cat -)";
  chk_args ${init_args}
  mock ${init_args}
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
