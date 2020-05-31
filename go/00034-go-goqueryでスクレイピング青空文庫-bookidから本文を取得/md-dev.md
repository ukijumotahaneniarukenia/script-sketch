
- https://github.com/aozorahack/pubserver

文字コードなどを推察

```
$ curl -sSL 'http://pubserver2.herokuapp.com/api/v0.1/books/2093/content?format=txt' | nkf -g -
```

Shift-jisだったので、utf8に変換し、ファイルにリダイレクト

```

$ curl -sSL 'http://pubserver2.herokuapp.com/api/v0.1/books/2093/content?format=txt' | nkf -S -w8 >2093.txt

```
