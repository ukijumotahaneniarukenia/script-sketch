#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 XXXXX-go-マイスペ
EOS
exit 0
}

ENV_REPO=$1;shift

[ -z $ENV_REPO ] && usage


mkdir -p $ENV_REPO


cd $ENV_REPO

echo '/.idea/* /.gradle/* /nnn/build/*' | xargs -n1 >.gitignore


echo Now On Air
