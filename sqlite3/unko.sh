#!/bin/bash

#ok
#echo {0..10} | xargs -t -I@ bash -c 'sqlite3 testdb \
#  "select \"@\";"
#' && rm testdb
##ok
#echo {0..10} | xargs -t -I@ bash -c 'sqlite3 testdb \
#  "
#    select \"@\" as seq ;
#  "
#' && rm testdb
#
##ok
#seq 99 100 | tac | xargs | xargs -t -I@ bash -c 'sqlite3 testdb \
#  "
#  select \"@\" as liz ,instr(\"@\",\" \"),substr(\"@\",1,instr(\"@\",\" \")) as dct ;
#  "
#' && rm testdb

##ok
#seq 99 100 | tac | xargs | xargs -t -I@ bash -c 'sqlite3 testdb \
#  "
#  select \"@\" as liz ,instr(\"@\",\" \"),substr(\"@\",1,instr(\"@\",\" \")) as dct ;
#  "
#' && rm testdb

##ok
#echo {0..10} | xargs -t -I@ bash -c 'sqlite3 testdb \
#  "
#  with recursive rec(rn,liz) as (
#    select 0,\"@\"
#    union all
#    select rn+1,liz from rec where rn<=9
#  )select * from rec;
#  "
#' && rm testdb
#
##ok
#echo {0..10} | xargs -t -I@ bash -c 'sqlite3 testdb \
#  "
#  with recursive rec(rn,liz) as (
#    select -1,\"@\"
#    union all
#    select rn+1,liz from rec where rn<=9
#  )select * from rec;
#  "
#' && rm testdb
##微妙
#seq 0 30 | tac | xargs | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#  with recursive rec(rn,liz,last_ele) as (
#    select -1,\"@\",null
#    union all
#    select rn+1,liz,substr(liz,1,instr(liz,\" \")) from rec where rn<=substr(liz,1,instr(liz,\" \"))-1 
#  )select * from rec;
#  "
#' && rm testdb

##ok
#printf "%s\n" {a..z} | tac | xargs | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#  with sub as(
#    select \"@\" as tgt
#  )
#  select tgt,replace(tgt,\" \",\"\") as tgt_done,length(tgt) as tgt_len,length(replace(tgt,\" \",\"\")) as tgt_done_len,length(tgt)-length(replace(tgt,\" \",\"\"))+1 as ele_cnt from sub;
#  "
#' && rm testdb
#

##ok
#printf "%s\n" {a..c}{,{,a}{,b}{,c}} | tac | xargs | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#  with sub as(
#    select \"@\" as tgt
#  )
#  select tgt,replace(tgt,\" \",\"\") as tgt_done,length(tgt) as tgt_len,length(replace(tgt,\" \",\"\")) as tgt_done_len,length(tgt)-length(replace(tgt,\" \",\"\"))+1 as ele_cnt from sub;
#  "
#' && rm testdb

##ok
#printf "%s\n" {a..c}{,{,a}{,b}{,c}} | tac | xargs | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#  with recursive
#    sub(tgt) as (select \"@\")
#    ,rec(rn,liz,last_ele) as (
#      select -1,tgt,null from sub
#      union all
#      select rn+1,liz,substr(liz,1,instr(liz,\" \")) from rec where rn<=length(liz)-length(replace(liz,\" \",\"\")) 
#  )select * from rec;
#  "
#' && rm testdb

printf "%s\n" {a..b}{,{,a}} | tac | xargs | xargs -I@ bash -c 'sqlite3 testdb \
  "
  with recursive
    sub(rsv_args) as (select \"@\")
    ,rec(
      rn
      
      ,rsv_args
      ,rsv_args_len
      ,rsv_args_non_sep_len

      ,last_ele
      ,ele
      ,sep_pos

      ,rest_args
      ,rest_args_len
      ,rest_args_non_sep_len
    ) as (
      select
        -1

        ,rsv_args
        ,length(rsv_args)
        ,length(replace(rsv_args,\" \",\"\"))
        
        ,null
        ,null
        ,0

        ,rsv_args
        ,length(rsv_args)
        ,length(replace(rsv_args,\" \",\"\"))
      from sub
      union all
      select
        rn+1

        ,rsv_args
        ,length(rsv_args)
        ,length(replace(rsv_args,\" \",\"\"))

        ,substr(rsv_args,1,instr(rsv_args,\" \"))
        ,case when rest_args_len-rest_args_non_sep_len=1 then rest_args else substr(rest_args,1,instr(rest_args,\" \")-1) end
        ,instr(rest_args,\" \")

        ,case when rest_args_len-rest_args_non_sep_len=1 then \"\" else substr(rest_args,instr(rest_args,\" \")+1) end
        ,length(rest_args)
        ,length(replace(rest_args,\" \",\"\"))
      from rec
      where rn<length(rsv_args)-length(replace(rsv_args,\" \",\"\")) 
  )select * from rec;
  "
' && rm testdb

#ok
#echo {0..10} | xargs -t -I@ bash -c 'sqlite3 testdb \
#  "
#  with recursive rec(rn,liz,dct_sep_pos,pre,rest) as (
#    select -1,\"@\",null,null,null
#    union all
#    select rn+1,liz,instr(liz,\" \"),substr(liz,1,instr(liz,\" \")),substr(liz,instr(liz,\" \")) from rec where rn<=9
#  )select * from rec;
#  "
#' && rm testdb

#ok
#echo {0..10} | xargs -I@ bash -c 'sqlite3 testdb ".read b.sql" ' && rm testdb

#ok
#sqlite3 testdb ".read b.sql"
