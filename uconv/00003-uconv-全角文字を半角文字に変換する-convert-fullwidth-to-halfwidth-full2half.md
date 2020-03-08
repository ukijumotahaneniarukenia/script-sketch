- IN

```
echo k{a,i,u,e,o} | uconv -x katakana
カ キ ク ケ コ
```

- CMD

```
echo k{a,i,u,e,o} | uconv -x katakana | uconv -x Fullwidth-Halfwidth
```

- OUT

```
ｶ ｷ ｸ ｹ ｺ
```
