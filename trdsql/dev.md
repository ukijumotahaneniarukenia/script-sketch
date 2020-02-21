# tsvファイルの読込

- https://noborus.github.io/blog/02_convert/

- IN
```
$cat test.tsv
seq	grp	grpseq	val
1	1	1	com.github.javafaker
2	1	2	javafaker
3	1	3	1.0.2
4	2	1	org.json
5	2	2	json
6	2	3	20190722
```

- CMD
```
$trdsql -icsv -id "\t" -ih "select grp,grpseq,seq,val from test.tsv"
```


- OUT
```
1,1,1,com.github.javafaker
1,2,2,javafaker
1,3,3,1.0.2
2,1,4,org.json
2,2,5,json
2,3,6,20190722
```

# postgresドライバ経由で読込

- http://everything-you-do-is-practice.blogspot.com/2017/10/csv-tsv-sql-trdsql.html

- IN
```
$cat test.csv
seq,grp,grpseq,val
1,1,1,com.github.javafaker
2,1,2,javafaker
3,1,3,1.0.2
4,2,1,org.json
5,2,2,json
6,2,3,20190722
```

- CMD
```
trdsql -driver postgres -dsn "postgres://postgres:postgres_pwd@localhost:5432/testdb?sslmode=disable" -ih "select * from test.csv"
```


- OUT
```
1,1,1,com.github.javafaker
2,1,2,javafaker
3,1,3,1.0.2
4,2,1,org.json
5,2,2,json
6,2,3,20190722
```

# sql文を標準入力から読込

- IN
```
$cat test.tsv
seq	grp	grpseq	val
1	1	1	com.github.javafaker
2	1	2	javafaker
3	1	3	1.0.2
4	2	1	org.json
5	2	2	json
6	2	3	20190722
```

- CMD
```
echo '
  select \
    grp \
    ,grpseq \
    ,seq \
    ,val \
  from \
    test.tsv \
' | xargs -I{} trdsql -driver postgres -dsn 'postgres://postgres:postgres_pwd@localhost:5432/testdb?sslmode=disable' -icsv -id '\t' -ih '{}'
```

- OUT

```
1,1,1,com.github.javafaker
1,2,2,javafaker
1,3,3,1.0.2
2,1,4,org.json
2,2,5,json
2,3,6,20190722
```

# SQL文にシングルクヲートを含ませる

- IN
```
$cat test.tsv
seq	grp	grpseq	val
1	1	1	com.github.javafaker
2	1	2	javafaker
3	1	3	1.0.2
4	2	1	org.json
5	2	2	json
6	2	3	20190722
```

- CMD

```
trdsql -driver postgres -dsn 'postgres://postgres:postgres_pwd@localhost:5432/testdb?sslmode=disable' -icsv -id '\t' -ih "select grp,string_agg(val,',') from test.tsv group by grp"
```

- OUT

```
2,"org.json,json,20190722"
1,"com.github.javafaker,javafaker,1.0.2"
```

# awkによるグループわけ

```
$cat a.out
com.github.javafaker
javafaker
1.0.2
org.json
json
20190722
$cat a.out | nl | awk -v OFS=',' 'function ceil(n,d){return (n/d==int(n/d))?n/d:int(n/d)+1} {print $1,ceil($1,3),$2}' | sed '1iseq,grp,val'
seq,grp,val
1,1,com.github.javafaker
2,1,javafaker
3,1,1.0.2
4,2,org.json
5,2,json
6,2,20190722
$cat a.out | nl | awk -v OFS=',' 'function ceil(n,d){return (n/d==int(n/d))?n/d:int(n/d)+1} {print $1,ceil($1,3),$2}' | sed '1iseq,grp,val'>a.out.done
```


```
$trdsql -ih "select grp,group_concat(val,',')over(partition by grp) from a.out.done" | uniq
1,"com.github.javafaker,javafaker,1.0.2"
2,"org.json,json,20190722"
```


```
$trdsql -ih "select case when grp=1 then '-DgroupId=' when grp=2 then '-DartifactId=' when grp=3 then '-Dversion=' end||val from a.out.done" | uniq | xargs -n3
-DgroupId=com.github.javafaker -DartifactId=javafaker -Dversion=1.0.2
-DgroupId=org.json -DartifactId=json -Dversion=20190722
```


```
cat a.out | nl | awk -v OFS=',' 'function ceil(n,d){return (n/d==int(n/d))?n/d:int(n/d)+1} {if($1%3==0){print $1,ceil($1,3),3,$2}else{print $1,ceil($1,3),$1%3,$2}}' | sed '1iseq,grp,grpseq,val'
```

```
seq,grp,grpseq,val
1,1,1,com.github.javafaker
2,1,2,javafaker
3,1,3,1.0.2
4,2,1,org.json
5,2,2,json
6,2,3,20190722
```
この形を目指して、grepで対象絞りやすくするようにする。
mvn install:install-file -Dfile=target/foo.jar -DgroupId=com.foo -DartifactId=foo \
-Dversion=1.0 -Dpackaging=jar -DgeneratePom=true

jqと、コラボ
