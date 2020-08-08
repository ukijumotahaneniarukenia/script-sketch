- リネーム

```
$ ag -g test2 | ruby -F"\." -anle 'p $F.join("."),"test."+$F[1..$F.size-1].join(".")' | xargs -n2 | xargs -I@ echo git mv @ | bash
```

- 一括置換

```
$ ag test2 -l | xargs perl -pi -e 's/test2/test/g'
```
