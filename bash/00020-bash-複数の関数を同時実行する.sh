#!/bin/bash

#複数の関数を同寺起動する例

function aaa(){
  echo うんこ
  sleep 1
}

function bbb(){
  echo もりもり
  sleep 1
}

function ccc(){
  echo 森鴎外
  sleep 1
}

export -f aaa bbb ccc

echo aaa bbb ccc | xargs -n1 | xargs -t -I@ -P1 bash -c 'eval @'

echo aaa bbb ccc | xargs -n1 | xargs -t -I@ -P3 bash -c 'eval @'
