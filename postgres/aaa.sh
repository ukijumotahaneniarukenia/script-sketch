#!/bin/bash

#psql -q -v tgt="'$(paste <(seq 1 10) <(printf "%s\n" $(echo -e '\U1f4a'{0..9})))'" \
#  -U postgres < <(cat<<EOS
#  with sub as(
#    select regexp_split_to_table(:tgt,'\n') as map
#    ,regexp_split_to_array(:tgt,'\n') as ary
#    ,generate_subscripts(regexp_split_to_array(:tgt,'\n'),1) as ind
#  )
#  select map
#    ,ary
#    ,ind
#    ,ary[ind]as ele
#    ,regexp_split_to_array(ary[ind],'\t')as done
#  from sub;
#EOS
#);
#
#psql -q -v tgt="'$(echo -e 'U1f4a'{0..9})'" -U postgres  < <(cat<<EOS
#  with sub as(
#    select
#      ind
#      ,string_to_array(:tgt,' ') as ary
#    from generate_subscripts(string_to_array(:tgt,' '),1) ind
#  )
#  select ind,ary,ary[ind]as ele from sub;
#EOS
#);
#
#psql -q -v tgt="'$(echo -e 'U1f4a'{0..9})'" -U postgres  < <(cat<<EOS
#  with sub as(
#    select
#      ind
#      ,regexp_split_to_array(:tgt,' ') as ary
#    from generate_subscripts(string_to_array(:tgt,' '),1) ind
#  )
#  select ind,ary,ary[ind]as ele from sub;
#EOS
#);

psql -q -v tgt="'$(printf "%s\n" 'U1f4a'{0..9})'" -U postgres  < <(cat<<EOS
  with sub as(
    select
      ind
      ,regexp_split_to_array(:tgt,'\n') as ary
    from generate_subscripts(regexp_split_to_array(:tgt,'\n'),1) ind
  )
  select ind,ary,ary[ind]as ele from sub;
EOS
);
