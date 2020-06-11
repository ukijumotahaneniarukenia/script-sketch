- CMD

```

parallel echo ::: cafelatte ::: $(echo cafelatte | jq -rR './""|.[]') | ruby -anle 'p $F[0],$F[1],$F[0].enum_for(:scan, /#{$F[1]}/).map{Regexp.last_match.begin(0)}.join(",")' | xargs -n3

```


- OUT

```

cafelatte c 0
cafelatte a 1,5
cafelatte f 2
cafelatte e 3,8
cafelatte l 4
cafelatte a 1,5
cafelatte t 6,7
cafelatte t 6,7
cafelatte e 3,8

```
