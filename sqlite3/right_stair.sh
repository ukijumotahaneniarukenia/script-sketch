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
          ,replace(rsv_args,rtrim(rsv_args,replace(rsv_args,\",\",\"\")),\"\")
          ,rtrim(rtrim(rsv_args,replace(rsv_args,\",\",\"\")),\",\")
          ,replace(rsv_args,rtrim(rsv_args,replace(rsv_args,\",\",\"\")),\"\")
          ,replace(rsv_args,rtrim(rsv_args,replace(rsv_args,\",\",\"\")),\"\")||\",\"||rtrim(rtrim(rsv_args,replace(rsv_args,\",\",\"\")),\",\")
        from sub
        union all
        select
          rn+1
          ,rsv_args
          ,ele_cnt
          ,replace(rest_args,rtrim(rest_args,replace(rest_args,\",\",\"\")),\"\")
          ,rtrim(rtrim(rest_args,replace(rest_args,\",\",\"\")),\",\")
          ,replace(rest_args,rtrim(rest_args,replace(rest_args,\",\",\"\")),\"\")||\",\"||done_args
          ,replace(rest_args,rtrim(rest_args,replace(rest_args,\",\",\"\")),\"\")||\",\"||done_args||
            case when rtrim(rtrim(rest_args,replace(rest_args,\",\",\"\")),\",\")=\"\" then \"\" else \",\" end ||rtrim(rtrim(rest_args,replace(rest_args,\",\",\"\")),\",\")
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
