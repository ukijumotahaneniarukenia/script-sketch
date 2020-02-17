#!/bin/bash

printf "%s\n" {a..b}{,{,a}} | xargs | xargs -I@ bash -c 'sqlite3 testdb \
  "
  with recursive
    sub(rsv_args) as (select \"@\")
    ,rec(
      rn
      
      ,rsv_args
      ,rsv_args_len
      ,rsv_args_non_sep_len
      ,ele_cnt

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
        ,length(rsv_args)-length(replace(rsv_args,\" \",\"\"))+1
        
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
        ,rsv_args_len-rsv_args_non_sep_len+1

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
