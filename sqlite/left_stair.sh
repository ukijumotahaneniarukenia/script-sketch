#!/bin/bash

usage(){
  cat <<EOF
Usage:
\$$0 '\U1f4a'{0..9}
\$echo -e '\U1f4a'{0..9} | $0
EOF
}

chk_args(){
  declare -a argv=()
  local argv=($@)
  local argc="${#argv[@]}"
  [ "${argc}" -le 1 ] && usage && exit 1
}

circle(){
  echo -e "$@" | tr ' ' ',' | xargs -I@ bash -c 'sqlite3 testdb \
  "
  with
    sub(rsv_args,ele_cnt) as (select \"@\" as rsv_args,length(\"@\")-length(replace(\"@\",\",\",\"\"))+1 as ele_cnt)
    ,rec(rn,rsv_args,ele_cnt,ele,rest_args,done_args,rotate_args)as(
      select
        1
        ,rsv_args
        ,ele_cnt
        ,substr(rsv_args,1,instr(rsv_args,\",\")-1)
        ,substr(rsv_args,instr(rsv_args,\",\")+1)
        ,substr(rsv_args,1,instr(rsv_args,\",\")-1)
        ,rsv_args
      from sub
      union all
      select
        rn+1
        ,rsv_args
        ,ele_cnt
        ,case when substr(rest_args,1,instr(rest_args,\",\")-1)=\"\" then rest_args else substr(rest_args,1,instr(rest_args,\",\")-1) end
        ,case when substr(rest_args,1,instr(rest_args,\",\")-1)=\"\" then \"\" else substr(rest_args,instr(rest_args,\",\")+1) end
        ,done_args||\",\"||case when substr(rest_args,1,instr(rest_args,\",\")-1)=\"\" then rest_args else substr(rest_args,1,instr(rest_args,\",\")-1) end
        ,rest_args||\",\"||done_args
      from rec
      where rn<ele_cnt
    )select rotate_args from rec;
  "
' && rm testdb
}

main(){
  local init_args="$(cat -)";
  chk_args "${init_args}"
  while read ln;do circle "${ln}";done <<<"${init_args}"
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
