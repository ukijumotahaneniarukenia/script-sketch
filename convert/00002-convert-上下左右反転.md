- IN

```
curl -o test3.png -fsSL https://www.pngonly.com/wp-content/uploads/2017/06/Transformers-Megatron-PNG-Image.png

$identify test3.png 
test3.png PNG 1387x794 1387x794+0+0 8-bit sRGB 930162B 0.000u 0:00.000


convert -resize 300x150 test3.png test3-resize-done.png

$identify test3-resize-done.png 
test3-resize-done.png PNG 262x150 262x150+0+0 8-bit sRGB 53075B 0.000u 0:00.000

$ eog test3-resize-done.png

```


- CMD

  - 上下反転

```
convert test3-resize-done.png -flip test3-resize-done-tac.png
```


- OUT

```
eog test3-resize-done-tac.png
```



- CMD

  - 左右反転

```
convert test3-resize-done.png -flop test3-resize-done-rev.png
```


- OUT

```
eog test3-resize-done-rev.png
```


- REF

  - https://imagemagick.biz/archives/213
