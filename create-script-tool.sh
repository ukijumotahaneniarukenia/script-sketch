#!/bin/bash
while read tgt;do
  echo "alias XXX="$tgt
done < <(find ~/script-sketch -name "*" | grep -vP '.git') #>>~/.bashrc
