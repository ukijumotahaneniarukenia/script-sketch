- IN

```
$ echo -e "ジーナ マルコ 紅の豚\nサボイア セスナ スカイホーク"
ジーナ マルコ 紅の豚
サボイア セスナ スカイホーク
```

- CMD

```
echo -e "ジーナ マルコ 紅の豚\nサボイア スカイホーク" | ruby -e 'a=[];$<.map{|n|a.push(n.split("\n")[0].split(" "))};a[0].zip(a[1]).map{|x| p x}'
```

- OUT

```
["ジーナ", "サボイア"]
["マルコ", "スカイホーク"]
["紅の豚", nil]
```

- IN

```
$ echo -e "ジーナ マルコ 紅の豚\nサボイア スカイホーク"
ジーナ マルコ 紅の豚
サボイア スカイホーク
```

- CMD

```
echo -e "ジーナ マルコ 紅の豚\nサボイア セスナ スカイホーク" | ruby -e 'a=[];$<.map{|n|a.push(n.split("\n")[0].split(" "))};a[0].zip(a[1]).map{|x| p x}'
```

- OUT

```
["ジーナ", "サボイア"]
["マルコ", "セスナ"]
["紅の豚", "スカイホーク"]
```
