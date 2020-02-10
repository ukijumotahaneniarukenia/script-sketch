#!/bin/bash

#残管理
#sqlite>>>select replace('a,aa,aaa', ',', ''),rtrim('a,aa,aaa', replace('a,aa,aaa', ',', '')),replace('a,aa,aaa', rtrim('a,aa,aaa', replace('a,aa,aaa', ',', '')), '');
#replace('a,aa,aaa', ',', '')  rtrim('a,aa,aaa', replace('a,aa,aaa', ',', ''))  replace('a,aa,aaa', rtrim('a,aa,aaa', replace('a,aa,aaa', ',', '')), '')
#----------------------------  -----------------------------------------------  ------------------------------------------------------------------------
#aaaaaa                        a,aa,                                            aaa                                                                     

printf "%s\n" "a aa aaa aaaa" | xargs | tr ' ' ',' | xargs -I@ bash -c 'sqlite3 testdb \
  "
  with sub as(
    select \"@\" as liz,length(\"@\")-length(replace(\"@\",\",\",\"\"))+1 as cnt
      ),rec(rn,liz,rest_liz,ele,cnt)as(
      select 1,liz,rtrim(rtrim(liz,replace(liz,\",\",\"\")),\",\"),replace(liz,rtrim(liz,replace(liz,\",\",\"\")),\"\"),cnt
      from sub
      union all
      select rn+1,liz,rtrim(rtrim(rest_liz,replace(rest_liz,\",\",\"\")),\",\"),replace(rest_liz,rtrim(rest_liz,replace(rest_liz,\",\",\"\")),\"\"),cnt
      from rec
      where rn<cnt
  )select * from rec;
  "
' && rm testdb
