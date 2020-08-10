vscodeでgoもぢゅーるなどを自動インストールしたときのログ


デフォルトで

GOPATHはホームディレクトリのgoディレクトリの配下になる

```
go.toolsGopath setting is not set. Using GOPATH /home/kuraine/go
Installing 17 tools at /home/kuraine/go/bin in module mode.
  gocode
  gopkgs
  go-outline
  go-symbols
  guru
  gorename
  gotests
  gomodifytags
  impl
  fillstruct
  goplay
  godoctor
  dlv
  gocode-gomod
  godef
  goreturns
  golint

Installing github.com/mdempsky/gocode SUCCEEDED
Installing github.com/uudashr/gopkgs/v2/cmd/gopkgs SUCCEEDED
Installing github.com/ramya-rao-a/go-outline SUCCEEDED
Installing github.com/acroca/go-symbols SUCCEEDED
Installing golang.org/x/tools/cmd/guru SUCCEEDED
Installing golang.org/x/tools/cmd/gorename SUCCEEDED
Installing github.com/cweill/gotests/... SUCCEEDED
Installing github.com/fatih/gomodifytags SUCCEEDED
Installing github.com/josharian/impl SUCCEEDED
Installing github.com/davidrjenni/reftools/cmd/fillstruct SUCCEEDED
Installing github.com/haya14busa/goplay/cmd/goplay SUCCEEDED
Installing github.com/godoctor/godoctor SUCCEEDED
Installing github.com/go-delve/delve/cmd/dlv SUCCEEDED
Installing github.com/stamblerre/gocode SUCCEEDED
Installing github.com/rogpeppe/godef SUCCEEDED
Installing github.com/sqs/goreturns SUCCEEDED
Installing golang.org/x/lint/golint SUCCEEDED

All tools successfully installed. You are ready to Go :).
```


自動でダウンロードした実行バイナリ群をコマンドライン上で使用したい場合は、以下のようにパスをとおす


```
$ export GOPATH=$HOME/go
$ export PATH=$GOPATH/bin:$PATH


#タブキー２回ぐらい勢いで連打
#サジェストが出る
$ go
go             go-symbols     gocode         godef          gofmt          golint         gopkgs         gorename       gotests        
go-outline     gobject-query  gocode-gomod   godoctor       gold           gomodifytags   goplay         goreturns      
```


