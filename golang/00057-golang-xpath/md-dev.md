外部ライブラリインストール時にimport文でエラー出る際

GO111MODULE環境変数をonにするとうまくいく

```
$ cd ~/script-sketch/golang/00057-golang-xpath/app

$ export GOPATH=$(pwd)

$ time go get gopkg.in/xmlpath.v2

#設定オン
$ go env -w GO111MODULE=on

#確認
$ go env | grep GO111MODULE

#vscode立ち上げ直す

$ ( export GOPATH=$(pwd) && cd src/main && go install )

$ ./bin/main  /html/body/div[1]/div/div/div/main/article/header/h1 https://ukijumotahaneniarukenia.site/
記事一覧

#設定オフ
$ go env -w GO111MODULE=off
```
