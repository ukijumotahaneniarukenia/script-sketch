#!/bin/bash

while read tgt;do


  printf "ln -fsr %s %s\n" $tgt $HOME/.local/bin/$(echo $tgt | perl -pe 's;.*DONE_(.*)\.class;\1;g')


done < <(ls $HOME/script-sketch/java/out/* | xargs -n1 )
