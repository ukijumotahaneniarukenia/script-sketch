#!/bin/bash

usage(){
  cat <<EOF
Usage:
\$echo {d..a} | ./spliceによる配列参照_with_perl.sh
ind:0,ele:c,cnt:4,liz:cbad,init_args:dcba
ind:1,ele:a,cnt:4,liz:badc,init_args:dcba
ind:2,ele:c,cnt:4,liz:adcb,init_args:dcba
ind:3,ele:a,cnt:4,liz:dcba,init_args:dcba
--------------------------------------------------------------------------------
ind:0,ele:a,cnt:4,liz:adcb,init_args:dcba
ind:1,ele:a,cnt:4,liz:badc,init_args:dcba
ind:2,ele:a,cnt:4,liz:cbad,init_args:dcba
ind:3,ele:a,cnt:4,liz:dcba,init_args:dcba
\$echo {a..d} | ./spliceによる配列参照_with_perl.sh
ind:0,ele:b,cnt:4,liz:bcda,init_args:abcd
ind:1,ele:d,cnt:4,liz:cdab,init_args:abcd
ind:2,ele:b,cnt:4,liz:dabc,init_args:abcd
ind:3,ele:d,cnt:4,liz:abcd,init_args:abcd
--------------------------------------------------------------------------------
ind:0,ele:d,cnt:4,liz:dabc,init_args:abcd
ind:1,ele:d,cnt:4,liz:cdab,init_args:abcd
ind:2,ele:d,cnt:4,liz:bcda,init_args:abcd
ind:3,ele:d,cnt:4,liz:abcd,init_args:abcd
$./spliceによる配列参照_with_perl.sh \$(echo -e '\U1f4a'{0..9})
ind:0,ele:💡,cnt:10,liz:💡💢💣💤💥💦💧💨💩💠,init_args:💠💡💢💣💤💥💦💧💨💩
ind:1,ele:💣,cnt:10,liz:💢💣💤💥💦💧💨💩💠💡,init_args:💠💡💢💣💤💥💦💧💨💩
ind:2,ele:💥,cnt:10,liz:💣💤💥💦💧💨💩💠💡💢,init_args:💠💡💢💣💤💥💦💧💨💩
ind:3,ele:💧,cnt:10,liz:💤💥💦💧💨💩💠💡💢💣,init_args:💠💡💢💣💤💥💦💧💨💩
ind:4,ele:💩,cnt:10,liz:💥💦💧💨💩💠💡💢💣💤,init_args:💠💡💢💣💤💥💦💧💨💩
ind:5,ele:💡,cnt:10,liz:💦💧💨💩💠💡💢💣💤💥,init_args:💠💡💢💣💤💥💦💧💨💩
ind:6,ele:💣,cnt:10,liz:💧💨💩💠💡💢💣💤💥💦,init_args:💠💡💢💣💤💥💦💧💨💩
ind:7,ele:💥,cnt:10,liz:💨💩💠💡💢💣💤💥💦💧,init_args:💠💡💢💣💤💥💦💧💨💩
ind:8,ele:💧,cnt:10,liz:💩💠💡💢💣💤💥💦💧💨,init_args:💠💡💢💣💤💥💦💧💨💩
ind:9,ele:💩,cnt:10,liz:💠💡💢💣💤💥💦💧💨💩,init_args:💠💡💢💣💤💥💦💧💨💩
--------------------------------------------------------------------------------
ind:0,ele:💩,cnt:10,liz:💩💠💡💢💣💤💥💦💧💨,init_args:💠💡💢💣💤💥💦💧💨💩
ind:1,ele:💩,cnt:10,liz:💨💩💠💡💢💣💤💥💦💧,init_args:💠💡💢💣💤💥💦💧💨💩
ind:2,ele:💩,cnt:10,liz:💧💨💩💠💡💢💣💤💥💦,init_args:💠💡💢💣💤💥💦💧💨💩
ind:3,ele:💩,cnt:10,liz:💦💧💨💩💠💡💢💣💤💥,init_args:💠💡💢💣💤💥💦💧💨💩
ind:4,ele:💩,cnt:10,liz:💥💦💧💨💩💠💡💢💣💤,init_args:💠💡💢💣💤💥💦💧💨💩
ind:5,ele:💩,cnt:10,liz:💤💥💦💧💨💩💠💡💢💣,init_args:💠💡💢💣💤💥💦💧💨💩
ind:6,ele:💩,cnt:10,liz:💣💤💥💦💧💨💩💠💡💢,init_args:💠💡💢💣💤💥💦💧💨💩
ind:7,ele:💩,cnt:10,liz:💢💣💤💥💦💧💨💩💠💡,init_args:💠💡💢💣💤💥💦💧💨💩
ind:8,ele:💩,cnt:10,liz:💡💢💣💤💥💦💧💨💩💠,init_args:💠💡💢💣💤💥💦💧💨💩
ind:9,ele:💩,cnt:10,liz:💠💡💢💣💤💥💦💧💨💩,init_args:💠💡💢💣💤💥💦💧💨💩
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
    my @init_args=@_;
    for(0..$#_){
      my $ele=splice(@_,0,1);#shift
      splice(@_,$#_+1,0,$ele);#push
      print "ind:".$_.",ele:".$_[$_].",cnt:".scalar(@_).",liz:".join("",@_).",init_args:".join("",@init_args),"\n";
    }
  }
  mock4(@ARGV);
  print "-"x80,"\n";
  sub mock5{
    my @init_args=@_;
    for(0..$#_){
      my $ele=splice(@_,-1);#pop
      splice(@_,0,0,$ele);#unshift
      print "ind:".$_.",ele:".$_[$_].",cnt:".scalar(@_).",liz:".join("",@_).",init_args:".join("",@init_args),"\n";
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
