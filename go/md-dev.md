- REF
  - http://gihyo.jp/dev/feature/01/go_4beginners/0001?page=3

- 作業ディレクトリ作成
```
$mkdir -p 00004-go-テキスト処理/{bin,pkg,src{,/main}}
$cd 00004-go-テキスト処理
$touch src/main/main.go
$echo '/bin/* /pkg/* /github.com/* /main' | xargs -n1 >.gitignore
```

- 動作確認

```
$cd 00004-go-テキスト処理
$export GOPATH=$(pwd)
$src/main
$go install
$export PATH=$PATH:$GOPATH/bin
$main
```

- 外部パッケージ化
  - mainファイルの参照を書き換える
  - goのソースは別レポジトリで管理するようにする
```
$cd 00004-go-テキスト処理
$mkdir -p src/github.com/ukijumotahaneniarukenia/gone
$find src -maxdepth 1 -type d | grep -vP 'main|github' | grep -P '/' | xargs -I@ mv @ src/github.com/ukijumotahaneniarukenia/gone
$find . -name "*go" | grep -vP 'main' | perl -anlE 's/.\/src\///g and s/(.*)(\/.*.go)/\1/g and say'
```

- ローカルモジュールをコミット
```
$cd $GOPATH/src/github.com/ukijumotahaneniarukenia/gone
$git init
$git add .
$git commit -m 'sketch'
$git remote add origin https://github.com/ukijumotahaneniarukenia/gone.git
$git push -u origin master
```

- ローカルサブモジュールを削除

```
$cd 00004-go-テキスト処理
$rm -rf src/github.com
```

- リモートサブモジュールを取得

```
$cd 00004-go-テキスト処理
$go get github.com/ukijumotahaneniarukenia/gone
```

- 動作確認

```
$cd 00004-go-テキスト処理
$export GOPATH=$(pwd)
$go install
$export PATH=$PATH:$GOPATH/bin
$main
```
