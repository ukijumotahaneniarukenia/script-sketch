- CMD

全体

```
$  cat html-snippet.tsv  | while read g c;do echo "let @q=\"i$c\<Esc>:call emmet#expandAbbr(3,\\\"\\\")\<Enter>\"";done >vim-macro-emmet-html-snippet-all.vim
```


個別

```
$ cat html-snippet.tsv  | while read g c;do echo "let @q=\"i$c\<Esc>:call emmet#expandAbbr(3,\\\"\\\")\<Enter>\"" >vim-macro-emmet-html-snippet-$c-$g.vim;done
```
