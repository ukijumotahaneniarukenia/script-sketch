- REF
  - https://vim-jp.org/vimdoc-ja/usr_26.html#26.4

- IN

```
$ cat a.txt
うんち

うんぴ

うんこ

うんぽ
```


- CMD


```
$ cat a.vim
%s/うん/ちん/g

write tempfile

quit
```


```
$ vim -e -s a.txt < a.vim
```


- OUT

```
$ cat tempfile
ちんち

ちんぴ

ちんこ

ちんぽ
```
