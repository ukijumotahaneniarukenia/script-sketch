#!/usr/bin/env bash

cp $HOME/script-sketch/nim/*nim $HOME/script-sketch/nim/out

cd $HOME/script-sketch/nim/out

nim c *nim

rm -rf *nim
