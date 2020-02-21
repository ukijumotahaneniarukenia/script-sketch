#!/bin/bash
trdsql -driver postgres -dsn 'postgres://postgres:postgres_pwd@localhost:5432/testdb?sslmode=disable' -icsv -id '\t' -ih "\
  select \
    'curl -SLO https://repo1.maven.org/maven2/'
    ||replace(string_agg(case when grpseq::integer in (1,2,3) then val else null end,'/'),'.','/')
    ||'/'
    ||string_agg(case when grpseq::integer in (2,3) then val else null end,'-')
    ||'.jar'
  from \
    test.tsv \
  group by \
    grp" | perl -pe 's;([0-9]+)/([0-9]+)/([0-9]+);\1\.\2\.\3;g' | \
while read tgt;do
  $tgt
  echo $tgt | perl -pe 's;.*/;;g' | xargs -I@ mv @ lib/@
done
