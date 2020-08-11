- ディレクトリ名のリネーム

```
find -maxdepth 1 -type d | grep -P '[0-9]{5}' | ruby -F- -anle 'p $F.join("-"),$F[0]+"-"+$F[1].gsub(/go/,"golang")+"-"+$F[2..$F.size-1].join("-");' | xargs -n2 | while read pre post;do echo git mv $pre $post;done
```
