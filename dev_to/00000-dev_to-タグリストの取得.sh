#!/usr/bin/env bash

curl -sSL https://dev.to/tags  | sed -z 's/\n//g'  | grep -Po '(?<=<a).*?(?=/a>)' | grep tag-show-link | grep -Po '(?<=>)(.*?)(?=<)' | sed 's/^#//' | sed 's/ //g' | sed '/^$/d' | sort >tag-list
