実際はファイルとテーブルの項目マッピング定義が必要になり。

ファイル名とテーブル名は揃える

データダンプディレクトリが決められており。

全てrootユーザーで作業する

CSVファイル

単一ファイルインポート

mysql -uroot -pMysql3306 -Dtestdb -e 'drop table test_tbl;create table test_tbl(col1 text,col2 text,col3 text);'

echo "cat /dev/urandom | base64 -w0 | fold -w 10 | paste -d',' $(seq 3 | xargs -I@ echo - | xargs) | head -n10" | sh | perl -pe 's/\x22|\x27//g'|sed '1i"col1","col2","col3"'>/var/lib/mysql-files/test_tbl.csv

テーブルにデータあれば削除し、ヘッダ行をスキップしてインポート

mysqlimport -uroot -pMysql3306 --delete --fields-terminated-by=',' --fields-optionally-enclosed-by='"' --ignore-lines=1 testdb /var/lib/mysql-files/test_tbl.csv


複数ファイルインポート

rm -rf /var/lib/mysql-files/*

echo "cat /dev/urandom | base64 -w0 | fold -w 10 | paste -d',' $(seq 3 | xargs -I@ echo - | xargs) | head -n1000000" | sh | perl -pe 's/\x22|\x27//g'|sed '1i"col1","col2","col3"'>/var/lib/mysql-files/test.csv

cat /var/lib/mysql-files/test.csv | split -l 100000 --numeric-suffixes=1 --suffix-length=3 --additional-suffix=.csv - /var/lib/mysql-files/test_"$(date "+%Y_%m_%d")"_

ls -lh /var/lib/mysql-files/*csv

ls /var/lib/mysql-files/*csv | grep -v 001 | xargs -I@ sed -i '1i"col1","col2","col3"' @

grep -n -P '"col1","col2","col3"' /var/lib/mysql-files/*csv

ls /var/lib/mysql-files/*csv | while read tgt;do echo $tgt $(echo $tgt | perl -pe 's/-|\./_/g');done | sh

rm -rf import-cmd.sh ddl.sql && ( cd /var/lib/mysql-files && find . -name "*csv" ) | perl -pe 's;\./;;g' | \
  while read tgt;do
    ( echo "drop table "$(echo $tgt | perl -pe 's;\..*;;g')" ;create table "$(echo $tgt | perl -pe 's;\..*;;g')" (col1 text,col2 text,col3 text);"; ) >>ddl.sql
    ( echo "mysqlimport -uroot -pMysql3306 --delete --fields-terminated-by=',' --fields-optionally-enclosed-by='\"' --ignore-lines=1 testdb " /var/lib/mysql-files/$tgt )>>import-cmd.sh
  done

mysql -uroot -pMysql3306 -Dtestdb -e 'source ddl.sql'

chmod 700 ./import-cmd.sh

./import-cmd.sh


tsvファイル

単一ファイルインポート

mysql -uroot -pMysql3306 -Dtestdb -e 'drop table test_tbl;create table test_tbl(col1 text,col2 text,col3 text);'
echo "cat /dev/urandom | base64 -w0 | fold -w 10 | paste $(seq 3 | xargs -I@ echo - | xargs) | head -n10" | sh | perl -pe 's/\x22|\x27//g'|sed '1i"col1"	"col2"	"col3"'>/var/lib/mysql-files/test_tbl.tsv
mysqlimport -uroot -pMysql3306 --delete --ignore-lines=1 testdb /var/lib/mysql-files/test_tbl.tsv

複数ファイルインポート

rm -rf /var/lib/mysql-files/*
echo "cat /dev/urandom | base64 -w0 | fold -w 10 | paste $(seq 3 | xargs -I@ echo - | xargs) | head -n1000000" | sh | perl -pe 's/\x22|\x27//g'|sed '1i"col1"	"col2"	"col3"'>/var/lib/mysql-files/test.tsv
cat /var/lib/mysql-files/test.tsv | split -l 100000 --numeric-suffixes=1 --suffix-length=3 --additional-suffix=.tsv - /var/lib/mysql-files/test_"$(date "+%Y_%m_%d")"_

ls /var/lib/mysql-files/*tsv | grep -v 001 | xargs -I@ sed -i '1i"col1"	"col2"	"col3"' @


rm -rf import-cmd.sh ddl.sql && ( cd /var/lib/mysql-files && find . -name "*tsv" ) | perl -pe 's;\./;;g' | \
  while read tgt;do
    ( echo "create table "$(echo $tgt | perl -pe 's;\..*;;g')" (col1 text,col2 text,col3 text);"; ) >>ddl.sql
    ( echo "mysqlimport -uroot -pMysql3306 --delete --ignore-lines=1 testdb " /var/lib/mysql-files/$tgt )>>import-cmd.sh
  done


確認

with sub as(
SELECT row_number()over(order by TABLE_NAME) as rn
,concat('select ',"'",TABLE_NAME,"'",' as tbl,count(*) as cnt from ',table_name) as build_sql FROM INFORMATION_SCHEMA.TABLES t WHERE TABLE_NAME like 'test%'
)select concat(s1.build_sql,case when exists(select 1 from sub s2 where s1.rn<s2.rn) then ' union all' else ';' end )as build_sql from sub s1
;




ダンプ

mysqldump -uroot -pMysql3306 testdb | gzip >testdb_$(date "+%Y_%m_%d").dump.gz



リストア

zcat testdb_2020_02_18.dump.gz | mysql -uroot -pMysql3306 -Dtestdb

