#!/usr/bin/env bash

file="$1"

[ -z "$file" ] && exit 1

xmllint --pretty 1 $file
