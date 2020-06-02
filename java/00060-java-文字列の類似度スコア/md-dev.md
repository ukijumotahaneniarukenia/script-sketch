外部ライブラリ依存の実行可能なjar

```
mkdir -p $HOME/wrksp
cp  /home/kuraine/script-sketch/java/00060-java-文字列の類似度スコア/nnn/target/nnn-1.0-SNAPSHOT-bin.tar.bz2 $HOME/wrksp


cd wrksp

$ find
.
./nnn-1.0-SNAPSHOT
./nnn-1.0-SNAPSHOT/lucene-analyzers-3.6.2.jar
./nnn-1.0-SNAPSHOT/lucene-core-8.5.1.jar
./nnn-1.0-SNAPSHOT/nnn-1.0-SNAPSHOT.jar
./nnn-1.0-SNAPSHOT/lucene-spellchecker-3.6.2.jar
./nnn-1.0-SNAPSHOT/lucene-analyzers-common-8.5.1.jar
./nnn-1.0-SNAPSHOT-bin.tar.bz2


$ tree -ugh
.
├── [kuraine  kuraine  4.0K]  nnn-1.0-SNAPSHOT
│   ├── [kuraine  kuraine  1.1M]  lucene-analyzers-3.6.2.jar
│   ├── [kuraine  kuraine  1.6M]  lucene-analyzers-common-8.5.1.jar
│   ├── [kuraine  kuraine  3.3M]  lucene-core-8.5.1.jar
│   ├── [kuraine  kuraine  102K]  lucene-spellchecker-3.6.2.jar
│   └── [kuraine  kuraine  4.5K]  nnn-1.0-SNAPSHOT.jar
└── [kuraine  kuraine  5.6M]  nnn-1.0-SNAPSHOT-bin.tar.bz2

1 directory, 6 files


```

環境など

```
$ gu --version
GraalVM Updater 20.1.0



$ native-image --version
GraalVM Version 20.1.0 (Java Version 11.0.7)

```


実行バイナリの作成

```

$ time native-image -jar nnn-1.0-SNAPSHOT/nnn-1.0-SNAPSHOT.jar testcmd | tee log
Build on Server(pid: 3922, port: 39309)*
[testcmd:3922]    classlist:   1,355.30 ms,  0.96 GB
[testcmd:3922]        (cap):     464.12 ms,  0.96 GB
[testcmd:3922]        setup:   1,246.25 ms,  0.96 GB
[testcmd:3922]     (clinit):     109.38 ms,  1.20 GB
[testcmd:3922]   (typeflow):   3,207.44 ms,  1.20 GB
[testcmd:3922]    (objects):   3,208.00 ms,  1.20 GB
[testcmd:3922]   (features):     169.51 ms,  1.20 GB
[testcmd:3922]     analysis:   6,919.34 ms,  1.20 GB
[testcmd:3922]     universe:     238.79 ms,  1.21 GB
[testcmd:3922]      (parse):     517.60 ms,  1.21 GB
[testcmd:3922]     (inline):     803.24 ms,  1.67 GB
[testcmd:3922]    (compile):   3,407.76 ms,  2.26 GB
[testcmd:3922]      compile:   5,037.40 ms,  2.26 GB
[testcmd:3922]        image:     525.46 ms,  2.26 GB
[testcmd:3922]        write:      98.09 ms,  2.26 GB
[testcmd:3922]      [total]:  15,575.11 ms,  2.26 GB

real	0m16.401s
user	0m0.254s
sys	0m0.082s



$ tree -ugh
.
├── [kuraine  kuraine   889]  log
├── [kuraine  kuraine  4.0K]  nnn-1.0-SNAPSHOT
│   ├── [kuraine  kuraine  1.1M]  lucene-analyzers-3.6.2.jar
│   ├── [kuraine  kuraine  1.6M]  lucene-analyzers-common-8.5.1.jar
│   ├── [kuraine  kuraine  3.3M]  lucene-core-8.5.1.jar
│   ├── [kuraine  kuraine  102K]  lucene-spellchecker-3.6.2.jar
│   └── [kuraine  kuraine  4.5K]  nnn-1.0-SNAPSHOT.jar
├── [kuraine  kuraine  5.6M]  nnn-1.0-SNAPSHOT-bin.tar.bz2
└── [kuraine  kuraine  6.7M]  testcmd

1 directory, 8 files



$ echo 'BitCoin　Core BitCoin　Cash' | xargs -n1 | ./testcmd
BitCoin　Core	BitCoin　Cash	75


$ echo 'BitCoin　Cash BitCoin　Cash' | xargs -n1 | ./testcmd
BitCoin　Cash	BitCoin　Cash	100


```

ポータブルか

```


$ ls
log  nnn-1.0-SNAPSHOT  nnn-1.0-SNAPSHOT-bin.tar.bz2  testcmd

$ mv testcmd $HOME/.local/bin/


$ ls
log  nnn-1.0-SNAPSHOT  nnn-1.0-SNAPSHOT-bin.tar.bz2


$ export PATH=$HOME/.local/bin:$PATH

$ echo 'BitCoin　Core BitCoin　Cash' | xargs -n1 | testcmd
BitCoin　Core	BitCoin　Cash	75


$ echo 'BitCoin　Cash BitCoin　Cash' | xargs -n1 | testcmd
BitCoin　Cash	BitCoin　Cash	100


```


ポータブル


実行バイナリ以外を削除してもポータブルか


```

$ ls
log  nnn-1.0-SNAPSHOT  nnn-1.0-SNAPSHOT-bin.tar.bz2

$ rm -rf *

$ echo 'BitCoin　Cash BitCoin　Cash' | xargs -n1 | testcmd
BitCoin　Cash	BitCoin　Cash	100

$ echo 'BitCoin　Core BitCoin　Cash' | xargs -n1 | testcmd
BitCoin　Core	BitCoin　Cash	75


$ echo 'ウンコもりもり森鴎外 うんこモリモリ森鴎外' | xargs -n1 | testcmd
ウンコもりもり森鴎外	うんこモリモリ森鴎外	30



$ echo 'ウンコもりもり森鴎外 うんこモリモリ森鴎外' | xargs -n1 | testcmd
レーベンシュタイン距離	ウンコもりもり森鴎外	うんこモリモリ森鴎外	30
ジャロ・ウィンクラー距離	ウンコもりもり森鴎外	うんこモリモリ森鴎外	53

```


外部依存ライブラリがある実行可能なjarファイルを単一実行可能なポータブルコマンドにすることができた。便利。


応用

- IN

```
$ echo うんこ ウンコ 💩 ｳﾝｺ ウンコ ｳﾝｺ ＵＮＫＯ unko UNKO ＵＮＫＯ unko ｳﾝｺ UnKo unko Unko unKO | xargs -n1
うんこ
ウンコ
💩
ｳﾝｺ
ウンコ
ｳﾝｺ
ＵＮＫＯ
unko
UNKO
ＵＮＫＯ
unko
ｳﾝｺ
UnKo
unko
Unko
unKO

```

- CMD

```
$ echo うんこ ウンコ 💩 ｳﾝｺ ウンコ ｳﾝｺ ＵＮＫＯ unko UNKO ＵＮＫＯ unko ｳﾝｺ UnKo unko Unko unKO | xargs -n1 | testcmd
```


- OUT

```
0	うんこ	ウンコ	レーベンシュタイン距離	0	ジャロ・ウィンクラー距離	0
1	💩	ｳﾝｺ	レーベンシュタイン距離	0	ジャロ・ウィンクラー距離	0
2	ウンコ	ｳﾝｺ	レーベンシュタイン距離	0	ジャロ・ウィンクラー距離	0
3	ＵＮＫＯ	unko	レーベンシュタイン距離	0	ジャロ・ウィンクラー距離	0
4	UNKO	ＵＮＫＯ	レーベンシュタイン距離	0	ジャロ・ウィンクラー距離	0
5	unko	ｳﾝｺ	レーベンシュタイン距離	0	ジャロ・ウィンクラー距離	0
6	UnKo	unko	レーベンシュタイン距離	50	ジャロ・ウィンクラー距離	66
7	Unko	unKO	レーベンシュタイン距離	25	ジャロ・ウィンクラー距離	50

```
