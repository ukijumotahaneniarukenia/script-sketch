#!/usr/bin/env bash

find -type f | grep -P '[0-9]{5}' | awk -F/ '{pre=$3;gsub(".*\.","",$3);print "git mv " $1,$2,pre" " $1,$2,"main."$3}' OFS=/ | bash
