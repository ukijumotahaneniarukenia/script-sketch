- REF
  - http://gihyo.jp/dev/feature/01/go_4beginners/0001?page=3

- DIR
  - 1ディレクトリ1ファイルの模様
  - 定数やメソッドで機能を表現していく


- ASIS
```
$cd ~/script-sketch/go/00002-go-パッケージ関連のディレクトリ構造
$tree
.
├── bin
├── pkg
└── src
    ├── gosample
    │   ├── callee.go
    │   └── gosample.go
    └── main
        └── main.go

5 directories, 3 files
```

- TOBE
```
$tree
.
├── bin
├── pkg
└── src
    ├── callee
    │   └── callee.go
    ├── gosample
    │   └── gosample.go
    └── main
        └── main.go

6 directories, 3 files
```



```
$cat src/callee/callee.go
package callee

var MSG string = "HELLO WORLD"
```

```
$cat src/gosample/gosample.go
package gosample

var Message string = "hello world"
```

```
$cat src/main/main.go
package main
import (
    "fmt"
    "gosample"
    "callee"
)

func main() {
    fmt.Println(gosample.Message)
    fmt.Println(callee.MSG)
}
```


- MAN

```
$mkdir 00002-go-パッケージ関連のディレクトリ構造
$cd 00002-go-パッケージ関連のディレクトリ構造
$mkdir {bin,pkg,src}
$export GOPATH=$(pwd)
$mkdir -p src/gosample
$touch src/gosample/gosample.go
$touch src/callee/callee.go
$mkdir -p src/main
$touch src/main/main.go
$cd $GOPATH/src/main
$vi md-dev.md
$cd $GOPATH/src/main
$go install
$tree
.
├── bin
│   └── main
├── md-dev.md
├── pkg
└── src
    ├── callee
    │   └── callee.go
    ├── gosample
    │   └── gosample.go
    └── main
        └── main.go

6 directories, 5 files
$export PATH=$PATH:$GOPATH/bin
$main
hello world
HELLO WORLD
```
