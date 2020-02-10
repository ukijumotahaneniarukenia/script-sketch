#!/bin/bash

#https://www.scutum.jp/information/waf_tech_blog/2016/02/waf-blog-045.html
#https://postgresql.g.hatena.ne.jp/pgsql/20101022

perm(){
  local n=$1;shift;
  local items="$@";shift;
# 文字列版
psql -t -q -v n="${n}" -v tgt="'$(echo -ne "${items}")'" \
  -U postgres < <(cat<<EOS
  with recursive sub as(
    select s1.ele from unnest(string_to_array(:tgt,' ')) as s1(ele)
  ),rec(grp,ele,rt) as(
    select 1,ele,ele from sub
    union all
    select s1.grp+1,s2.ele,s1.rt ||','||s2.ele from rec s1,sub s2 
    --自身より大きな要素をひも付け
    --自身より大きな要素をひも付けた値をselect句で返却
    where s1.ele < s2.ele
  )select rt from rec where grp=:n;
EOS
) | sed -r 's;^ {1,};;' | sed '$d'
}

# 配列列版
#( psql -t -q -v n="${n}" -v tgt="'$(echo -ne "${items}")'" \
#  -U postgres < <(cat<<EOS
#  with recursive sub as(
#    select s1.ele from unnest(string_to_array(:tgt,' ')) as s1(ele)
#  ),rec(grp,ele,rt) as(
#    select 1,ele,array[ele]::text[] from sub
#    union all
#    select s1.grp+1,s2.ele,s1.rt || array[s2.ele]::text[] from rec s1,sub s2
#    --自身より大きな要素をひも付け
#    --自身より大きな要素をひも付けた値をselect句で返却
#    where s1.ele < s2.ele
#  )select rt from rec where grp=:n;
#EOS
#)) | sed -r 's;^ {1,};;' | sed '$d'

main(){
  local init_args="$(cat -)";
  perm ${init_args}
}

[ -p /dev/stdin ] && cat - | main
[ -p /dev/stdin ] || echo -ne "$@" | main
