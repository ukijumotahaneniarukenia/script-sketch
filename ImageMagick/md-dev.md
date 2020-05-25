- http://www.imagemagick.org/Usage/anim_basics/
```

yum install -y ImageMagick.x86_64


```


連続したgif画像

```
$ls -lh *png
-rw-rw-r--. 1 aine aine  84K  5月 25 21:08 01.png
-rw-rw-r--. 1 aine aine  91K  5月 25 21:08 02.png
-rw-rw-r--. 1 aine aine 100K  5月 25 21:08 03.png

0.4秒ごと

$convert -layers optimize -loop 0 -delay 40 *.png anim.gif

0.1秒ごと
$convert -layers optimize -loop 0 -delay 10 *.png anim2.gif

0.8秒ごと
$convert -layers optimize -loop 0 -delay 80 *.png anim3.gif

1.0秒ごと
$convert -layers optimize -loop 0 -delay 100 *.png anim4.gif

```
