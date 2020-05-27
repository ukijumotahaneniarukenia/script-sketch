バージョン

```
$ java -version
openjdk version "11" 2018-09-25
OpenJDK Runtime Environment 18.9 (build 11+28)
OpenJDK 64-Bit Server VM 18.9 (build 11+28, mixed mode)
```

実行可能なjarをダウンロード

```
$ curl -fsSLO https://ftp.tsukuba.wide.ad.jp/software/apache/pdfbox/2.0.19/pdfbox-app-2.0.19.jar
```

検証PDFダウンロード

```
$ wget http://www.mhlw.go.jp/wp/hakusyo/kousei/17/dl/all.pdf -O test.pdf
```

実行
```
$ java -jar pdfbox-app-2.0.19.jar ExtractText test.pdf
```

結果


きれいに抜き出せている

```
$ head test.txt
平成29年版
厚生労働白書
（平成28年度厚生労働行政年次報告）
厚 生 労 働 省
―社会保障と経済成長―
本白書は再生紙を使用しております。
第1部　社会保障と経済成長
はじめに………………………………………………………………………… 3
第1章　我が国経済社会の中の社会保障… ………………………………… 4
第1節　社会保障の役割と機能… …………………………………………………………………… 4

$ tail test.txt
● 一人当たりだと ………… 879.7円
育児について
▶ 6歳未満の子どもをもつ親が
育児、家事に費やす時間は？
   1時間　7分＊1
 妻 7時間41分
▶ 児童虐待の相談対応件数は？
 282件
＊1 ： 日本の男性が家事・育児をする時間は先進諸国の中 
でも最低水準です。
```

```
$java -jar pdfbox-app-2.0.19.jar --help
PDFBox version: "2.0.19"
Usage: java -jar pdfbox-app-x.y.z.jar <command> <args..>

Possible commands are:
  Decrypt
  Encrypt
  ExtractText
  ExtractImages
  OverlayPDF
  PrintPDF
  PDFDebugger
  PDFMerger
  PDFReader
  PDFSplit
  PDFToImage
  TextToPDF
  WriteDecodedDoc


```
