```

$ echo ﾋﾞﾘｰｱｲﾘｯｼｭ | openssl enc -e -aes256 -pass pass:うんこ |  nkf -w8 | grep -I -Po '\p{Katakana}' | xargs -n3 | tr -d ' ' | xargs

```


```


ユユヨ ァケ

```
