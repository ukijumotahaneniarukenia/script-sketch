- IN

```
curl -o test.png -fsSL https://www.pngonly.com/wp-content/uploads/2017/06/quality-owl-png-10202.png
curl -o test2.png -fsSL https://www.pngonly.com/wp-content/uploads/2017/06/Apple-Fruit-Small-Size-PNG.png

$ identify test.png 
test.png PNG 515x739 515x739+0+0 8-bit sRGB 235222B 0.000u 0:00.000

$ identify test2.png 
test2.png PNG 248x247 248x247+0+0 8-bit sRGB 92397B 0.000u 0:00.000

eog test.png #プレビュー
eog test2.png #プレビュー

```

- CMD

```
composite -compose over test.png test2.png done.png #test2.pngが背景画像 test.pngが前景画像

```

- OUT

  - 出力画像サイズは引数で与えられた画像のうち背景画像の方に寄せられる
```
$ identify done.png 
done.png PNG 248x247 248x247+0+0 8-bit sRGB 112225B 0.000u 0:00.000

eog done.png #プレビュー
```


- CMD

```
composite -compose over test2.png test.png done.png #test.pngが背景画像 test2.pngが前景画像
```


- OUT
  - 出力画像サイズは引数で与えられた画像のうち背景画像の方に寄せられる

```
$ identify done.png 
done.png PNG 515x739 515x739+0+0 8-bit sRGB 585920B 0.000u 0:00.000
```

- REF

  - https://imagemagick.biz/archives/39