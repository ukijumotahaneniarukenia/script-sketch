#!/bin/bash

usage(){
  cat <<EOF
Usage:
\$$0 '\\\\U0001f4a'{0..9}
EOF
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
}

circle(){
  paste -d' ' <(sed 's;^;\x5c\x5c;;s; ; \x5c\x5c;g;' <<<"$@" | xargs -n1 | ./left_stair.py) <(sed 's;^;\x5c\x5c;;s; ; \x5c\x5c;g;' <<<"$@" | xargs -n1 | tac | ./right_stair.py)
  paste -d' ' <(sed 's;^;\x5c\x5c;;s; ; \x5c\x5c;g;' <<<"$@" | xargs -n1 | ./right_stair.py) <(sed 's;^;\x5c\x5c;;s; ; \x5c\x5c;g;' <<<"$@" | xargs -n1 | tac | ./left_stair.py) 
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle ${ln};done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
