#!/bin/bash

psql -q -v deno=3 -v tgt="'$(paste <(seq 1 10) <(printf "%s\n" $(echo {a..j})) <(printf "%s\n" $(echo {1..10})) <(seq 10 | xargs -I@ date --date "@ day" "+%Y-%m-%d"))'" \
  -U postgres < <(cat<<EOS
  with sub as(
    select
      regexp_split_to_array(s0.ary[s0.ind],'\t')as done
      ,s0.*
    from(
      select regexp_split_to_table(:tgt,'\n') as map
      ,regexp_split_to_array(:tgt,'\n') as ary
      ,generate_subscripts(regexp_split_to_array(:tgt,'\n'),1) as ind
    )s0
  ),subb as(
    select
      ceil(s0.ind/(:deno+1)) as grp
      ,ceil(s0.ind/:deno) as subgrp
      ,row_number()over(partition by ceil(s0.ind/(:deno+1)),ceil(s0.ind/:deno) order by s0.ind) as grpseq
      ,s0.done[2] as str
      ,s0.done[3]::integer as qty
      ,s0.done[4]::date as day
      ,s0.ind as seq
    from sub s0
  )select
    grp
    ,subgrp
    ,grpseq
    ,str
    ,qty
    ,day
    ,string_agg(str,',')over(order by seq range between current row and unbounded following ) as ptn1_lft
    ,string_agg(str,',')over(order by seq range between unbounded preceding and current row exclude current row) as ptn1_rgt
    ,string_agg(str,',')over(order by seq range between current row and unbounded following ) 
     ||case when seq=1 then '' else ',' end ||case when seq=1 then '' else string_agg(str,',')over(order by seq range between unbounded preceding and current row exclude current row) end as ptn1
    ,reverse(string_agg(str,',')over(order by seq range between unbounded preceding and current row exclude current row)) as ptn2_lft
    ,string_agg(str,',')over(order by seq desc range between unbounded preceding and current row ) as ptn2_rgt
    ,case when seq=1 then '' else reverse(string_agg(str,',')over(order by seq range between unbounded preceding and current row exclude current row)) end
    ||case when seq=1 then '' else ',' end || string_agg(str,',')over(order by seq desc range between unbounded preceding and current row ) as ptn2













    --,string_agg(str,',')over(order by grp ,subgrp groups between unbounded preceding and current row ) as groups
    --,string_agg(str,',')over(order by grp ,subgrp rows between unbounded preceding and current row ) as rows
    --,string_agg(str,',')over(partition by grp order by seq)
    --,string_agg(str,',')over(partition by grp,subgrp order by seq)
    --,sum(qty)over(order by seq)
    --,sum(qty)over(order by seq )
    --,sum(qty)over(partition by grp order by seq)
    --,sum(qty)over(partition by grp,subgrp order by seq)
    --,string_agg(str,',')over(order by day range between unbounded preceding and '1 day' following)
    --,string_agg(str,',')over(order by day range between '1 day' preceding and unbounded following)
    --,string_agg(str,',')over(partition by grp order by day range between unbounded preceding and '1 day' following)
    --,string_agg(str,',')over(partition by grp order by day range between '1 day' preceding and unbounded following)
    --,sum(qty)over(partition by grp order by day range between '1 day' preceding and unbounded following)
  from subb;
EOS
);
