
- https://github.com/aozorahack/pubserver

文字コードなどを推察

```
$ curl -sSL 'http://pubserver2.herokuapp.com/api/v0.1/books/2093/content?format=txt' | nkf -g -
```

Shift-jisだったので、utf8に変換し、ファイルにリダイレクト

```

$ curl -sSL 'http://pubserver2.herokuapp.com/api/v0.1/books/2093/content?format=txt' | nkf -S -w8 >2093.txt

```

事前準備

mecabヘッダファイルなどインストール

```
sudo apt install -y mecab mecab-ipadic-utf8 libmecab-dev
```


環境変数などを定義

```
export CGO_LDFLAGS="$(mecab-config --libs)"


export CGO_CFLAGS="-I$(mecab-config --inc-dir)"

```


```
cd 00035-go-goqueryでスクレイピング青空文庫-本文を形態素解析する

( export GOPATH=$(pwd) && cd src/main && go install )

go get github.com/bluele/mecab-golang



```


コンパイル

```


$ cd 00035-go-goqueryでスクレイピング青空文庫-本文を形態素解析する

 ( export GOPATH=$(pwd) && cd src/main && go install )

```

