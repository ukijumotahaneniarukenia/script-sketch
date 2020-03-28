- REF
  - http://gihyo.jp/dev/feature/01/go_4beginners/0001?page=3

- DIR
  - 1ディレクトリ1ファイルの模様???まだよくわかってない
  - 定数やメソッドで機能を表現していく
  - goのソースは別レポジトリで管理するようにする

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


- 外部パッケージ化

```
$cd ~/script-sketch/go/00002-go-パッケージ関連のディレクトリ構造
$mkdir -p src/github.com/ukijumotahaneniarukenia/gone
$tree
.
├── bin
│   └── main
├── md-dev.md
├── pkg
└── src
    ├── callee
    │   └── callee.go
    ├── github.com
    │   └── ukijumotahaneniarukenia
    │       └── gone
    ├── gosample
    │   └── gosample.go
    └── main
        └── main.go

9 directories, 5 files

$find src -maxdepth 1 -type d | grep -vP 'main|github' | grep -P '/' | xargs -I@ mv @ src/github.com/ukijumotahaneniarukenia/gone

$tree
.
├── bin
│   └── main
├── md-dev.md
├── pkg
└── src
    ├── github.com
    │   └── ukijumotahaneniarukenia
    │       └── gone
    │           ├── callee
    │           │   └── callee.go
    │           └── gosample
    │               └── gosample.go
    └── main
        └── main.go

9 directories, 5 files
```

main.goの参照を書き換える

```
$cd ~/script-sketch/go/00002-go-パッケージ関連のディレクトリ構造
$find . -name "*go" | grep -vP 'main' | perl -anlE 's/.\/src\///g and s/(.*)(\/.*.go)/\1/g and say'
github.com/ukijumotahaneniarukenia/gone/gosample
github.com/ukijumotahaneniarukenia/gone/callee
```


```
$cat src/main/main.go
package main
import (
    "fmt"
    "github.com/ukijumotahaneniarukenia/gone/gosample"
    "github.com/ukijumotahaneniarukenia/gone/callee"
)

func main() {
    fmt.Println(gosample.Message)
    fmt.Println(callee.MSG)
}
```

サブもぢゅーるだけコミット

```
$cd $GOPATH/src/github.com/ukijumotahaneniarukenia/gone
$git init
$git add .
$git commit -m 'my first golang package'
$git remote add origin https://github.com/ukijumotahaneniarukenia/gone.git
$git push -u origin master
```


ローカルサブモジュールを削除

```
$cd ~/script-sketch/go/00002-go-パッケージ関連のディレクトリ構造
$tree
.
├── bin
├── md-dev.md
├── pkg
└── src
    ├── github.com
    │   └── ukijumotahaneniarukenia
    │       └── gone
    │           ├── callee
    │           │   └── callee.go
    │           └── gosample
    │               └── gosample.go
    └── main
        └── main.go

9 directories, 4 files
$rm -rf src/github.com
$tree
.
├── bin
├── md-dev.md
├── pkg
└── src
    └── main
        └── main.go

4 directories, 2 files

```

リモートサブモジュールを取得

```
$cd ~/script-sketch/go/00002-go-パッケージ関連のディレクトリ構造/src
$go get github.com/ukijumotahaneniarukenia/gone
$cd ~/script-sketch/go/00002-go-パッケージ関連のディレクトリ構造
$go install
$tree
.
├── bin
│   └── main
├── md-dev.md
├── pkg
└── src
    ├── github.com
    │   └── ukijumotahaneniarukenia
    │       └── gone
    │           ├── callee
    │           │   └── callee.go
    │           └── gosample
    │               └── gosample.go
    └── main
        └── main.go

9 directories, 5 files

```

動作確認

```
$cd 00002-go-パッケージ関連のディレクトリ構造
$export GOPATH=$(pwd)
$export PATH=$PATH:$GOPATH/bin
$main
hello world
HELLO WORLD
```
