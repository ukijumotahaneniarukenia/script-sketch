リリース用の作業ディレクトリを作成

```
$ ls
nnn-1.0-SNAPSHOT-bin.tar.bz2

$ tar xvf nnn-1.0-SNAPSHOT-bin.tar.bz2
nnn-1.0-SNAPSHOT/json-20190722.jar
nnn-1.0-SNAPSHOT/nnn-1.0-SNAPSHOT.jar

$ ls
nnn-1.0-SNAPSHOT  nnn-1.0-SNAPSHOT-bin.tar.bz2

$ find
.
./nnn-1.0-SNAPSHOT
./nnn-1.0-SNAPSHOT/nnn-1.0-SNAPSHOT.jar
./nnn-1.0-SNAPSHOT/json-20190722.jar
./nnn-1.0-SNAPSHOT-bin.tar.bz2

$ tree -ugh
.
├── [kuraine  kuraine  4.0K]  nnn-1.0-SNAPSHOT
│   ├── [kuraine  kuraine   63K]  json-20190722.jar
│   └── [kuraine  kuraine  4.9K]  nnn-1.0-SNAPSHOT.jar
└── [kuraine  kuraine   65K]  nnn-1.0-SNAPSHOT-bin.tar.bz2

1 directory, 3 files



実行バイナリ作成

$ native-image --no-fallback -jar nnn-1.0-SNAPSHOT/nnn-1.0-SNAPSHOT.jar testcmd



$ tree -ugh
.
├── [kuraine  kuraine  4.0K]  nnn-1.0-SNAPSHOT
│   ├── [kuraine  kuraine   63K]  json-20190722.jar
│   └── [kuraine  kuraine  4.9K]  nnn-1.0-SNAPSHOT.jar
├── [kuraine  kuraine   65K]  nnn-1.0-SNAPSHOT-bin.tar.bz2
└── [kuraine  kuraine  8.3M]  testcmd

1 directory, 4 files

実行
$ echo script-dat/test.xml | ./testcmd

$ ls -lh
total 8.4M
drwxr-xr-x. 2 kuraine kuraine 4.0K  6月  7 01:18 nnn-1.0-SNAPSHOT
-rw-r--r--. 1 kuraine kuraine  66K  6月  7 01:18 nnn-1.0-SNAPSHOT-bin.tar.bz2
drwxr-xr-x. 3 kuraine kuraine 4.0K  6月  7 01:29 script-dat
-rwxr-xr-x. 1 kuraine kuraine 8.3M  6月  7 01:24 testcmd

$ tree -ugh
.
├── [kuraine  kuraine  4.0K]  nnn-1.0-SNAPSHOT
│   ├── [kuraine  kuraine   63K]  json-20190722.jar
│   └── [kuraine  kuraine  4.9K]  nnn-1.0-SNAPSHOT.jar
├── [kuraine  kuraine   65K]  nnn-1.0-SNAPSHOT-bin.tar.bz2
├── [kuraine  kuraine  4.0K]  script-dat
│   ├── [kuraine  kuraine    65]  README.md
│   ├── [kuraine  kuraine  4.4K]  test-big.xml
│   ├── [kuraine  kuraine  3.4K]  test-on-header-100.csv
│   ├── [kuraine  kuraine   126]  test.json
│   └── [kuraine  kuraine   264]  test.xml
└── [kuraine  kuraine  8.3M]  testcmd

2 directories, 9 files

