#!/bin/bash

#printf "%s\n%s\n" @ {a..c}{,{,a}{,b}{,c}} | xargs | xargs -I### bash -c 'declare -a argv=();argv=(###);echo ${#argv[@]}'


#printf "%s\n%s\n" @ {a..c}{,{,a}{,b}{,c}} | xargs | xargs -I### bash -c '
#  declare -a argv=();
#  argv=(###);
#  argc=${#argv[@]}
#  sep=${argv[@]:0:1}
#  echo $sep
#  argv=(${argv[@]:1})
#  echo ${argv[@]}
#'

#printf "%s\n%s\n" @ $(echo {a..c}{,{,a}{,b}{,c}} | tr ' ' '@' ) | xargs | xargs -I### bash -c '
#  declare -a argv=();
#  argv=(###);
#  argc=${#argv[@]}
#  sep=${argv[@]:0:1}
#  echo $sep
#  argv=(${argv[@]:1})
#  echo ${argv[@]}
#  echo "======================================================================================"
#  sqlite3 testdb \
#    "
#      with sub as (
#        select \"###\" as rsv_args
#      ),subb as(
#        select
#          instr(rsv_args,\" \")
#          ,substr(rsv_args,1,instr(rsv_args,\" \")-1) as sep
#          ,substr(rsv_args,instr(rsv_args,\" \")+1) as tgt
#          ,rsv_args
#        from sub
#      )select * from subb;
#    "
#' && rm testdb

printf "%s\n%s\n" @ $(echo {a..c}{,{,a}{,b}{,c}} | tr ' ' '@' ) | xargs | xargs -I### bash -c '
  sqlite3 testdb \
    "
      with sub as (
        select \"###\" as rsv_args
      ),subb as(
        select
          instr(rsv_args,\" \") as sep_pos
          ,substr(rsv_args,1,instr(rsv_args,\" \")-1) as sep
          ,substr(rsv_args,instr(rsv_args,\" \")+1) as tgt
          ,rsv_args
        from sub
      )select * from subb;
    "
' && rm testdb
