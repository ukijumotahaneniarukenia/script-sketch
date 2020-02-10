#!/bin/bash

usage(){
  cat <<EOF
Usage:
\$$0 \$(echo -e '\U1f4a'{0..9} | sed 's;^;[";;s;$;"];;s; ;", ";g;')
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
  echo "$@" | jq -c '
    .|length as $cnt
    |. as $rsv_args
    |[range(1;$cnt+1)]
    |foreach .[] as $ind(
      [];
      $rsv_args[-$ind:]+$rsv_args[:-$ind]
    )
  '
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
