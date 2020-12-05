プロジェクト作成

```
$ ./T01-テンプレート作成.sh init 00030-golang-自作パッケージ外部レポインクルード app


$ tree
.
├── bin
├── pkg
└── src
    └── main
        └── main.go

4 directories, 1 file
```

自作ライブラリインストール

```
$ cd 00030-golang-自作パッケージ外部レポインクルード/app

$ rm -rf bin/* pkg/* src/github.com

$ export GOPATH=$(pwd)

vscodeのエラーは消えない
$ time go get github.com/ukijumotahaneniarukenia/script-go-server/script

vscodeのエラーは消える（補完もでる）
$ time go get -u github.com/ukijumotahaneniarukenia/script-go-server/script


$ tree
.
├── bin
├── pkg
│   └── linux_amd64
│       └── github.com
│           └── ukijumotahaneniarukenia
│               └── script-go-server
│                   └── script.a
└── src
    ├── github.com
    │   └── ukijumotahaneniarukenia
    │       └── script-go-server
    │           ├── README.md
    │           └── script
    │               ├── D00001-OPEN-xxxxx-yyyyy-zzzzz.go
    │               ├── F00001-OPEN-xxxxx-yyyyy-zzzzz.go
    │               └── F00002-NON-OPEN-xxxxx-yyyyy-zzzzz.go
    └── main
        └── main.go

12 directories, 6 files
```

ビルド
```
$  ( export GOPATH=$(pwd) && cd src/main && go install )
```

実行

```
$ ./bin/main
e.num=100,e.str=kkk
hello world
HELLO world
3
```


配布用ビルド

```
$ ./T01-テンプレート作成.sh build 00030-golang-自作パッケージ外部レポインクルード app
Number of parallel builds: 11

-->     windows/386: main
-->      netbsd/arm: main
-->   windows/amd64: main
-->      netbsd/386: main
-->    netbsd/amd64: main
-->       linux/arm: main
-->   freebsd/amd64: main
-->     freebsd/386: main
-->      darwin/386: main
-->     freebsd/arm: main
-->    linux/mipsle: main
-->    darwin/amd64: main
-->     linux/amd64: main
-->    linux/mips64: main
-->     linux/s390x: main
-->       linux/386: main
-->  linux/mips64le: main
-->      linux/mips: main
-->     openbsd/386: main
-->   openbsd/amd64: main

1 errors occurred:
--> darwin/386 error: exit status 2
Stderr: cmd/go: unsupported GOOS/GOARCH pair darwin/386
```

パス登録

```
$ ./T01-テンプレート作成.sh deploy 00030-golang-自作パッケージ外部レポインクルード app
/home/aine/.local/script-cmd/bin/app-golang-1-15-1
```

実行
```
$ app-golang-1-15-1
e.num=100,e.str=kkk
hello world
HELLO world
3
```
