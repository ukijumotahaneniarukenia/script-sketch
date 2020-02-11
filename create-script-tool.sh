#!/bin/bash
while read tgt;do
  LFT=$(echo $tgt)
  RGT="/usr/local/bin/"$(echo $tgt | perl -pe 's;\..*$;;g;' | perl -pe 's;.*-;;g')"-myself"
  printf "ln -fsr %s %s\n" $LFT $RGT
done < <(find ~/script-sketch -name "*" | grep -vP '\.git/' | grep -P 'DONE' ) | sort #>>~/.bashrc
