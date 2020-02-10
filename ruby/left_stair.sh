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
echo "$@" | xargs -I@ ruby -e '
def mock4(rsv_args)
  ary=rsv_args.split(" ");
  ary.each_with_index do |x,i|
    ele=ary.slice!(0)
    ary.insert(rsv_args.split.length-1,"#{ele}")
    print ary.join("")
    puts
  end
end
mock4("@")
  '
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
