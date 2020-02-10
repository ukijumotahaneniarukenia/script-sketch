#!/bin/bash

#recursive句のあるサブクエリ
#printf "%s\n" {a..c} | xargs | tr ' ' ',' | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#  with recursive
#    sub(rsv_args) as (select \"@\" as rsv_args)
#  select s1.rsv_args as s1_rsv_args,s2.rsv_args as s2_rsv_args from sub s1,sub s2;  
#  "
#' && rm testdb

#inlineサブクエリ
#printf "%s\n" {a..c} | xargs | tr ' ' ',' | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#    select s1.* from (select \"@\" as rsv_args) s1;  
#  "
#' && rm testdb

#recursive句のあるサブクエリ
#printf "%s\n" {a..c} | xargs | tr ' ' ',' | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#  with recursive
#    sub(rsv_args) as (select \"@\" as rsv_args)
#  select * from sub;  
#  "
#' && rm testdb
#
#
#recursive句のないサブクエリ
#printf "%s\n" {a..c} | xargs | tr ' ' ',' | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#  with
#    sub(rsv_args) as (select \"@\" as rsv_args)
#  select * from sub;  
#  "
#' && rm testdb
#
#recursive句のない再帰クエリ
#再帰結果を参照しない
#printf "%s\n" {a..c} | xargs | tr ' ' ',' | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#  with
#    sub(rsv_args) as (select \"@\" as rsv_args)
#    ,rec(rn,rsv_args)as(
#      select 1,rsv_args from sub
#      union all
#      select rn+1,rsv_args from rec
#      where rn<3
#    )select * from sub;  
#  "
#' && rm testdb
#
#recursive句のない再帰クエリ
#再帰結果を参照する
#printf "%s\n" {a..c} | xargs | tr ' ' ',' | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#  with
#    sub(rsv_args) as (select \"@\" as rsv_args)
#    ,rec(rn,rsv_args)as(
#      select 1,rsv_args from sub
#      union all
#      select rn+1,rsv_args from rec
#      where rn<3
#    )select * from rec;  
#  "
#' && rm testdb
#
#recursive句のある再帰クエリ
#再帰結果を参照する
#printf "%s\n" {a..c} | xargs | tr ' ' ',' | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#  with recursive
#    sub(rsv_args) as (select \"@\" as rsv_args)
#    ,rec(rn,rsv_args)as(
#      select 1,rsv_args from sub
#      union all
#      select rn+1,rsv_args from rec
#      where rn<3
#    )select * from rec;  
#  "
#' && rm testdb

#recursive句のない再帰クエリ
#再帰した結果を再帰処理して参照する
#printf "%s\n" {a..c} | xargs | tr ' ' ',' | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#  with
#    sub(rsv_args) as (select \"@\" as rsv_args)
#    ,rec(rn,rsv_args)as(
#      select 1,rsv_args from sub
#      union all
#      select rn+1,rsv_args from rec
#      where rn<3
#    ),recc(rn,rsv_args,ele,rest_args)as(
#      select rn,rsv_args,substr(rsv_args,1,instr(rsv_args,\",\")-1),substr(rsv_args,instr(rsv_args,\",\")+1) from rec
#      where rn=1
#      union all
#      select rn+1,rsv_args,substr(rest_args,1,instr(rsv_args,\",\")-1),substr(rest_args,instr(rsv_args,\",\")+1) from recc
#      where rn<3
#    )select * from recc;  
#  "
#' && rm testdb
#
#recursive句のある再帰クエリ
#再帰した結果を再帰処理して参照する
#printf "%s\n" {a..c} | xargs | tr ' ' ',' | xargs -I@ bash -c 'sqlite3 testdb \
#  "
#  with recursive
#    sub(rsv_args) as (select \"@\" as rsv_args)
#    ,rec(rn,rsv_args)as(
#      select 1,rsv_args from sub
#      union all
#      select rn+1,rsv_args from rec
#      where rn<3
#    ),recc(rn,rsv_args,ele,rest_args)as(
#      select rn,rsv_args,substr(rsv_args,1,instr(rsv_args,\",\")-1),substr(rsv_args,instr(rsv_args,\",\")+1) from rec
#      where rn=1
#      union all
#      select rn+1,rsv_args,substr(rest_args,1,instr(rsv_args,\",\")-1),substr(rest_args,instr(rsv_args,\",\")+1) from recc
#      where rn<3
#    )select * from recc;  
#  "
#' && rm testdb

#recursive句のある再帰クエリ
#再帰した結果を再帰処理して参照する
printf "%s\n" {a..c} | xargs | tr ' ' ',' | xargs -I@ bash -c 'sqlite3 testdb \
  "
  with recursive
    sub(rsv_args) as (select \"@\" as rsv_args)
    ,rec(rn,rsv_args)as(
      select 1,rsv_args from sub
      union all
      select rn+1,rsv_args from rec
      where rn<3
    ),recc(rn,rsv_args,ele,rest_args)as(
      select rn,rsv_args,substr(rsv_args,1,instr(rsv_args,\",\")-1),substr(rsv_args,instr(rsv_args,\",\")+1) from rec
      where rn=1
      union all
      select rn+1,rsv_args,substr(rest_args,1,instr(rsv_args,\",\")-1),substr(rest_args,instr(rsv_args,\",\")+1) from recc
      where rn<3
    )select * from recc;  
  "
' && rm testdb
