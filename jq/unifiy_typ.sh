#!/bin/bash 
unifiy_typ(){
  jq '
  def unifiy_typ(k):
    . as $in
    |if type=="array" then .[]|unifiy_typ(.)
    elif type=="object" then
       reduce keys[] as $key 
         ({};//空のjsonオブジェクトを追加
             .
             +{
                ($key):($in[$key]|dig(.))
              }
         )
     else . end;
  unifiy_typ(.)
  ' "$@"
}
