#!/bin/bash

usage(){
cat <<EOS
Ref:
https://ja.wikipedia.org/wiki/Unicode%E4%B8%80%E8%A6%A7_0000-0FFF

Usage:
\$$0 U30{4..4}{{1..9},{A..F}} U30{5..8}{{0..9},{A..F}} U30{9..9}{{0..6},{9..9},{A..F}}
\$$0 U30{A..F}{{0..9},{A..F}}
\$$0 U00{2..7}{{0..9},{A..E}}
\$$0 U30{3..4}{{0..9},{A..F}}
\$$0 U1f4a{{0..9},{A..F}}
\$$0 U1f4{a..b}{{0..9},{A..F}}
\$echo U1f4{a..b}{{0..9},{A..F}} | $0
\$$0 U{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}
EOS
  exit 1
}

chk_fmt(){
  [ -z "$@" ] && usage
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  for ele in "${argv[@]}";do
    echo "${ele}" | grep -v "^U" 1>/dev/null 2>&1 && usage
    [ $(echo "${ele}" | xxd -ps -c1 | grep -v ^0a$ | grep -c "") -gt 9 ] && usage
  done
}

exec_zero_pad(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  for ele in "${argv[@]}";do
    #debug用
    #echo "${ele}" $(zero_pad "${ele}")
    zero_pad "${ele}"
  done
}

zero_pad(){
  local mx_len=8
  local prefix=$(echo "$@" | awk '{print substr($1,1,1)}')
  local except_prefix=$(echo "$@" | awk '{print substr($1,2)}')
  local rsv_args_len=$(echo "${except_prefix}" | awk '{print length($1)}')
  local diff=$((mx_len-rsv_args_len))
  echo "" | awk -v pad="${diff}" -v prefix="${prefix}" -v except_prefix="${except_prefix}" '
  BEGIN{
    zero_str=""
  }
  {
    while(pad-- >0){
      zero_str=zero_str""sprintf("%s","0");
    }
    print prefix""zero_str""except_prefix
  }'
}

circle(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  #debug用
  #echo "cnt:${argc},start:${argv[@]:0:1},end:${argv[@]:${#argv[@]}-1:1}"
  cmd=$(echo '\\\\\\\\'{${argv[@]}} | tr ' ' ',' | sed 's;^;echo ;')
  eval $cmd | tr -d ' ' | xargs -I@ bash -c 'echo @ | sed -n -r -e "
  p
  :loop
  s/(\\\U........){1}(.*)/\2\1/
  p
  /@/!bloop
  "
  ' |sed 's/^/echo -e \x27/;s/$/\x27/' | head -n$argc | sh
}

main(){
  local rsv_args="$(cat -)";
  chk_fmt "${rsv_args}"
  zero_pad_done=$(exec_zero_pad "${rsv_args}")
  circle $zero_pad_done
  exit 0
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
