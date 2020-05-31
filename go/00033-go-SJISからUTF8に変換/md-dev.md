事前準備

```

go get golang.org/x/text/encoding/japanese


```


sjisコードで保存
- https://qiita.com/bezeklik/items/2c9925f9c07762559471

```


$ vi sjis.txt
$ nkf -g sjis.txt
Shift_JIS



```


変換

```

$ ( export GOPATH=$(pwd) && cd src/main && go install )
$ ./bin/main
2020/05/31 22:28:06 done


$ ls
bin  md-dev.md  pkg  sjis.txt  src  utf8.txt

$ nkf -g utf8.txt
UTF-8

$ diff -y sjis.txt utf8.txt
������							      |	うんこ
������							      |	うんこ
������							      |	うんこ
������							      |	うんこ
������							      |	うんこ
������							      |	うんこ
������							      |	うんこ
������							      |	うんこ
������							      |	うんこ
������							      |	うんこ
������							      |	うんこ

```


goはデフォでutf8
