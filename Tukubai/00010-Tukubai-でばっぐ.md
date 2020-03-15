- CMD

```
$time ./00004-Tukubai-ダミーデータの作成.sh 10000000
+ day=20140101
+ range=365
+ len=32
+ nn=10000000
+ shift
+ cat
+ cat tbl-def
+ juni
+ read id tag typ len
+ '[' num = num ']'
+ bash 00001-Tukubai-数値型データの作成.sh 5 10000000 商品コード
+ read id tag typ len
+ '[' num = num ']'
+ bash 00001-Tukubai-数値型データの作成.sh 3 10000000 原価
+ read id tag typ len
+ '[' num = num ']'
+ bash 00001-Tukubai-数値型データの作成.sh 3 10000000 売価
+ read id tag typ len
+ '[' str = num ']'
+ '[' str = str ']'
+ bash 00002-Tukubai-文字列型データの作成.sh 10 10000000 商品名
+ read id tag typ len
+ '[' yyyymmdd = num ']'
+ '[' yyyymmdd = str ']'
+ '[' yyyymmdd = yyyymmdd ']'
+ bash 00003-Tukubai-日付型データの作成.sh 20140101 365 10000000 更新日
+ read id tag typ len
+ paste '-d ' done-dtm-更新日 done-num-原価 done-num-商品コード done-num-売価 done-str-商品名
+ rm -rf done-dtm-更新日 done-num-原価 done-num-商品コード done-num-売価 done-str-商品名
+ exit 0

real	0m2.550s
user	0m5.086s
sys	0m0.774s
```
