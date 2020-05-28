




```


export CGO_LDFLAGS="$(mecab-config --libs)"


export CGO_CFLAGS="-I$(mecab-config --inc-dir)"


export GOPATH=$(pwd)

go get github.com/shogo82148/go-mecab



```


```

$ tree
.
├── bin
├── md-dev.md
├── pkg
│   └── linux_amd64
│       └── github.com
│           └── shogo82148
│               └── go-mecab.a
└── src
    ├── github.com
    │   └── shogo82148
    │       └── go-mecab
    │           ├── LICENSE
    │           ├── README.md
    │           ├── example_test.go
    │           ├── go.mod
    │           ├── lattice.go
    │           ├── mecab.go
    │           ├── mecab_test.go
    │           ├── model.go
    │           ├── model_test.go
    │           └── node.go
    └── main
        └── main.go

10 directories, 13 files


```



```

$echo $GOPATH
/home/kuraine/script-sketch/go/00019-go-まつだいら


```




```
$ ( export GOPATH=$(pwd) && cd src/main && go install )
$ tree
.
├── bin
│   └── main
├── md-dev.md
├── pkg
│   └── linux_amd64
│       └── github.com
│           └── shogo82148
│               └── go-mecab.a
└── src
    ├── github.com
    │   └── shogo82148
    │       └── go-mecab
    │           ├── LICENSE
    │           ├── README.md
    │           ├── example_test.go
    │           ├── go.mod
    │           ├── lattice.go
    │           ├── mecab.go
    │           ├── mecab_test.go
    │           ├── model.go
    │           ├── model_test.go
    │           └── node.go
    └── main
        └── main.go

10 directories, 14 files




$ ./bin/main
[./bin/main]
```
