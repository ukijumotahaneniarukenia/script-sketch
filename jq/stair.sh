#!/bin/bash

stair(){
  jq -cr 'map(tostring)|foreach .[] as $item("";.+","+$item)' "$@" | sed 's;^,;;;s;^;[;;s;$;];'
}

if [ -p /dev/stdin ]; then
  cat - | stair "$@"
else
  stair "$@"
fi
