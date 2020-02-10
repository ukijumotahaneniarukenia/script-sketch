#!/bin/bash

#https://qiita.com/SRsawaguchi/items/411801e254ee66f511f1
#https://www.postgresql.jp/document/9.3/html/functions-array.html
#https://qiita.com/choplin/items/9d5e2ff8721fb9509bf8
#https://qiita.com/A-Kira/items/dde43e0e0aa7cec51938
#https://qiita.com/rhi222/items/6f4156f1e729d31c16a1
psql -v tgt="'$(echo -e '\U1f4a'{0..9})'" -U postgres -d testdb < <(cat<<EOS
  drop function if exists pg_fetch(rsv_args text[],n bigint);
  create or replace function pg_fetch(rsv_args text[],n bigint)
  returns text as \$$
    select case when 0<(select count(*) from unnest(rsv_args)) then array_to_string(rsv_args[n:n],'') else null end;
  \$$ language sql;
  
  drop function if exists pg_shift(rsv_args text[]);
  create or replace function pg_shift(rsv_args text[])
  returns text as \$$
    select
      case
        when 0<(select count(*) from unnest(rsv_args)) then (
          with sub as(
            select
              row_number()over(order by ele) as rn
              ,first_value(ele)over(order by ele asc) as ele
            from unnest(rsv_args) ele
          )select ele from sub where rn=1) else null end;
  \$$ language sql;
  drop function if exists pg_pop(rsv_args text[]);
  create or replace function pg_pop(rsv_args text[])
  returns text as \$$
    select
      case
        when 0<(select count(*) from unnest(rsv_args)) then (
          with sub as(
            select
              row_number()over(order by ele) as rn
              ,first_value(ele)over(order by ele desc) as ele
            from unnest(rsv_args) ele
          )select ele from sub where rn=1) else null end;
  \$$ language sql;
  
  drop function if exists pg_unshift(tgt_ele text,rsv_args text[]);
  create or replace function pg_unshift(tgt_ele text,rsv_args text[])
  returns text[] as \$$
    select array_prepend(tgt_ele,rsv_args);
  \$$ language sql;
  
  drop function if exists pg_push(tgt_ele text,rsv_args text[]);
  create or replace function pg_push(tgt_ele text,rsv_args text[])
  returns text[] as \$$
    select array_cat(rsv_args,array[tgt_ele]);
    --select array_append(rsv_args,tgt_ele);
  \$$ language sql;
  
  drop function if exists pg_del_ele(tgt_ele text,rsv_args text[]);
  create or replace function pg_del_ele(tgt_ele text,rsv_args text[])
  returns text[] as \$$
    select
      case
        when trim(tgt_ele) is not null
          and exists(select 1 from unnest(rsv_args) ele where ele=tgt_ele) then (select array_agg(ele) from unnest(rsv_args) ele where ele <> tgt_ele )
        else rsv_args
      end;
  \$$ language sql;
  
  drop function if exists pg_ele_cnt(rsv_args text[]);
  create or replace function pg_ele_cnt(rsv_args text[])
  returns integer as \$$
    select array_length(rsv_args,1);
  \$$ language sql;
  drop function if exists pg_rev(rsv_args text[]);
  create or replace function pg_rev(rsv_args text[])
  returns text[] as \$$
    with sub as(
      select ele from unnest(rsv_args) ele order by ele desc
    )select array_agg(ele) from sub;
  \$$ language sql;
  with recursive sub as(
    select string_to_array(:tgt,' ') as liz
  ),rec(seq
      ,lft,lft_cum,lft_cat
      ,rgt
      ,rgt_cum
      ,tmp
      ,tmp_rest
  )as(
    select
      1
      ,liz,array[''],array_cat(liz,array[''])
      ,pg_rev(liz)
      ,array['']
      ,pg_fetch(pg_rev(liz),1)
      ,array_remove(pg_rev(liz),pg_fetch(pg_rev(liz),1))
    from sub
    union all
    select
      seq+1
      ,pg_del_ele(pg_shift(lft),lft),pg_push(pg_shift(lft),lft_cum),array_cat(pg_del_ele(pg_shift(lft),lft),pg_push(pg_shift(lft),lft_cum))
      ,pg_del_ele(pg_pop(rgt),rgt)
      ,pg_unshift(pg_pop(rgt),rgt_cum)
      ,pg_fetch(pg_rev(liz),seq+1)
      ,array_remove(pg_rev(liz),pg_fetch(pg_rev(liz),seq+1))
    from rec,sub where seq+1<=pg_ele_cnt(string_to_array(:tgt,' '))
  )
  select
    --lft_cat,rgt_cat
    *
  from rec
  ;
EOS
);
 #--      ,liz,array[''],array_cat(array[''],liz)
      #--,array[''],array_cat(array[''],pg_rev(liz))
#    ,pg_rev(rgt)),pg_unshift(pg_pop(rgt),rgt_cum),array_cat(pg_unshift(pg_pop(rgt),rgt_cum),pg_del_ele(pg_pop(rgt),rgt))
