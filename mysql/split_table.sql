drop function if exists split_table;
create function split_table(init_args longtext)
returns json deterministic
return(
  with recursive args as(
    select case when 0=instr(init_args,',') then concat(init_args,',') else init_args end as rsv_args
  ),rec (grp,rsv_args,pos,ele)as(
    select 1,rsv_args,locate(',',rsv_args,1),substr(rsv_args,1,locate(',',rsv_args,1)-1) from args
    union all
    select grp+1,rsv_args,case when 0=locate(',',rsv_args,pos+1) then length(rsv_args) else locate(',',rsv_args,pos+1) end
    ,substr(rsv_args,pos+1,case when 0=locate(',',rsv_args,pos+1) then length(rsv_args)+1 else locate(',',rsv_args,pos+1) end-(pos+1))
    from rec
    where grp+1<=case when 0=instr(init_args,',') then 1 else length(rsv_args)-length(replace(rsv_args,',',''))+1 end
  )select
     json_arrayagg(s1.jele)
  from(
     select s1.*,json_objectagg("key",s1.ele)over(order by s1.pos) as jele from rec s1
  )s1
);
