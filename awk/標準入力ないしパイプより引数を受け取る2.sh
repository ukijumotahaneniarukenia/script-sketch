#!/bin/bash
unko(){
  #受け取った引数を出力する
  init_args="$(cat -)";
  echo "$init_args"xxx;
}

main(){
  #サブシェルで入力を蓄積してunko関数に渡す。
  ([[ "$#" > 0 ]] && echo "$@" || cat -) | unko
}

main "$@"
