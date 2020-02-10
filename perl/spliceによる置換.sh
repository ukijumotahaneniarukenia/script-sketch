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
  sub mock4{
    for(0..$#_){
      my $ele=splice(@_,0,1);#shift
      splice(@_,$#_+1,0,$ele);#push
      print "ind:".$_.",ele:".$_[$_].",cnt:".scalar(@_).",liz:".join("",@_).",init_args:".$#_,"\n";
    }
  }
  mock4(@ARGV);
  '
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
