#!/bin/bash

usage(){
  cat <<EOF
Usage:
\$$0 "\$(echo -e '\U1f4a'{0..9} | sed 's;^;[";;s;$;"];;s; ;", ";g;')"
\$$0 "\$(echo -e '\U1f4a'{0..9} | sed 's;^;[";;s;$;"];;s; ;", ";g;')"
\$echo -e '\U1f4a'{0..9} | sed 's;^;[";;s;$;"];;s; ;", ";g;' | $0
EOF
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
}

circle(){
  paste -d' ' <(echo "$@" | ./left_stair.sh "$@") <(echo "$@" | rev | sed 's;^];[;;s;\[$;];;' | ./right_stair.sh)
  paste -d' ' <(echo "$@" | ./right_stair.sh "$@") <(echo "$@" | rev | sed 's;^];[;;s;\[$;];;' | ./left_stair.sh)
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
