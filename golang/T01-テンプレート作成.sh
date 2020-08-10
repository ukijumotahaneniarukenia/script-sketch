#!/usr/bin/env bash
usage(){
cat <<EOS
Usage:
  PRE: mkdir -p $HOME/script-sketch/golang && cd $HOME/script-sketch/golang
  CMD: bash ${0##*/} init 00099-golang-テンプレートプロジェクトの作成 app
    or
  CMD: bash ${0##*/} build 00099-golang-テンプレートプロジェクトの作成 app
    or
  PRE: cd $HOME && git clone https://github.com/ukijumotahaneniarukenia/script-cmd.git
  CMD: bash ${0##*/} deploy 00099-golang-テンプレートプロジェクトの作成 app
    or
  CMD: bash ${0##*/} upload 00099-golang-テンプレートプロジェクトの作成 app
EOS

exit 0

}

init(){
  if [ -z $PROJECT_DIR_NAME ];then

    usage

  fi

  if [ -z $APP_DIR_NAME ];then

    usage

  fi

  if [ -d $PROJECT_DIR_NAME ];then

    rm -rf $PROJECT_DIR_NAME

  fi

  mkdir -p $PROJECT_DIR_NAME

  mkdir -p $PROJECT_DIR_NAME/$APP_DIR_NAME

  echo '/bin/* /pkg/* /src/github.com/* /src/golang.org/* /main' | xargs -n1 >$PROJECT_DIR_NAME/$APP_DIR_NAME/.gitignore

  mkdir -p $PROJECT_DIR_NAME/$APP_DIR_NAME/bin

  mkdir -p $PROJECT_DIR_NAME/$APP_DIR_NAME/pkg

  mkdir -p $PROJECT_DIR_NAME/$APP_DIR_NAME/test

  mkdir -p $PROJECT_DIR_NAME/$APP_DIR_NAME/src/main

  touch $PROJECT_DIR_NAME/$APP_DIR_NAME/src/main/main.go

  cat <<EOS >$PROJECT_DIR_NAME/$APP_DIR_NAME/src/main/main.go
package main

import ( "fmt"
)

func main() {
	fmt.Println("Now On Air")
}
EOS

  exit 0
}


build(){

  export GOPATH=$HOME/.local/go-repo

  go get github.com/mitchellh/gox

  if [ -z $PROJECT_DIR_NAME ];then

    usage

  fi

  if [ -z $APP_DIR_NAME ];then

    usage

  fi

  cd $HOME/script-sketch/$LANG_NAME

  rm -rf $HOME/script-sketch/$LANG_NAME/$PROJECT_DIR_NAME/$APP_DIR_NAME/$INSTALL_DIR_NAME/*

  ( cd $PROJECT_DIR_NAME/$APP_DIR_NAME && export GOPATH=$(pwd) && cd src/main && gox )

  find $PROJECT_DIR_NAME -type f | xargs file | grep executable | cut -d':' -f1 | ruby -F/ -anle 'a=$F[$F.size-1].gsub(/_/,"-");p $_,a'|xargs -n2 | awk -v PROJECT_DIR_NAME=$PROJECT_DIR_NAME -v APP_DIR_NAME=$APP_DIR_NAME -v INSTALL_DIR_NAME=$INSTALL_DIR_NAME '{print "mv "$1" "PROJECT_DIR_NAME,APP_DIR_NAME,INSTALL_DIR_NAME,$2}' OFS=/ | bash

  exit 0
}

deploy(){

  if [ -z $PROJECT_DIR_NAME ];then

    usage

  fi

  if [ -z $APP_DIR_NAME ];then

    usage

  fi

  if [ ! -d $HOME/script-cmd ];then

    usage

  fi

  mkdir -p $HOME/script-cmd/$LANG_NAME/$LANG_VERSION/$APP_NAME

  cd $HOME/script-sketch/$LANG_NAME

  #いいかんじにしたい
  find $PROJECT_DIR_NAME -type f | grep bin | grep $(dpkg --print-architecture) | grep $(uname -s | tr '[:upper:]' '[:lower:]') | xargs -I@ echo cp @ $HOME/script-cmd/$LANG_NAME/$LANG_VERSION/$APP_NAME/$APP_NAME-$LANG_NAME | bash

  #パス登録
  find $PROJECT_DIR_NAME -type f | grep bin | grep $(dpkg --print-architecture) | grep $(uname -s | tr '[:upper:]' '[:lower:]') | xargs -I@ echo cp @ $HOME/.local/script-cmd/bin/$APP_NAME-$LANG_NAME | bash

  which $APP_NAME-$LANG_NAME

  exit 0
}

upload(){

  if [ -z $PROJECT_DIR_NAME ];then

    usage

  fi

  #この取得結果をbintrayなどにぶち込み
  #https://bintray.com/
  find $PROJECT_DIR_NAME -type f | xargs file | grep executable | cut -d: -f1 | ruby -F/ -anle 'puts $F[0..$F.size-2].join("/")+"/"+$F[$F.size-1].gsub(/main/,ENV["APP_NAME"])'

  echo TODO functionay

  exit 0
}

LANG_NAME=golang
LANG_VERSION=$(go version | grep -i Version | grep -Po '(\.?[0-9]+){3}' | tr '.' '-')

SUBCMD=$1;shift;
PROJECT_DIR_NAME=$1;shift;
APP_DIR_NAME=$1;shift;
INSTALL_DIR_NAME=bin
APP_NAME=$APP_DIR_NAME

case $SUBCMD in

  *)
     if [[ $SUBCMD =~ "init"  ]];then
       init
     fi

     if [[ $SUBCMD =~ "build"  ]];then
       build
     fi

     if [[ $SUBCMD =~ "deploy"  ]];then
       deploy
     fi

     if [[ $SUBCMD =~ "upload"  ]];then
       upload
     fi

     usage

esac

exit 0
