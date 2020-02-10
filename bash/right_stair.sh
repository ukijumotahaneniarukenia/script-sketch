#!/bin/bash

usage(){
  cat <<EOF
Usage:
\$$0 '\U1f4a'{0..9}
\$echo -e '\U1f4a'{0..9} | $0
EOF
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
}

circle(){
  declare -a rsv_args=($(echo -e "$@"))
  for((ind=${#rsv_args[@]};ind>0;ind--)){
    echo ${rsv_args[@]:$ind} ${rsv_args[@]:0:$ind} 
  }
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
