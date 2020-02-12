#!/bin/bash

while read tgt;do
  DIR="$HOME/.local/bin/"$(echo $tgt | perl -pe 's;/[0-9]{5}.*;;g' | perl -pe 's;.*/;;')""
  LFT=$(echo $tgt)
  RGT="$HOME/.local/bin/"$(echo $tgt | perl -pe 's;/[0-9]{5}.*;;g' | perl -pe 's;.*/;;')"/"$(echo $tgt | perl -pe 's;\..*$;;g;' | perl -pe 's;.*-;;g')""
  printf "mkdir -p %s\n" $DIR
  printf "ln -fsr %s %s\n" $LFT $RGT
  printf "export PATH=%s:\$PATH\n" $DIR >>$HOME/.bashrc
done < <(find $HOME/script-sketch -name "*" | grep -vP '\.git/' | grep -P 'DONE' ) | sh

source $HOME/.bashrc
