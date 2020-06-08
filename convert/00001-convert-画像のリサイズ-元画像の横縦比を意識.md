- IN

```
curl -o test.png -fsSL https://www.pngonly.com/wp-content/uploads/2017/06/quality-owl-png-10202.png
eog test.png #プレビュー

$identify test.png
test.png PNG 515x739 515x739+0+0 8-bit sRGB 235222B 0.000u 0:00.000
```

- CMD

```
convert test.png -resize 200x300 test2.png
```

- OUT

```
$identify test2.png
test2.png PNG 200x287 200x287+0+0 8-bit sRGB 105332B 0.000u 0:00.000

eog test2.png #プレビュー
```