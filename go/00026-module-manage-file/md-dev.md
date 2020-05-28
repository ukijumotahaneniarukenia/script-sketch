```
$ env | grep GO
GOPATH=/home/kuraine/.local



$ ./T01-go-テンプレート作成.sh 00026-module-manage-file

$ cd 00026-module-manage-file/



$ cat <<EOS > src/main/main.go
package main

import (
    "fmt"

    "rsc.io/quote"
)

func main() {
    fmt.Println(quote.Hello())
}
EOS

$ ( export GOPATH=$(pwd) && cd src/main && go install )
main.go:6:5: cannot find package "rsc.io/quote" in any of:
	/usr/local/src/go/src/rsc.io/quote (from $GOROOT)
	/home/kuraine/script-sketch/go/00026-module-manage-file/src/rsc.io/quote (from $GOPATH)



使用しているもぢゅーるがないので、エラー

GOPATHにあればそちらをGOPATHになく、GOROOTにあればそちらを参照するようなフローとおもわれ

依存もぢゅーるを使用しているmain.goがあるフォルダで以下のコマンドを実行


$  ( cd src/main && go mod init main )



以下のようなファイルが作成される


$ find | grep mod$
./src/main/go.mod

$ cat ./src/main/go.mod
module main

go 1.13


この状態でさっきと同じコマンドにtee logをつけて実行


$ ( export GOPATH=$(pwd) && cd src/main && go install ) | tee log
go: finding rsc.io/quote v1.5.2
go: downloading rsc.io/quote v1.5.2
go: extracting rsc.io/quote v1.5.2
go: downloading rsc.io/sampler v1.3.0
go: extracting rsc.io/sampler v1.3.0
go: downloading golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c
go: extracting golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c
go: finding rsc.io/sampler v1.3.0
go: finding golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c


$ ./bin/main
こんにちは世界。


ポータブルかどうか

$ mv ./bin/main $HOME/.local/bin/

$ export PATH=$HOME/.local/bin:$PATH


ポータブル

$ main
こんにちは世界。


実行バイナリ作成後のgo.modは以下

$ cat ./src/main/go.mod
module main

go 1.13

require rsc.io/quote v1.5.2


依存ツリーは

$ cd 00026-module-manage-file
$ ( cd src/main && go mod graph )
main rsc.io/quote@v1.5.2
rsc.io/quote@v1.5.2 rsc.io/sampler@v1.3.0
rsc.io/sampler@v1.3.0 golang.org/x/text@v0.0.0-20170915032832-14c0d48ead0c

go.sumファイルもできている

$ cat ./src/main/go.sum
golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c h1:qgOY6WgZOaTkIIMiVjBQcw93ERBE4m30iBm00nkL0i8=
golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c/go.mod h1:NqM8EUOU14njkJ3fqMW+pc6Ldnwhi/IjpwHt7yyuwOQ=
rsc.io/quote v1.5.2 h1:w5fcysjrx7yqtD/aO+QwRjYZOKnaM9Uh2b40tElTs3Y=
rsc.io/quote v1.5.2/go.mod h1:LzX7hefJvL54yjefDEDHNONDjII0t9xZLPXsUe+TKr0=
rsc.io/sampler v1.3.0 h1:7uVkIFmeBqHfdjD+gZwtXXI+RODJ2Wc4O7MPEh/QiW4=
rsc.io/sampler v1.3.0/go.mod h1:T1hPZKmBbMNahiBKFy5HrXp6adAjACjK9JXDnKaTXpA=


```




