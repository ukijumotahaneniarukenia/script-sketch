
たまにグレルので、go.modで統一したほうがいいか

```

cd  00027-module-manage-file-maybe-non-regualr-flow



$ env | grep GO
GOPATH=/home/kuraine/.local/go-repo

$ export GOPATH=$(pwd)
$ env | grep GO
GOPATH=/home/kuraine/script-sketch/go/00027-module-manage-file-maybe-non-regualr-flow

$ tree
.
├── bin
│   └── main
├── pkg
└── src
    └── main
        └── main.go

4 directories, 2 files



$ cat src/main/main.go
package main

import (
    "fmt"

    "rsc.io/quote"
)

func main() {
    fmt.Println(quote.Hello())
}


$ go get -u rsc.io/quote
package rsc.io/quote/v3: code in directory /home/kuraine/script-sketch/go/00027-module-manage-file-maybe-non-regualr-flow/src/rsc.io/quote/v3 expects import "rsc.io/quote"



$ tree
.
├── bin
│   └── main
├── md-dev.md
├── pkg
└── src
    ├── main
    │   └── main.go
    └── rsc.io
        └── quote
            ├── LICENSE
            ├── README.md
            ├── buggy
            │   └── buggy_test.go
            ├── go.mod
            ├── go.sum
            ├── quote.go
            ├── quote_test.go
            └── v3
                ├── go.mod
                ├── go.sum
                └── quote.go

8 directories, 13 files


$ ( export GOPATH=$(pwd) && cd src/main && go install )
../rsc.io/quote/quote.go:8:8: code in directory /home/kuraine/script-sketch/go/00027-module-manage-file-maybe-non-regualr-flow/src/rsc.io/quote/v3 expects import "rsc.io/quote"

```
