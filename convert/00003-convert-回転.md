- IN

```
curl -o test3.png -fsSL https://www.pngonly.com/wp-content/uploads/2017/06/Transformers-Megatron-PNG-Image.png

$identify test3.png
test3.png PNG 1387x794 1387x794+0+0 8-bit sRGB 930162B 0.000u 0:00.000


$ eog test3.png

```


- CMD

  - 時計回りに45度回転

```
convert test3.png -rotate +45 done.png
```


- OUT

```
eog done.png
```


- CMD

  - 反時計回りに45度回転

```
convert test3.png -rotate -45 done.png
```


- OUT

```
eog done.png
```


- CMD

  - 時計回りに45度ずつ回転させた画像ファイルを作成

```
$ for i in {0..360..45};do echo "convert test3.png -rotate $i done-clock-$(printf "%03d" $i).png";done
convert test3.png -rotate 0 done-clock-000.png
convert test3.png -rotate 45 done-clock-045.png
convert test3.png -rotate 90 done-clock-090.png
convert test3.png -rotate 135 done-clock-135.png
convert test3.png -rotate 180 done-clock-180.png
convert test3.png -rotate 225 done-clock-225.png
convert test3.png -rotate 270 done-clock-270.png
convert test3.png -rotate 315 done-clock-315.png
convert test3.png -rotate 360 done-clock-360.png
```


- OUT

プレビューで回転する様子が確認できる

```
ls *png | grep clock | xargs eog
```



- CMD

  - 反時計回りに45度ずつ回転させた画像ファイルを作成

```
$ for i in {-360..0..45};do echo "convert test3.png -rotate $i done-revclock-$(printf "%03d" $((i*-1))).png";done
convert test3.png -rotate -360 done-revclock-360.png
convert test3.png -rotate -315 done-revclock-315.png
convert test3.png -rotate -270 done-revclock-270.png
convert test3.png -rotate -225 done-revclock-225.png
convert test3.png -rotate -180 done-revclock-180.png
convert test3.png -rotate -135 done-revclock-135.png
convert test3.png -rotate -90 done-revclock-090.png
convert test3.png -rotate -45 done-revclock-045.png
convert test3.png -rotate 0 done-revclock-000.png
```


- OUT

プレビューで回転する様子が確認できる

```
ls *png | grep revclock | xargs eog
```


