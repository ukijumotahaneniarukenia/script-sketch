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


if [ -d $ENV_REPO ] ;then
  :
else
  mkdir -p $ENV_REPO/{bin,pkg,src{,/main}}
fi




cd $ENV_REPO



echo '/bin/* /pkg/* /src/github.com/* /src/golang.org/* /main' | xargs -n1 >.gitignore


touch src/main/main.go

cat <<EOS >src/main/main.go
package main

import (
	"fmt"
)

func main() {
	fmt.Println("Now On Air")
}
EOS


#このシェルスクリプト内でのみ有効な変数
export GOPATH=$(pwd)

cd src/main


go install


$GOPATH/bin/main
