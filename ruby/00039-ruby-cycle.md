- IN

```
$ echo 3 ジーナ マルコ 紅の豚
3 ジーナ マルコ 紅の豚
```

- CMD

```
echo 3 ジーナ マルコ 紅の豚 | ruby -anle 'n=$F[0].to_i;m=$F[1..$F.size].size;a=$F[1..$F.size].cycle(m < n ? m : n).to_a;p a'
```

- OUT

```
["ジーナ", "マルコ", "紅の豚", "ジーナ", "マルコ", "紅の豚", "ジーナ", "マルコ", "紅の豚"]
```