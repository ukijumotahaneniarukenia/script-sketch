#!/bin/bash


for i in {0..29};do bash -c "echo {{a..z},{A..Z},{0..9}}"|tr ' ' \\n|shuf -rn$(seq 10 30 | shuf -rn1) |tr -d \\n;echo;done |nl
