CMD

```
$ ( export LINES=0;echo {3040..3050}|fmt -1|xargs -I@ utf8lookup @ ) | sed -n '1p;/^UTF-32/!p'

```

OUT

```
UTF-32   name
003040  Undefined in range Hiragana
003041  HIRAGANA LETTER SMALL A
003042  HIRAGANA LETTER A
003043  HIRAGANA LETTER SMALL I
003044  HIRAGANA LETTER I
003045  HIRAGANA LETTER SMALL U
003046  HIRAGANA LETTER U
003047  HIRAGANA LETTER SMALL E
003048  HIRAGANA LETTER E
003049  HIRAGANA LETTER SMALL O
003050  HIRAGANA LETTER GU
```

CMD

```
$ perl -E 'map{say sprintf "%X",$_}0..100000'

$ ( export LINES=0;perl -E 'map{say sprintf "%X",$_}0..100000'|xargs -I@ utf8lookup @ ) | sed -n '1p;/^UTF-32/!p'
```
