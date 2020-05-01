#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
$0 28 10

EOS

exit
}

N=$(printf "%05d" $1);shift
CMD_ARGS="$@"

[ -z "$N" ] && usage

#time java -cp "/usr/local/src/mecab-java-0.996/MeCab.jar:$(find $N* -type d -name "nnn")/out" app/App $CMD_ARGS
time java -cp "/usr/local/src/mecab-java-0.996/MeCab.jar:$(find $N* -type d -name "nnn")/out:$(find $HOME/.m2 -type f -name "*jar"|xargs|tr ' ' ':')" app/App $CMD_ARGS

#time java -cp "$(find $N* -type d -name "nnn")/out:$(find $HOME/.m2 -type f -name "*jar"|xargs|tr ' ' ':'):/usr/local/src/mecab-java-0.996/Mecab.jar" app/AppTest
