#!/bin/bash

main(){
  echo "$(cat -)";
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
