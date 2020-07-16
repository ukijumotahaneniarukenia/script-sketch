#!/usr/bin/env bash

#便利すごいなー

cat << E | nim c -r --hints:off --verbosity:0 -
import unicode, sequtils
let s = "すもももももももものうち".toRunes
for ch in s.deduplicate:
  stdout.write(ch, s.count(ch))
E
