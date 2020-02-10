#!/bin/bash

#https://www.odin.hyork.net/write/write0668.html
#--SELECT * FROM pg_available_extensions;
#--create or replace function aaa(rsv_args integer)
#--returns integer as \$$
#--  select rsv_args+10;
#--
#--\$$ language sql;
#--
#--select aaa(1);
psql -v tgt1=2 -v tgt2=3 -v tgt3="'echo'"  -U postgres -d testdb < <(cat<<EOS

--select 1 union all
--select :tgt1 union all
--select :tgt2;


select :tgt3||' '||'unko';


EOS
)
