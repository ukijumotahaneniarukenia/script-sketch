#!/bin/bash

proc(){
  TGT_TBL="$@";
  mysql -uroot -pMysql3306 -Dtestdb -s -e "select '"${TGT_TBL}"',s1.* from "${TGT_TBL}" s1;" 2>/dev/null | tail -n+1 | while read TBL TGT;do
    PATH_EXP=$(echo "${TGT}" | gron | sed 's;json;\$;g;s; \=;\=;g;s;=.*;;g;')
    echo "${PATH_EXP}" | awk -v TBL=${TBL} '{print "select tgt,json_extract(tgt,\x27"$1"\x27) as ele,\x27"$1 "\x27 as path_exp from "TBL" union all"}'
  done | sed '$ s;union all;\;;'
}

main(){
  proc "$(cat -)" 
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
