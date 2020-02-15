#!/bin/bash

TTT=100
NNN=3

echo $TTT | xargs -I@ bash -c "yes @ | head -n$NNN" | nl | \
while read rn tgt;do
  #echo $rn $tgt
  rm -rf $HOME/script-sketch/groonga/test-$rn.json
  echo "echo $tgt | ./00002-JSONテストデータ作成-make-test-data-non-dynamic-DONE-mktdnd.js| jq '.[\"items\"]|tojson'>>$HOME/script-sketch/groonga/test-$rn.json"
done
