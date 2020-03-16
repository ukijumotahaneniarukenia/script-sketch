pythonのリスト操作
https://www.yoheim.net/blog.php?q=20150801

https://docs.python.org/ja/3/tutorial/datastructures.html

itertoolsの利用
https://docs.python.org/ja/3/library/itertools.html#itertools-recipes

順序と組み合わせの実装
https://www.haya-programming.com/entry/2018/04/14/185828

https://qiita.com/jyori112/items/a15658d1dd17c421e1e2

https://qiita.com/osanshouo/items/5dfc4e602f36845f7c87

map,reduce,filterのjavaの実装例
http://web.mit.edu/6.005/www/sp16/classes/25-map-filter-reduce/

サンプルが豊富
https://qiita.com/Namibillow/items/954c7f9f53682d6dd9c9

# データフレーム可視化
https://dividable.net/programming/python-pandas/

# 日付操作
https://note.nkmk.me/python-pandas-datetime-timestamp/
http://ailaby.com/date_range/
https://note.nkmk.me/python-datetime-now-today/

# データフレームに変換する
https://yolo.love/pandas/tolist/

# 行連結
http://sinhrks.hatenablog.com/entry/2015/01/28/073327

# 一行単位の関数を作成する。

# これだたぶん
https://teratail.com/questions/133840
https://teratail.com/questions/134846

# 表整形
http://sinhrks.hatenablog.com/entry/2014/10/13/005327

# ダイナミック
http://sinhrks.hatenablog.com/entry/2014/10/13/005327

# なんとかごとに番号ふる
https://teratail.com/questions/123639

# 計測
https://note.nkmk.me/python-timeit-measure/

# listagg
複数列のグルーピング操作
https://qiita.com/simonritchie/items/dd737a52cf32b662675c
https://stackoverflow.com/questions/22219004/grouping-rows-in-list-in-pandas-groupby
https://qiita.com/airtoxin/items/d66a22c5c7074e23be17#2-13
https://www.haya-programming.com/entry/2018/09/05/172403

pandas
https://qiita.com/ysdyt/items/9ccca82fc5b504e7913a

超きになるやつみつけた
df.to_sql(
```

# pandasいんすこ
```
pip install pandas | tee log

```

# 標準入力読み取り
https://www.lifewithpython.com/2014/05/python-get-stdin-standard-input.html

```
$seq 10 | python -c 'import sys;stdin=sys.stdin.readline();print(stdin);print(type(stdin));'
1

<class 'str'>
$seq 10 | python -c 'import sys;stdin=sys.stdin.read();print(stdin);print(type(stdin));'
1
2
3
4
5
6
7
8
9
10

<class 'str'>
$seq 10 | python -c 'import sys;stdin=sys.stdin.readline();print(stdin);print(type(stdin));'
1

<class 'str'>
$seq 10 | python -c 'import sys;stdin=sys.stdin.readlines();print(stdin);print(type(stdin));'
['1\n', '2\n', '3\n', '4\n', '5\n', '6\n', '7\n', '8\n', '9\n', '10\n']
<class 'list'>

```

range関数
https://note.nkmk.me/python-range-usage/

ユニコード

https://python.civic-apps.com/char-ord/

シングルクォートとダブルクォートのちがい
https://note.nkmk.me/python-str-literal-constructor/

文字列操作
https://note.nkmk.me/python-format-zero-hex/
$pip install termcolor


[pythonの内包表記を少し詳しく](https://qiita.com/y__sama/items/a2c458de97c4aa5a98e7)</ br>
[Python文字列操作マスター](https://qiita.com/tomotaka_ito/items/594ee1396cf982ba9887)</br>
[Pythonでリスト（配列）から重複した要素を削除・抽出](https://note.nkmk.me/python-list-unique-duplicate/) </ br>
[Python - 関数を文字列から動的に呼び出す](https://qiita.com/Chanmoro/items/9b0105e4c18bb76ed4e9)</ br>

これは非常にさんこうになる
[2つの辞書型を比較して差分を抽出したい（python）](https://teratail.com/questions/171217)

これも非常に
[Python 3でのファイルのimportのしかたまとめ](https://qiita.com/karadaharu/items/37403e6e82ae4417d1b3)

これも非常にめにやさしい
[【Python】出力に色をつける](https://kazusa-pg.com/python-termcolor/)
