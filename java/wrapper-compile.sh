#!/usr/bin/env bash

N=$(printf "%05d" $@)

usage(){
cat <<EOS
Usage:
$0 28

EOS

exit
}

[ -z $N ] && usage

javac -Xlint:unchecked -Xlint:deprecation -d $(find $N* -type d -name "nnn")/out -cp "/usr/local/src/mecab-java-0.996/MeCab.jar:$(find $N* -type d -name "nnn")/out:$(find $HOME/.m2 -type f -name "*jar"|xargs|tr ' ' ':')" $(find $N* -name "*.java");
#javac -Xlint:unchecked -Xlint:deprecation -d $(find $N* -type d -name "nnn")/out -cp "$(find $N* -type d -name "nnn")/out:$(find $HOME/.m2 -type f -name "*jar"|xargs|tr ' ' ':')" $(find $N* -name "AppTest.java");
