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
@[@["a", "b", "c", "d"], @["e", "f", "g", "h"], @["i", "j"]]
```

- IN

```
$echo {a..z} | xargs -n9 | nl | perl -pe 's;^ {1,};;;s;\t; ;;'
1 a b c d e f g h i
2 j k l m n o p q r
3 s t u v w x y z
```

- CMD

```
$echo {a..z} | xargs -n9 | nl | perl -pe 's;^ {1,};;;s;\t; ;;' | ./main
```

- OUT

```
@[@["a", "b", "c", "d", "e", "f", "g", "h", "i"]]
@[@["j", "k", "l", "m", "n"], @["o", "p", "q", "r"]]
@[@["s", "t", "u"], @["v", "w", "x"], @["y", "z"]]
```


- IN

```
$echo {a..z} | xargs -n4 | nl | perl -pe 's;^ {1,};;;s;\t; ;;'
1 a b c d
2 e f g h
3 i j k l
4 m n o p
5 q r s t
6 u v w x
7 y z
```

- CMD

```
$echo {a..z} | xargs -n4 | nl | perl -pe 's;^ {1,};;;s;\t; ;;' | ./main
```

- OUT

```
@[@["a", "b", "c", "d"]]
@[@["e", "f"], @["g", "h"]]
@[@["i", "j"], @["k", "l"], @[]]
@[@["m"], @["n"], @["o"], @["p"]]
@[@["q"], @["r"], @["s"], @["t"], @[]]
@[@["u"], @["v"], @["w"], @["x"], @[], @[]]
@[@["y"], @["z"], @[], @[], @[], @[], @[]]
```


- IN

```
$echo a{a..z} | xargs -n4 | nl | perl -pe 's;^ {1,};;;s;\t; ;;'
1 aa ab ac ad
2 ae af ag ah
3 ai aj ak al
4 am an ao ap
5 aq ar as at
6 au av aw ax
7 ay az
```

- CMD

```
$echo a{a..z} | xargs -n4 | nl | perl -pe 's;^ {1,};;;s;\t; ;;' | ./main
```


- OUT

```
@[@["aa", "ab", "ac", "ad"]]
@[@["ae", "af"], @["ag", "ah"]]
@[@["ai", "aj"], @["ak", "al"], @[]]
@[@["am"], @["an"], @["ao"], @["ap"]]
@[@["aq"], @["ar"], @["as"], @["at"], @[]]
@[@["au"], @["av"], @["aw"], @["ax"], @[], @[]]
@[@["ay"], @["az"], @[], @[], @[], @[], @[]]
```
