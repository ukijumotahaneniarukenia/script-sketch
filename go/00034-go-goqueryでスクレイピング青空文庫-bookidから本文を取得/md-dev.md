
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

```
cd 00034-go-goqueryでスクレイピング青空文庫-bookidから本文を取得

( export GOPATH=$(pwd) && cd src/main && go install )

go get golang.org/x/text/encoding/japanese

go get golang.org/x/text/transform

go get github.com/PuerkitoBio/goquery



```


コンパイル

```


$ cd 00034-go-goqueryでスクレイピング青空文庫-bookidから本文を取得

$ ( export GOPATH=$(pwd) && cd src/main && go install )

```
