set @rsv_args='[3, 4]';

with recursive rec(rn,tgt,len,ele,typ,rest,cum,expr)as(
  select 1,@rsv_args,json_length(@rsv_args)
        ,json_extract(@rsv_args,concat('$[',0,']'))
        ,json_type(json_extract(@rsv_args,concat('$[',0,']')))
        ,json_remove(@rsv_args,concat('$[',0,']'))
        ,json_arrayagg(json_extract(@rsv_args,concat('$[',0,']')))
        ,concat('$[',0,']')
  union all
  select rn+1,tgt,len
        ,json_extract(@rsv_args,concat('$[',rn,']'))
        ,json_type(json_extract(@rsv_args,concat('$[',rn,']')))
        ,json_remove(@rsv_args,concat('$[',rn,']'))
        ,json_array_insert(cum,concat('$[',rn+1,']'),json_extract(@rsv_args,concat('$[',rn,']')))
        ,concat('$[',rn,']')
  from rec
  where rn+1<=json_depth(@rsv_args)
)select rn,tgt,typ,expr,ele from rec;
