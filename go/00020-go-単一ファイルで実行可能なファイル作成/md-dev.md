```
$ mkdir 00020-go-単一ファイルで実行可能なファイル作成
$ cd 00020-go-単一ファイルで実行可能なファイル作成

$ mkdir -p src/main
$ touch src/main/main.go
$ vi src/main/main.go
$ ( cd src/main/ && go install )

$ ( export GOPATH=$(pwd) && cd src/main/ && go install )
$ tree
.
├── bin
│   └── main
└── src
    └── main
        └── main.go

3 directories, 2 files



```


事前に以下の場所をパスに通しておく必要がある


```
$ echo 'export PATH=$HOME/.local/bin:$PATH' >>$HOME/.bashrc
```

実行バイナリを移動

```
$ mv ./bin/main $HOME/.local/bin/
```

実行ファイル名を入力し、エンターキーを押下

```
$ main
うんこ

```
