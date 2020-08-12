#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  bash $0 99999-kotlin-テンプレートプロジェクト
EOS
exit 0
}

ENV_REPO=$1;shift

[ -z $ENV_REPO ] && usage

rm -rf  $ENV_REPO

mkdir -p $ENV_REPO


cd $ENV_REPO

echo '/.idea/* /.gradle/* /nnn/build/*' | xargs -n1 >.gitignore


echo Now On Air
