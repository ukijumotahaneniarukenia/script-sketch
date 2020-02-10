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
  echo "$@" | xargs perl -e '
  sub mock5{
    my @init_args=@_;
    for(0..$#_){
      my $ele=splice(@_,-1);#pop
      splice(@_,0,0,$ele);#unshift
      print join("",@_),"\n";
    }
  }
  mock5(@ARGV);
  '
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
