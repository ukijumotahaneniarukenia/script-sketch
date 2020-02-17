#!/bin/bash

#sqlite3 < <(cat <<EOS
#  select
#    s1.value as seq
#    ,date(date('now','+'||(s1.value-1)||' day'),'-4 day') as day_bef_4
#    ,date(date('now','+'||(s1.value-1)||' day'),'-3 day') as day_bef_3
#    ,date(date('now','+'||(s1.value-1)||' day'),'-2 day') as day_bef_2
#    ,date(date('now','+'||(s1.value-1)||' day'),'-1 day') as day_bef_1
#    ,date('now','+'||(s1.value-1)||' day') as day_base_0
#    ,date(date('now','+'||(s1.value-1)||' day'),'+1 day') as day_aft_1
#    ,date(date('now','+'||(s1.value-1)||' day'),'+2 day') as day_aft_2
#    ,date(date('now','+'||(s1.value-1)||' day'),'+3 day') as day_aft_3
#    ,date(date('now','+'||(s1.value-1)||' day'),'+4 day') as day_aft_4
#  from generate_series(1,10) s1;
#EOS
#)
#
#sqlite3 < <(cat <<EOS
#  select
#    s1.value as seq
#    ,date('now',(s1.value-5)||' day') as day_bef_4
#    ,date('now',(s1.value-4)||' day') as day_bef_3
#    ,date('now',(s1.value-3)||' day') as day_bef_2
#    ,date('now',(s1.value-2)||' day') as day_bef_1
#    ,date('now',(s1.value-1)||' day') as day_base_0
#    ,date('now','+'||(s1.value)  ||' day') as day_aft_1 
#    ,date('now','+'||(s1.value+1)||' day') as day_aft_2
#    ,date('now','+'||(s1.value+2)||' day') as day_aft_3
#    ,date('now','+'||(s1.value+3)||' day') as day_aft_4
#  from generate_series(1,10) s1;
#EOS
#)
#
#https://blog.sgnet.co.jp/2017/08/sqlite-sqlite-2.html
sqlite3 < <(cat <<EOS
  select
    date('now',(-s1.value)||' day') as start_pos
    ,date('now') as base_pos
    ,date('now',(+s1.value)||' day') as end_pos
    ,julianday(date('now',(-s1.value)||' day')) as start_pos_jly
    ,julianday('now') as base_pos_jly
    ,julianday(date('now',(+s1.value)||' day')) as end_pos_jly
    ,ceil(round(julianday(date('now',(+s1.value)||' day'))-julianday('now'))) as diff_to_end
    ,ceil(round(julianday('now')-julianday(date('now',(+s1.value)||' day')))) as diff_to_start
  from
    generate_series(1,"$@") s1
      inner join generate_series(s1.value-1,s1.value+"$@") s2 on s1.value-1=s2.value
      inner join generate_series(s1.value+1,s1.value+"$@") s3 on s1.value+1=s3.value
  ;
EOS
)
