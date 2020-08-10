#!/usr/bin/env bash
usage(){
cat <<EOS
Usage:

  PRE: mkdir -p $HOME/script-sketch/nim && cd $HOME/script-sketch/nim

  CMD: bash ${0##*/} init 00031-nim-テンプレートプロジェクトの作成 app

    or

  CMD: bash ${0##*/} build 00031-nim-テンプレートプロジェクトの作成 app

    or

  PRE: cd $HOME && git clone https://github.com/ukijumotahaneniarukenia/script-cmd.git

  CMD: bash ${0##*/} deploy 00031-nim-テンプレートプロジェクトの作成 app

    or

  CMD: bash ${0##*/} upload 00031-nim-テンプレートプロジェクトの作成 app

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

  echo '/bin/*' >> $PROJECT_DIR_NAME/$APP_DIR_NAME/.gitignore

  mkdir -p $PROJECT_DIR_NAME/$APP_DIR_NAME/bin

  mkdir -p $PROJECT_DIR_NAME/$APP_DIR_NAME/src

  touch $PROJECT_DIR_NAME/$APP_DIR_NAME/src/main.nim

  cat <<EOS >$PROJECT_DIR_NAME/$APP_DIR_NAME/src/main.nim
import algorithm

var a = [1,2,3,4,5]


echo a


echo a.reversed
EOS

  #アプリ単位の設定ファイル
  touch $PROJECT_DIR_NAME/$APP_DIR_NAME/src/main.nim.cfg

  cat <<EOS >$PROJECT_DIR_NAME/$APP_DIR_NAME/src/main.nim.cfg
# windows用
amd64.windows.gcc.path = "/usr/bin/"
amd64.windows.gcc.exe = "x86_64-w64-mingw32-gcc"
amd64.windows.gcc.linkerexe = "x86_64-w64-mingw32-gcc"

# linux用
amd64.linux.gcc.path = "/usr/bin/"
amd64.linux.gcc.exe = "gcc"
amd64.linux.gcc.linkerexe = "gcc"


# macosx用
#うまく出来次第追記したいなど rustのやつうまく流用できないか。Dockerはmustポイ
EOS

  mkdir -p $PROJECT_DIR_NAME/$APP_DIR_NAME/tests

  touch $PROJECT_DIR_NAME/$APP_DIR_NAME/tests/test.nim

  exit 0

}

build(){

  if [ -z $PROJECT_DIR_NAME ];then

    usage

  fi

  if [ -z $APP_DIR_NAME ];then

    usage

  fi

  cd $HOME/script-sketch/nim

  ( cd $PROJECT_DIR_NAME/$APP_DIR_NAME/src && nim c -d:release --os:windows main.nim )

  ( cd $PROJECT_DIR_NAME/$APP_DIR_NAME/src && nim c -d:release --os:linux main.nim  )

  find $PROJECT_DIR_NAME -type f | xargs file | grep -P 'shared|executable' | cut -d':' -f1 | xargs -I@ echo mv @ $PROJECT_DIR_NAME/$APP_DIR_NAME/bin/ | bash

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

  mkdir -p $HOME/script-cmd/$LANG_NAME/$NIM_VERSION/$APP_NAME

  cd $HOME/script-sketch/$LANG_NAME

  #ビルドホストはLinuxなので
  find $PROJECT_DIR_NAME -type f  | xargs file | grep -P 'shared|executable' | cut -d':' -f1 | grep -vP '(?=\.exe)' | xargs -I@ echo cp @ $HOME/script-cmd/$LANG_NAME/$NIM_VERSION/$APP_NAME/$APP_NAME-$LANG_NAME | bash

  #パス登録
  find $HOME/script-cmd -type f -name "mysearch-register-bash" -o -name "mycmd-register-bash" | bash

  which $APP_NAME-$LANG_NAME

  exit 0

}

upload(){

  #この取得結果をbintrayなどにぶち込み
  #find $PROJECT_DIR_NAME -type f | xargs file | grep -P 'shared|executable' | cut -d':' -f1
  :

  echo TODO functionay

  exit 0

}

LANG_NAME=nim
NIM_VERSION=$($LANG_NAME --version | grep Version | grep -Po '(\.?[0-9]+){3}' | tr '.' '-')

SUBCMD=$1;shift;
PROJECT_DIR_NAME=$1;shift;
APP_DIR_NAME=$1;shift;
APP_NAME=$APP_DIR_NAME;

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
