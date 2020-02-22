#!/bin/bash

rm -rf $HOME/script-sketch/java/out/*


ls $HOME/script-sketch/java | grep DONE | xargs -I@ javac -d $HOME/script-sketch/java/out -classpath "$HOME/script-sketch/java/lib/*" @


while read tgt;do

  printf "echo \x27alias %s=\x22java -classpath \$HOME/script-sketch/java/out:\$HOME/script-sketch/java/lib/* %s\x22\x27 \n"

done < <(ls $HOME/script-sketch/java/out/*)
