```
$ echo '美味しいバイキング' | vim -es /dev/stdin +'%!grep -o .' +'%p|q!'
美
味
し
い
バ
イ
キ
ン
グ
```

```
$ echo '美味しいバイキング' | vim -es /dev/stdin +'%!grep -o .' +'%!xargs' +'%p|q!'
美 味 し い バ イ キ ン グ



```


```
$ echo '美味しいバイキング' | vim -es /dev/stdin +'%!grep -o .' +'%!xargs' +'%p|q!' | xargs -n1
美
味
し
い
バ
イ
キ
ン
グ

```


先頭行と最終行-1の行を選択して出力

解説など

- https://wisteriasec.wordpress.com/2017/08/21/vim%E3%81%AE%E5%A4%96%E9%83%A8%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E9%80%A3%E6%90%BA/
- https://qastack.jp/vi/5989/is-it-possible-to-pipe-vim-commands-to-vim

```


$ echo '妻夫木夫妻' | vim -es /dev/stdin +'%!grep -o .' +':1,$-1' +'%p|q!'


```
