#!/bin/bash

usage(){
cat <<EOS
Usage:
  $0 pom.xml pom.json pom.tsv 3
EOS
exit 0
}

IN_XML_FILE=$1;shift
OUT_JSON_FILE=$1;shift
OUT_TSV_FILE=$1;shift
DENOMINATOR=$1;shift

#空文字チェック
[ -z $IN_XML_FILE ] && usage
[ -z $OUT_JSON_FILE ] && usage
[ -z $OUT_TSV_FILE ] && usage
[ -z $DENOMINATOR ] && usage

#正負チェック
grep -q -P '^-' <<<$DENOMINATOR && exit 1
grep -q -P '^-' <<<$DENOMINATOR || :

#数値チェック
grep -q -P '^[0-9]+$' <<<$DENOMINATOR || exit 1
grep -q -P '^[0-9]+$' <<<$DENOMINATOR && :

mkdir -p $(pwd)/lib

xml2json.py -t xml2json -o $OUT_JSON_FILE $IN_XML_FILE

cat pom.json | jq -c --stream 'select(length==2)|{key:.[0],value:.[1]}' | grep -P 'text' | grep -v '\\n' | jq -r '.key[2]+1,.value' | xargs -n2 | awk -v OFS='\t' -v D=$DENOMINATOR '{if(NR%3!=0) {print NR,$1,NR%D,$2} else {print NR,$1,D,$2}}' | awk -v OFS='\t' -v FS='\t' '{if($3==1){gsub(/\./,"/",$4);print $1,$2,$3,$4}else{print $1,$2,$3,$4}}' | sed '1iseq\tgrp\tgrpseq\tval'  >$OUT_TSV_FILE

trdsql -driver postgres -dsn 'postgres://postgres:postgres_pwd@localhost:5432/testdb?sslmode=disable' -icsv -id '\t' -ih "\
  select \
    'curl -SLO https://repo1.maven.org/maven2/'
    ||string_agg(case when grpseq::integer in (1,2,3) then val else null end,'/')
    ||'/'
    ||string_agg(case when grpseq::integer in (2,3) then val else null end,'-')
    ||'.jar'
  from \
    pom.tsv \
  group by \
    grp" | \
while read tgt;do
 $tgt
 echo $tgt | perl -pe 's;.*/;;g' | xargs -I@ mv @ lib/@
done
