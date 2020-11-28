#!/usr/bin/env bash

timedatectl list-timezones | xargs -I@ bash -c 'echo @;(f=%Y-%m-%dT%H:%M:%S;export TZ=@;a=$(echo | ts $f);export TZ=UTC;b=$(echo | ts $f);echo "($(date -d$a +%s)-$(date -d$b +%s))/3600"|bc)|tr -d -' | xargs -n2 | tr ' ' '\t'
