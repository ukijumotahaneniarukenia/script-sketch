コンパイル

```
$ ( export GOPATH=$(pwd) && cd src/main && go install )
```

実行

```
$ ./bin/main
```


```
ス
よ
リ
ペ
ォ
ㄋ
シ
ゆ
ヨ
ャ
ゲ
ㄔ
ル
ズ
ㄜ
```

```
$ ./bin/main | xargs -n3
```


```
ス よ リ
ペ ォ ㄋ
シ ゆ ヨ
ャ ゲ ㄔ
ル ズ ㄜ
```
