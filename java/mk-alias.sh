#!/bin/bash

mkdir -p $HOME/script-sketch/java/out

rm -rf $HOME/script-sketch/java/out/*

ls $HOME/script-sketch/java | grep DONE | xargs -I@ echo javac -d $HOME/script-sketch/java/out -classpath \"$HOME/script-sketch/java/lib/*\" @ | sh

while read tgt;do

  printf "echo \x27alias %s=\x22java -classpath \$HOME/script-sketch/java/out:\$HOME/script-sketch/java/lib/* %s\x22\x27 >> \$HOME/.bashrc \n" $(echo $tgt | perl -pe 's;.*_;;g' | perl -pe 's;\.class;;g') $(echo $tgt | perl -pe 's;\.class;;g') | sh

done < <(ls $HOME/script-sketch/java/out)
