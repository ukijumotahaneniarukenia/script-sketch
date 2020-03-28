```
export CGO_LDFLAGS="$(mecab-config --libs)"
export CGO_CFLAGS="-I$(mecab-config --inc-dir)"
cd 00006-go-mecab
go get github.com/bluele/mecab-golang
```



- REF
  - https://qiita.com/ogady/items/78b40aa8780edf234c5f#go%E3%81%A7%E9%9D%92%E7%A9%BA%E6%96%87%E5%BA%AB%E3%81%8B%E3%82%89wordcloud%E4%BD%9C%E3%81%A3%E3%81%A6%E3%81%BF%E3%81%9F
  - http://grahamian.hatenablog.com/entry/2017/12/08/124139
  - https://github.com/bluele/mecab-golang

- ハッシュをやってからや

