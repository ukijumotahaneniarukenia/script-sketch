#!/usr/bin/env bash

echo 'echo "hello world"' | nim c -r --hints:off --verbosity:0 -

echo 'import tables;let a = toCountTable("caffelatte");for k, v in pairs(a):echo k,":",v' | nim c -r --hints:off --verbosity:0 -


rm -
