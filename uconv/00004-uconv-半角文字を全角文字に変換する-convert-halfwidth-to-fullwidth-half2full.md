- IN

```
echo k{a,i,u,e,o} | uconv -x katakana | uconv -x Fullwidth-Halfwidth
ｶ ｷ ｸ ｹ ｺ
```

- CMD

```
echo k{a,i,u,e,o} | uconv -x katakana | uconv -x Fullwidth-Halfwidth | uconv -x Halfwidth-Fullwidth
```

- OUT

```
カ　キ　ク　ケ　コ
```
