- IN

```
$echo 3 {a..j}
3 a b c d e f g h i j
```


- CMD

```
$echo 3 {a..j} | ./main
```


- OUT

```
@["a", "b", "c"]
@["b", "c", "d"]
@["c", "d", "e"]
@["d", "e", "f"]
@["e", "f", "g"]
@["f", "g", "h"]
@["g", "h", "i"]
@["h", "i", "j"]
@["i", "j"]
@["j"]
```


- IN

```
$echo {a..z} | xargs -n6 | nl | perl -pe 's;^ {1,};;;s;\t; ;'
1 a b c d e f
2 g h i j k l
3 m n o p q r
4 s t u v w x
5 y z
```

- CMD

```
$echo {a..z} | xargs -n6 | nl | perl -pe 's;^ {1,};;;s;\t; ;' | ./main
```

- OUT

```
@["a"]
@["b"]
@["c"]
@["d"]
@["e"]
@["f"]
@["g", "h"]
@["h", "i"]
@["i", "j"]
@["j", "k"]
@["k", "l"]
@["l"]
@["m", "n", "o"]
@["n", "o", "p"]
@["o", "p", "q"]
@["p", "q", "r"]
@["q", "r"]
@["r"]
@["s", "t", "u", "v"]
@["t", "u", "v", "w"]
@["u", "v", "w", "x"]
@["v", "w", "x"]
@["w", "x"]
@["x"]
@["y", "z"]
@["z"]
```
