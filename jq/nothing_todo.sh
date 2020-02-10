#!/bin/bash 
nothing_todo(){
  jq '
    def normalize_json(init_param_json):
    init_param__json as $in
    |reduce keys[] as $item({};.+{($item):($in[$item])});
    normalize_json(.)
  ' "$@"
}

if [ -p /dev/stdin ]; then
  cat - | nothing_todo "$@"
else
  nothing_todo "$@"
fi
