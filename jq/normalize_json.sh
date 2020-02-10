#!/bin/bash

normalize_json(){                                                                                                                                                                                         
  jq -c '
  def is_scalar(init_param__json):
    init_param__json as $kk
    |if type!="object" or type!="array" then true else false end
  ;

  def normalize_json(init_param__json):
    init_param__json as $kk
    |if is_scalar(.)==true then . else . end
    |to_entries
    |if length==0 then [{key:null,value:null}] else . end
    |.[]
    |{key:($kk+(.key|tostring)),value:.value}
    |.key as $prekey
    |.
    |if .value|type=="array" then .value|.[]|normalize_json($prekey+".") else . end
    |if .value|type=="object" then .value|normalize_json($prekey+".") else . end
  ;
  normalize_json("")|[.key,.value]
  ' "$@"
}

if [ -p /dev/stdin ]; then
  cat - | normalize_json "$@"
else
  normalize_json "$@"
fi
