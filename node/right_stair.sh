#!/bin/bash

#https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Array/join
#https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/String/split
#https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice

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
  echo "$@" | xargs -I@ node -e '
  function mock5(init_args){
    let ary=init_args.split(" ");
    for(let i=1;i<=ary.length;i++){
      let ele=ary.splice(-1,1);
      ary.splice(0,0,ele);
      console.log(ary.join(""));
    }
  }
  mock5("@");
  '
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
