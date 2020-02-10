#!/bin/bash

usage(){
  cat <<EOF
Usage:
$./primitive-functions-Numbers.sh {1..2}
\$echo {1..2} | ./primitive-functions-Numbers.sh
EOF
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
}

num_func(){
  #逆ポーランド記法
  #足し算
#  echo "$@" | xargs -t -I@ egison -e '(+ @)'
#  
#  #引き算
#  echo "$@" | xargs -t -I@ egison -e '(- @)'
#  
#  #掛け算
#  echo "$@" | xargs -t -I@ egison -e '(* @)'
#  
#  #割り算
#  echo "$@" | xargs -t -I@ egison -e '(/ @)'
#  
#  #分子
#  echo "$@" | xargs -t -I@ egison -e '(numerator(/ @))'
#  
#  #分母
#  echo "$@" | xargs -t -I@ egison -e '(denominator(/ @))'
  
  #余り
  echo "$@" | xargs -t -I@ egison -e '(modulo @)'
  
  #商
  echo "$@" | xargs -t -I@ egison -e '(quotient @)'
  
  #余り
  echo "$@" | xargs -t -I@ egison -e '(remainder @)'
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  num_func "${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main

