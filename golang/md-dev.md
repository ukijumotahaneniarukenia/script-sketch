- golangのIDE

  - http://liteide.org/en/


各作業ディレクトリに移動してGOPATHを設定してからideを起動するといい感じ

```
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
$ env | grep GO
GOPATH=/home/kuraine/script-sketch/go/00043-go-filepathでパスからファイル名を得る
```

ideの起動
```
liteide 1>$HOME/launch-liteide.log 2>&1 &
```

起動時のログ

GOROOTはgoコマンドの実行バイナリの２つ上を設定している

```
07:09:42 LiteApp: Initializing
07:09:42 Load Setting: /home/kuraine/.config/liteide/liteide.ini
07:09:42 LiteApp: Loaded MIME folderproject.xml
07:09:42 LiteApp: Loaded MIME gopackage.xml
07:09:42 LiteApp: Loaded MIME liteeditor.xml
07:09:42 LiteApp: Loaded MIME qsqleditor.xml
07:09:42 WordApiManager: Loading /usr/local/src/liteide/share/liteide/packages
07:09:42 load word api: /usr/local/src/liteide/share/liteide/packages/go/funcs.api,/usr/local/src/liteide/share/liteide/packages/go/keyword.api,/usr/local/src/liteide/share/liteide/packages/go/types.api
07:09:42 load snippet api: /usr/local/src/liteide/share/liteide/packages/go/go.snippet.json
07:09:42 load word api: /usr/local/src/liteide/share/liteide/packages/lua/luabase.api,/usr/local/src/liteide/share/liteide/packages/lua/lualib.api,/usr/local/src/liteide/share/liteide/packages/lua/lualib5_annot.api
07:09:42 LiteApp: Loaded plugin/liteeditor
07:09:42 LiteEnv: Loaded environment files from /usr/local/src/liteide/share/liteide/liteenv
07:09:42 LiteApp: Loaded plugin/liteenv
07:09:42 LiteApp: Loaded plugin/litefind
07:09:42 LiteApp: Loaded plugin/quickopen
07:09:42 BuildManager: Loading /usr/local/src/liteide/share/liteide/litebuild
07:09:42 Execute commands: Loading /usr/local/src/liteide/share/liteide/litebuild/command
07:09:42 LiteApp: Loaded plugin/litebuild
07:09:42 LiteApp: Loaded plugin/golangast
07:09:42 LiteApp: Loaded plugin/welcome
07:09:42 LiteApp: Loaded plugin/terminal
07:09:42 LiteApp: Loaded plugin/rustedit
07:09:42 LiteApp: Loaded plugin/markdown
07:09:42 LiteApp: Loaded plugin/litetty
07:09:42 LiteApp: Loaded plugin/litedebug
07:09:42 LiteApp: Loaded plugin/jsonedit
07:09:42 LiteApp: Loaded plugin/imageviewer
07:09:42 LiteApp: Loaded plugin/gopresent
07:09:42 LiteApp: Loaded plugin/golangplay
07:09:42 LiteApp: Loaded plugin/golangpackage
07:09:42 LiteApp: Loaded plugin/golangfmt
07:09:42 LiteApp: Loaded plugin/golangedit
07:09:42 LiteApp: Loaded plugin/golangdoc
07:09:42 LiteApp: Loaded plugin/golangcode
07:09:42 LiteApp: Loaded plugin/gdbdebugger
07:09:42 LiteApp: Loaded plugin/filebrowser
07:09:42 LiteApp: Loaded plugin/fakevimedit
07:09:42 LiteApp: Loaded plugin/dlvdebugger
07:09:42 LiteApp: Loaded plugin/bookmarks
07:09:42 EnvManager: init load environment
07:09:42 LiteEnv: load environment system
07:09:42 Load session: default
07:09:42 LiteEnv: go env
GO111MODULE=""
GOARCH="amd64"
GOBIN=""
GOCACHE="/home/kuraine/.cache/go-build"
GOENV="/home/kuraine/.config/go/env"
GOEXE=""
GOFLAGS=""
GOHOSTARCH="amd64"
GOHOSTOS="linux"
GONOPROXY=""
GONOSUMDB=""
GOOS="linux"
GOPATH="/home/kuraine/script-sketch/go/00043-go-filepathでパスからファイル名を得る"
GOPRIVATE=""
GOPROXY="https://proxy.golang.org,direct"
GOROOT="/usr/local/src/go"
GOSUMDB="sum.golang.org"
GOTMPDIR=""
GOTOOLDIR="/usr/local/src/go/pkg/tool/linux_amd64"
GCCGO="gccgo"
AR="ar"
CC="gcc"
CXX="g++"
CGO_ENABLED="1"
GOMOD=""
CGO_CFLAGS="-g -O2"
CGO_CPPFLAGS=""
CGO_CXXFLAGS="-g -O2"
CGO_FFLAGS="-g -O2"
CGO_LDFLAGS="-g -O2"
PKG_CONFIG="pkg-config"
GOGCCFLAGS="-fPIC -m64 -pthread -fmessage-length=0 -fdebug-prefix-map=/tmp/go-build042650692=/tmp/go-build -gno-record-gcc-switches"
07:09:42 LiteEnv: reset system environment for "go env"
07:09:42 LiteBuild: go environment changed
07:09:42 GolangPackage: Found go bin at /usr/local/src/go/bin/go
07:09:42 GolangPackage: GOROOT=/usr/local/src/go
07:09:42 GolangPackage: GOPATH=/home/kuraine/script-sketch/go/00043-go-filepathでパスからファイル名を得る
07:09:42 GolangPackages: reload all packages
07:09:42 GolangCode: go environment changed
07:09:42 GolangCode: Found gocode at /usr/local/src/liteide/bin/gocode
07:09:42 GolangCode: gocode set lib-path "/home/kuraine/script-sketch/go/00043-go-filepathでパスからファイル名を得る"
07:09:42 HtmlWidgetFactory: QTextBrowser
07:09:42 DefaultHtmlWidgetFactory: QTextBrowser
07:09:42 LiteApp: Finished loading
```




- ショートカット手順


スクリプトディレクトリ名を引数に渡してNow On Airが標準出力にしゅつりょくされればおｋ

```

$ ./T01-go-テンプレート作成.sh XXXXX-go-マイスペ
Now On Air

```

そのあとは

修正

パス通し

```

$ cd  XXXXX-go-マイスペ

$ ( export GOPATH=$(pwd) && cd src/main && go install )

$ ./bin/main


```

動作確認




```

```



- REF
  - http://gihyo.jp/dev/feature/01/go_4beginners/0001?page=3

- 作業ディレクトリ作成
```
$mkdir -p 00004-go-テキスト処理/{bin,pkg,src{,/main}}
$cd 00004-go-テキスト処理
$touch src/main/main.go
$echo '/bin/* /pkg/* /github.com/* /main' | xargs -n1 >.gitignore
```

- スクリプト作成

```
$cat <<EOS >src/main/main.go
package main

import (
	"fmt"
)

func main() {
	fmt.Println("Hello, playground")
}
EOS
```

- 動作確認

```
$ cd 00004-go-テキスト処理
$ ( export GOPATH=$(pwd) && cd src/main && go install )
$ ./bin/main
```

- 外部パッケージ化
  - goのソースは別レポジトリで管理するようにする

- go-repoからサブモジュールを取得

```
$ cd 00004-go-テキスト処理
$ export GOPATH=$(pwd)
$ go get github.com/ukijumotahaneniarukenia/go-repo
```

- 動作確認
  - 00030などを参照
