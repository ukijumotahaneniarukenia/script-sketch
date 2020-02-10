#!/bin/bash

#printf "%s\n%s\n" @ $(echo {a..b}{,{,a}{,b}} | tr ' ' '@' ) | xargs | xargs -I### bash -c '
#  sqlite3 testdb \
#    "
#      with sub as (
#        select \"###\" as rsv_args
#      ),subb as(
#        select
#          instr(rsv_args,\" \") as sep_pos
#          ,substr(rsv_args,1,instr(rsv_args,\" \")-1) as sep
#          ,substr(rsv_args,instr(rsv_args,\" \")+1) as tgt
#          ,rsv_args
#        from sub
#      )select * from subb;
#    "
#' && rm testdb


#printf "%s\n%s\n" @ $(echo {a..b}{,{,a}{,b}} | tr ' ' '@' ) | xargs | xargs -I### bash -c '
printf "%s\n%s\n" , $(echo {a..b}{,{,a}{,b}} | tr ' ' ',' ) | xargs | xargs -I### bash -c '
  sqlite3 testdb \
  "
  with recursive
    sub(rsv_args) as (select \"###\")
    ,subb(sep,rsv_args) as (select substr(rsv_args,1,instr(rsv_args,\" \")-1), substr(rsv_args,instr(rsv_args,\" \")+1) from sub)
    ,rec(
      rn
      
      ,sep

      ,rsv_args
      ,rsv_args_len
      ,rsv_args_non_sep_len
      ,ele_cnt

      ,ele
      ,sep_pos

      ,rest_args
      ,rest_args_len
      ,rest_args_non_sep_len
    ) as (
      select
        -1
        
        ,sep

        ,rsv_args
        ,length(rsv_args)
        ,length(replace(rsv_args,sep,\"\"))
        ,length(rsv_args)-length(replace(rsv_args,sep,\"\"))+1
        
        ,null
        ,0

        ,rsv_args
        ,length(rsv_args)
        ,length(replace(rsv_args,sep,\"\"))
      from subb
      union all
      select
        rn+1

        ,sep

        ,rsv_args
        ,length(rsv_args)
        ,length(replace(rsv_args,sep,\"\"))
        ,rsv_args_len-rsv_args_non_sep_len+1

        ,case when rest_args_len-rest_args_non_sep_len=1 then rest_args else substr(rest_args,1,instr(rest_args,sep)-1) end
        ,instr(rest_args,sep)

        ,case when rest_args_len-rest_args_non_sep_len=1 then \"\" else substr(rest_args,instr(rest_args,sep)+1) end
        ,length(rest_args)
        ,length(replace(rest_args,sep,\"\"))
      from rec
      where rn<length(rsv_args)-length(replace(rsv_args,sep,\"\")) 
  )select * from rec;
  "
' && rm testdb
