#!/bin/bash

echo {a..z} | tr ' ' ',' | awk -vFS=, '{for(i=1;i<=NF;i++)print gensub(/[^,]/,"X",i,$0) }'
