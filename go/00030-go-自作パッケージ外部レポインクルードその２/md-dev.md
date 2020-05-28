```

$ ./T01-go-テンプレート作成.sh 00030-go-自作パッケージ外部レポインクルードその２

$ cd 00030-go-自作パッケージ外部レポインクルードその２


$ tree
.
├── bin
│   └── main
├── pkg
└── src
    └── main
        └── main.go

4 directories, 2 files

$ export GOPATH=$(pwd)

$ go get github.com/ukijumotahaneniarukenia/go-repo

$ tree
.
├── bin
│   ├── go-repo
│   └── main
├── pkg
└── src
    ├── github.com
    │   └── ukijumotahaneniarukenia
    │       └── go-repo
    │           ├── README.md
    │           ├── a.go
    │           └── go_script
    │               ├── D00001-OPEN-xxxxx-yyyyy-zzzzz.go
    │               ├── F00001-OPEN-xxxxx-yyyyy-zzzzz.go
    │               └── F00002-NON-OPEN-xxxxx-yyyyy-zzzzz.go
    └── main
        └── main.go

8 directories, 8 files

$ ./bin/main
Now On Air


$ ./bin/go-repo
うんこだよーん


$  ( export GOPATH=$(pwd) && cd src/main && go install )


$ ./bin/main
e.num=100,e.str=kkk
hello world
HELLO world
3


$ mv ./bin/main $HOME/.local/go-script/bin/testcmd


$ testcmd
e.num=100,e.str=kkk
hello world
HELLO world
3


```
