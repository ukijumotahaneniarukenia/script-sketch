#!/bin/bash 
unify_type(){
  jq '
    def normalize_json(init_param__json):
    init_param__json as $in
    |if type=="array" then .[]|normalize_json(.)
    elif type=="object" then reduce keys[] as $item ({};.+{($item):($in[$item])})
    else . end;
    normalize_json(.)
  ' "$@"
}
if [ -p /dev/stdin ]; then
  cat - | unify_type "$@"
else
  unify_type "$@"
fi
