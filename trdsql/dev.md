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
