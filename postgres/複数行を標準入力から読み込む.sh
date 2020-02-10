#!/bin/bash

#改行区切りの単一行になる
#psql -v tgt="'$(seq 10)'" -U postgres -d testdb < <(cat<<EOS
#
#select :tgt;
#
#EOS
#)

#スペース区切りの単一行になる
#psql -v tgt="'$(echo {1..10})'" -U postgres -d testdb < <(cat<<EOS
#
#select :tgt;
#
#EOS
#)

#スペース区切りの単一行になる
#psql -v tgt="'$(echo -e '\U1f4a'{0..9})'" -U postgres -d testdb < <(cat<<EOS
#
#select :tgt;
#
#EOS
#)

#スペース区切りの単一要素配列になる
#psql -v tgt="'$(echo -e '\U1f4a'{0..9})'" -U postgres -d testdb < <(cat<<EOS
#
#select array[:tgt];
#
#EOS
#);

#スペース区切りの単一行になる
#psql -v tgt="'$(echo -e '\U1f4a'{0..9})'" -U postgres -d testdb < <(cat<<EOS
#
#select * from unnest(array[:tgt]);
#
#EOS
#)

#http://kaerouka.hatenablog.com/entry/2013/12/13/043627
#スペース区切りを展開して複数行になる
#psql -v tgt="'$(echo -e '\U1f4a'{0..9})'" -U postgres -d testdb < <(cat<<EOS
#
#select regexp_split_to_table(:tgt,' ');
#
#EOS
#)

#psql -v tgt="'$(echo -e '\U1f4a'{0..9})'" -U postgres -d testdb < <(cat<<EOS
#
#with sub as(select regexp_split_to_table(:tgt,' ') as emo)select array_agg(emo),array_length(array_agg(emo),1) from sub;
#
#EOS
#)

#psql -v tgt="'$(echo -e '\U1f4a'{0..9})'" -U postgres -d testdb < <(cat<<EOS
#
#with sub as(select string_to_array(:tgt,' ') as ary,array_length(string_to_array(:tgt,' '),1)) select * from sub,unnest(ary);
#
#EOS
#);

#psql -v tgt="'$(echo -e '\U1f4a'{0..9})'" -U postgres -d testdb < <(cat<<EOS
#
#  with sub as(
#    select
#      string_to_array(:tgt,' ') as ary
#      ,array_length(string_to_array(:tgt,' '),1) as len
#  )
#  select
#    s1.ary
#    ,s1.len
#    ,ele
#  from sub s1
#    ,unnest(ary) ele
#  ;
#
#EOS
#);

#psql -v tgt="'$(echo -e '\U1f4a'{0..9})'" -U postgres -d testdb < <(cat<<EOS
#  with sub as(
#    select
#      string_to_array(:tgt,' ') as ary
#      ,array_length(string_to_array(:tgt,' '),1) as len
#  )
#  select
#    s1.ary
#    ,s1.len
#    ,ele
#    ,s1.ary[1:1]
#    ,row_number()over(order by ele)
#    ,s1.ary[1:row_number()over(order by ele)]
#  from sub s1
#    ,unnest(ary) ele
#  ;
#
#EOS
#);

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
    select array_append(rsv_args,tgt_ele);
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

  with sub as(
    select
      string_to_array(:tgt,' ') as ary
      ,array_length(string_to_array(:tgt,' '),1) as len
  )
  select
    s1.ary
    ,s1.len
    ,ele
    ,first_value(ele)over(order by ele desc) as eleeeee
    ,row_number()over(order by ele)
    ,pg_shift(s1.ary)
--    ,pg_del_ele(pg_shift(s1.ary),s1.ary)
--    ,pg_unshift(pg_pop(s1.ary),s1.ary)
    ,pg_push(pg_pop(s1.ary),s1.ary)
    ,pg_typeof(pg_shift(s1.ary))
--    ,array_remove(s1.ary,pshift(s1.ary,row_number()over(order by ele)))
  from sub s1
    ,unnest(ary) ele
  ;

EOS
);
