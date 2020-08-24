- CMD

```
$ cat html-snippet.tsv  | while read g c;do echo "let @$g=\"i$c\<Esc>:call emmet#expandAbbr(3,\"\")\<Enter>\"";done >vim-emmet-html-snippet-macro.vim
```
