#!/bin/bash

MOD=$1

[ -z $MOD ] && exit 1

seq 10 | awk -v MOD=$MOD '
function ceil(valor,m)
{
   return (valor/m == int(valor/m)) ? valor/m : int(valor/m)+1
}
BEGIN{
  SEP="\t"
}
{
   key=ceil($1,MOD)
}
{
  GRP[key]=GRP[key]""SEP""$1
}
END{
  for(grp in GRP){
    print grp,GRP[grp]
  }
}
'
