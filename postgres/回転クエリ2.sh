#!/bin/bash

#psql -q -v deno=3 -v tgt="'$(paste <(seq 1 10) <(printf "%s\n" $(echo -e '\U1f4a'{0..9})))'" \
psql -q -v deno=8 -v tgt="'$(paste <(seq 1 16) <(printf "%s\n" $(echo {0..9} {a..f})))'" \
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
      ,row_number()over(partition by ceil(s0.ind/(:deno+1)) order by s0.ind) as seq
      ,s0.done[2] as str
    from sub s0
  ),subbb as(
    select
      grp
      ,seq
      ,str
      ,string_agg(str,',')over(partition by grp order by seq range between current row and unbounded following ) as ptn1_lft
      ,string_agg(str,',')over(partition by grp order by seq range between unbounded preceding and current row exclude current row) as ptn1_rgt
      ,string_agg(str,',')over(partition by grp order by seq range between current row and unbounded following ) 
       ||case when seq=1 then '' else ',' end
       ||case when seq=1 then '' else string_agg(str,',')over(partition by grp order by seq range between unbounded preceding and current row exclude current row) end as ptn1
      ,reverse(string_agg(str,',')over(partition by grp order by seq range between unbounded preceding and current row exclude current row)) as ptn2_lft
      ,string_agg(str,',')over(partition by grp order by seq desc range between unbounded preceding and current row ) as ptn2_rgt
      ,case when seq=1 then '' else reverse(string_agg(str,',')over(partition by grp order by seq range between unbounded preceding and current row exclude current row)) end
      ||case when seq=1 then '' else ',' end
      || string_agg(str,',')over(partition by grp order by seq desc range between unbounded preceding and current row ) as ptn2
    from subb
  ),subbbb as(
              select 1 as grp,seq as seq,ptn1,ptn2  ,ptn1||','||ptn2 as pic from subbb
    union all select 2 as grp,-seq as seq ,ptn1,ptn2,ptn1||','||ptn2 as pic from subbb
  )select pic from subbbb order by grp,seq
  ;
EOS
);
