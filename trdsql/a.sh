#!/bin/bash

DIR=$(pwd)/lib/

trdsql -driver postgres -dsn 'postgres://postgres:postgres_pwd@localhost:5432/testdb?sslmode=disable' -icsv -id '\t' -ih "\
  select \
    grp \
    ,'mvn install:install-file'
    ||' '
    ||'-Dfile="$DIR"'||replace(string_agg(case when grpseq::integer in (2,3) then val else null end,'.'),'.','-')||'.jar'
    ||' '
    ||string_agg( \
                case \
                  when grpseq::integer=1 then '-DgroupId=' \
                  when grpseq::integer=2 then '-DartifactId=' \
                  when grpseq::integer=3 then '-Dversion=' \
                  else null \
                end || val,' ') \
                || ' -Dpackaging=jar -DgeneratePom=true'
  from \
    test.tsv \
  group by \
    grp"
