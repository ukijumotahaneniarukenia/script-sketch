#!/bin/bash

#https://codeday.me/jp/qa/20190427/714230.html

n=$1;shift;
items="$@"

# 文字列版
( psql -t -q -v n="${n}" -v tgt="'$(echo -ne "${items}")'" \
  -U postgres < <(cat<<EOS
  with recursive sub as(
    select s1.ele from unnest(string_to_array(:tgt,' ')) as s1(ele)
  ),rec(grp,rt) as(
    select 1,ele from sub
    union all
    select s1.grp+1,s1.rt ||','||s2.ele from rec s1,sub s2
    --対象要素がすべて蓄積要素に含まれるまで結合
    where position(s2.ele in s1.rt)=0
  )select rt from rec where grp=:n;
EOS
)) | sed -r 's;^ {1,};;' | sed '$d'

# 配列列版
( psql -t -q -v n="${n}" -v tgt="'$(echo -ne "${items}")'" \
  -U postgres < <(cat<<EOS
  with recursive sub as(
    select s1.ele from unnest(string_to_array(:tgt,' ')) as s1(ele)
  ),rec(grp,rt) as(
    select 1,array[ele]::text[] from sub
    union all
    select s1.grp+1,s1.rt || array[s2.ele]::text[] from rec s1,sub s2 
    --対象要素がすべて蓄積要素に含まれるまで結合
    where array_position(s1.rt,s2.ele) is null
  )select rt from rec where grp=:n;
EOS
)) | sed -r 's;^ {1,};;' | sed '$d'
