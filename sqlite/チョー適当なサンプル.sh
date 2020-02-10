#!/bin/bash

sqlite3 < <(cat <<EOS
  select
    ceil(s1.value/3) as grp
    ,s1.value as seq
    ,date('now','+'||s1.value||' day') as day
--    ,char(s1.value+64) as sigc
--    ,char(s1.value+64,s1.value+96,s1.value+64)as mulc
--    ,group_concat(s1.value,',')over(partition by ceil(s1.value/3)) as aaa
--    ,group_concat(char(s1.value+64),',')over()
--    ,(select s2.value from generate_series(s1.value) s2) as non_corr
    ,(select s2.value from generate_series(s1.value+1,s1.value+10) s2 where s1.value+1=s2.value) as on_corr
    ,(select s2.value from generate_series(s1.value+2,s1.value+11) s2 where s1.value+2=s2.value) as on_corr
    ,(select s2.value from generate_series(s1.value+3,s1.value+12) s2 where s1.value+3=s2.value) as on_corr
    ,(select date('now','+'||s2.value||' day') from generate_series(s1.value+1,s1.value+10) s2 where s1.value+1=s2.value) as on_corr
    ,(select date('now','+'||s2.value||' day') from generate_series(s1.value+2,s1.value+11) s2 where s1.value+2=s2.value) as on_corr
    ,(select date('now','+'||s2.value||' day') from generate_series(s1.value+3,s1.value+12) s2 where s1.value+3=s2.value) as on_corr
  from generate_series(1,10) s1;
EOS
)
