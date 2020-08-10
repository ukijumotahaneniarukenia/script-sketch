外部ライブラリは以下のように追加すればいいじゃないか

mod管理に移行など 逆生成など やりやすそうなのを選ぶ

```
$ ( cd 00099-golang-テンプレートプロジェクトの作成/app/ && export GOPATH=$(pwd) && go get golang.org/x/text/width )
$ ( cd 00099-golang-テンプレートプロジェクトの作成/app/ && export GOPATH=$(pwd) && go get github.com/PuerkitoBio/goquery )
$ ( cd 00099-golang-テンプレートプロジェクトの作成/app/ && export GOPATH=$(pwd) && go get golang.org/x/text/encoding/japanese )
```

build

```
$ bash T01-テンプレート作成.sh build 00099-golang-テンプレートプロジェクトの作成 app
```
