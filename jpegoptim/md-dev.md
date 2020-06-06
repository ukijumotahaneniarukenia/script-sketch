- https://morizyun.github.io/infrastructure/tool-optimize-jpeg-png.html


jpegは大きいな。。。

iphoneからgithubに写真をアップロードできる。

```



$ ls -lh
total 3.1M
-rw-r--r--. 1 kuraine kuraine 3.1M  6月  7 01:56 B7FA5FB4-DCA3-4D10-9D2A-50F7C59625A2.jpeg
-rw-r--r--. 1 kuraine kuraine  392  6月  7 01:53 md-dev.md


$ sudo apt install -y jpegoptim


$ jpegoptim --strip-all B7FA5FB4-DCA3-4D10-9D2A-50F7C59625A2.jpeg
B7FA5FB4-DCA3-4D10-9D2A-50F7C59625A2.jpeg 4032x3024 24bit N Exif  [OK] 3199590 --> 3158708 bytes (1.28%), optimized.


$ ls -lh
total 3.1M
-rw-r--r--. 1 kuraine kuraine 3.1M  6月  7 01:59 B7FA5FB4-DCA3-4D10-9D2A-50F7C59625A2.jpeg
-rw-r--r--. 1 kuraine kuraine  392  6月  7 01:53 md-dev.md


```
