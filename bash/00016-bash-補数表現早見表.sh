#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 9 9
EOS
exit 0
}

MX_LFT_N=$1;shift
MX_RGT_N=$1;shift
[ -z $MX_LFT_N ] && usage
[ -z $MX_RGT_N ] && usage

seq 00 99 | awk -v FS='' -v MX_LFT_N=$MX_LFT_N -v MX_RGT_N=$MX_RGT_N '$1<=MX_LFT_N&&$1<$2&&$2<=MX_RGT_N{print $1,$2}' | while read N H;do
  echo $N $H
  echo 0,1 | xargs -I@ bash -c "yes @ | head -n$N" | sed 's/^/{/g;'|sed 's/$/}/' | xargs | tr -d ' ' | sed -r "s/^/\$[$H#/;s/$/]/" | xargs -I@ bash -c "echo  @"
done
