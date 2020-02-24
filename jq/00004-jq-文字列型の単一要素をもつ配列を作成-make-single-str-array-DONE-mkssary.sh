#!/usr/bin/env bash

for i in {1..30};do echo {{0..9},{a..z},{A..Z}} | tr ' ' \\n |shuf -rn$(seq 5 10|shuf -rn1)|tr -d \\n;echo;done| xargs -I@ jq -n -c '"@"|split(" ")'
