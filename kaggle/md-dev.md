- ipynbファイルを目次込みでワンzipに梱包する手順

```
File -> Download As html with toc

$HOME/Download/にzipファイルが作成される (firefoxの場合)


ホスティングするディレクトリにzipファイルを移動させる


ホスティングするディレクトリに移動する


zipファイルを展開する


ブラウザに展開後に出力されたhtmlファイルを引数に与えて起動する
```


```
cd $HOME/Download/

mv main.zip $HOME/script-sketch/kaggle/P00001-kaggle-タイタニックを例に手番の整理

unzip main.zip

$ls -l
total 1.6M
drwxr-xr-x 3 kuraine kuraine 4.0K  7月 17 16:47 ./
drwxr-xr-x 4 kuraine kuraine 4.0K  7月 17 16:47 ../
-rw-r--r-- 1 kuraine kuraine   22  7月 17 05:18 .gitignore
drwxr-xr-x 2 kuraine kuraine 4.0K  7月 17 05:26 .ipynb_checkpoints/
-rw------- 1 kuraine kuraine 435K  7月 17 16:38 main.html
-rw-r--r-- 1 kuraine kuraine 474K  7月 17 16:38 main.ipynb
-rw-r--r-- 1 kuraine kuraine 305K  7月 17 16:38 main.zip
-rw------- 1 kuraine kuraine  16K  7月 17 16:38 output_112_1.png
-rw------- 1 kuraine kuraine  12K  7月 17 16:38 output_48_1.png
-rw------- 1 kuraine kuraine 227K  7月 17 16:38 output_53_1.png
-rw------- 1 kuraine kuraine 9.2K  7月 17 16:38 output_60_1.png
-rw-r--r-- 1 kuraine kuraine  28K  7月 16 21:08 test.csv
-rw-r--r-- 1 kuraine kuraine  60K  7月 16 20:15 train.csv

$ firefox main.html
```
