#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
$0 28

EOS

exit
}

[ -z $@ ] && usage

N=$(printf "%05d" $@)
[ -z $N ] && usage

time java -cp "$(find $N* -type d -name "nnn")/out:$(find $HOME/.m2 -type f -name "*jar"|xargs|tr ' ' ':')" app/App

#time java -cp "$(find $N* -type d -name "nnn")/out:$(find $HOME/.m2 -type f -name "*jar"|xargs|tr ' ' ':')" app/AppTest
