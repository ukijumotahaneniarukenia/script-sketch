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
