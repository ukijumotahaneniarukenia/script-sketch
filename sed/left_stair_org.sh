#!/bin/bash

#ok
#echo {a..z} | tr -d ' ' | xargs -I@ bash -c 'echo @ | sed -n -r "
#:loop
#s/(.){1}(.*)/\2\1/
#p
#/@/!bloop
#"
#'
#ok
#echo ありがとうございました | xargs -I@ bash -c 'echo @ | sed -n -r "
#:loop
#s/(.){1}(.*)/\2\1/
#p
#/@/!bloop
#"
#'

#echo '\U1f4a'{0..2} | xargs -I@ bash -c 'echo -e @ | sed --debug -n -r "
#:loop
#s/(.){1}(.*)/\2\1/
#p
#/@/!bloop
#"
#'


#circle(){
#  declare -a argv=()
#  local argv=($@)
#  local argc="${#argv[@]}"
#  echo $argc
#  echo ${argv[@]}
#  echo ${argv[@]:0:1}
#  echo ${argv[@]:0:2}
#  echo ${argv[@]:0:3}
#  echo ${argv[@]:2:1}
#  echo ${argv[@]:1:1}
#  echo ${argv[@]:0:1}
#  eval echo '\\\\U1f4a'{${argv[@]:0:1}..${argv[@]:2:1}}
#}

usage(){
cat <<EOS
Usage:
\$$0 U1f4a{{0..9},{A..F}}

\$$0 U{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}{{0..9},{A..F}}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}{{0..9},{A..F}}
\$$0 U{{0..9},{A..F}}
EOS
  exit 1
}

chk_fmt(){
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
  chk_fmt "$@"
  zero_pad_done=$(exec_zero_pad "$@")
  circle $zero_pad_done
  exit 0
}

main "$@"
