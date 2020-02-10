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
便利
http://web.mit.edu/6.005/www/sp16/classes/25-map-filter-reduce/

サンプルが豊富

https://qiita.com/Namibillow/items/954c7f9f53682d6dd9c9

Pythonのメタデータをpostgresに投入するまでのプロセス。

パッケージ📦名に紐付くアトリビュートと振る舞いをパッケージごとに
レコード化。横持ちにする際には、データフレームであることをチェックして、
pandasのメソッドで結合。
パッケージごとにアトリビュートと振る舞いを横結合した後、
データフレームを縦結合していき、ヘッダ名がパッケージ名、アトリビュート名、振る舞いにした
データフレームを作成する。作成したデータフレームをPostgresに正規化化して、
明細展開したテーブルを作成する。

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
```

```

# pandas
https://qiita.com/ysdyt/items/9ccca82fc5b504e7913a

超きになるやつみつけた
df.to_sql(

```
[root♥25e14fb5c939 (月 10月 14 09:57:14) /home/postgres/script_scratch/python]$python
Python 3.7.4 (default, Oct 12 2019, 21:53:21) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-39)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import pandas as pd
>>> df = pd.DataFrame({"A":[c for _ in range(5) for c in ["a", "b"]], "B":range(10)})
>>> df
   A  B
0  a  0
1  b  1
2  a  2
3  b  3
4  a  4
5  b  5
6  a  6
7  b  7
8  a  8
9  b  9
>>> df./usr/local/lib/python3.7/rlcompleter.py:173: FutureWarning: Attribute 'is_copy' is deprecated and will be removed in a future version.
  val = getattr(thisobject, word)
/usr/local/lib/python3.7/rlcompleter.py:173: FutureWarning: 
.ix is deprecated. Please use
.loc for label based indexing or
.iloc for positional indexing

See the documentation here:
http://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html#ix-indexer-is-deprecated
  val = getattr(thisobject, word)
/usr/local/lib/python3.7/rlcompleter.py:173: FutureWarning: DataFrame.ftypes is deprecated and will be removed in a future version. Use DataFrame.dtypes instead.
  val = getattr(thisobject, word)
/usr/local/lib/python3.7/site-packages/pandas/core/generic.py:5728: FutureWarning: as_blocks is deprecated and will be removed in a future version
  return self.as_blocks()

Display all 222 possibilities? (y or n)
df.A                   df.bfill(              df.drop(               df.get_dtype_counts(   df.ix(                 df.ne(                 df.replace(            df.squeeze(            df.to_period(
df.B                   df.blocks              df.drop_duplicates(    df.get_ftype_counts(   df.join(               df.nlargest(           df.resample(           df.stack(              df.to_pickle(
df.T                   df.bool(               df.droplevel(          df.get_value(          df.keys(               df.notna(              df.reset_index(        df.std(                df.to_records(
df.abs(                df.boxplot(            df.dropna(             df.get_values(         df.kurt(               df.notnull(            df.rfloordiv(          df.style               df.to_sparse(
df.add(                df.clip(               df.dtypes              df.groupby(            df.kurtosis(           df.nsmallest(          df.rmod(               df.sub(                df.to_sql(
df.add_prefix(         df.clip_lower(         df.duplicated(         df.gt(                 df.last(               df.nunique(            df.rmul(               df.subtract(           df.to_stata(
df.add_suffix(         df.clip_upper(         df.empty               df.head(               df.last_valid_index(   df.pct_change(         df.rolling(            df.sum(                df.to_string(
df.agg(                df.columns             df.eq(                 df.hist(               df.le(                 df.pipe(               df.round(              df.swapaxes(           df.to_timestamp(
df.aggregate(          df.combine(            df.equals(             df.iat(                df.loc(                df.pivot(              df.rpow(               df.swaplevel(          df.to_xarray(
df.align(              df.combine_first(      df.eval(               df.idxmax(             df.lookup(             df.pivot_table(        df.rsub(               df.tail(               df.transform(
df.all(                df.compound(           df.ewm(                df.idxmin(             df.lt(                 df.plot(               df.rtruediv(           df.take(               df.transpose(
df.any(                df.copy(               df.expanding(          df.iloc(               df.mad(                df.pop(                df.sample(             df.to_clipboard(       df.truediv(
df.append(             df.corr(               df.explode(            df.index               df.mask(               df.pow(                df.select_dtypes(      df.to_csv(             df.truncate(
df.apply(              df.corrwith(           df.ffill(              df.infer_objects(      df.max(                df.prod(               df.sem(                df.to_dense(           df.tshift(
df.applymap(           df.count(              df.fillna(             df.info(               df.mean(               df.product(            df.set_axis(           df.to_dict(            df.tz_convert(
df.as_blocks(          df.cov(                df.filter(             df.insert(             df.median(             df.quantile(           df.set_index(          df.to_excel(           df.tz_localize(
df.as_matrix(          df.cummax(             df.first(              df.interpolate(        df.melt(               df.query(              df.set_value(          df.to_feather(         df.unstack(
df.asfreq(             df.cummin(             df.first_valid_index(  df.is_copy             df.memory_usage(       df.radd(               df.shape               df.to_gbq(             df.update(
df.asof(               df.cumprod(            df.floordiv(           df.isin(               df.merge(              df.rank(               df.shift(              df.to_hdf(             df.values
df.assign(             df.cumsum(             df.from_dict(          df.isna(               df.min(                df.rdiv(               df.size                df.to_html(            df.var(
df.astype(             df.describe(           df.from_items(         df.isnull(             df.mod(                df.reindex(            df.skew(               df.to_json(            df.where(
df.at(                 df.diff(               df.from_records(       df.items(              df.mode(               df.reindex_like(       df.slice_shift(        df.to_latex(           df.xs(
df.at_time(            df.div(                df.ftypes              df.iteritems(          df.mul(                df.rename(             df.sort_index(         df.to_msgpack(         
df.axes                df.divide(             df.ge(                 df.iterrows(           df.multiply(           df.rename_axis(        df.sort_values(        df.to_numpy(           
df.between_time(       df.dot(                df.get(                df.itertuples(         df.ndim                df.reorder_levels(     df.sparse              df.to_parquet(         
```

# pandasいんすこ
```
[postgres💟25e14fb5c939 (月 10月 14 09:55:59) ~/script_scratch/python]$su root
Password: 
[root♥25e14fb5c939 (月 10月 14 09:56:08) /home/postgres/script_scratch/python]$find / -name "*pandas*"
[root♥25e14fb5c939 (月 10月 14 09:56:33) /home/postgres/script_scratch/python]$find / -name "*pandas*" 2>/dev/null
[root♥25e14fb5c939 (月 10月 14 09:56:42) /home/postgres/script_scratch/python]$pip install pandas | tee log
Collecting pandas
  Downloading https://files.pythonhosted.org/packages/7e/ab/ea76361f9d3e732e114adcd801d2820d5319c23d0ac5482fa3b412db217e/pandas-0.25.1-cp37-cp37m-manylinux1_x86_64.whl (10.4MB)
Collecting numpy>=1.13.3 (from pandas)
  Downloading https://files.pythonhosted.org/packages/ba/e0/46e2f0540370f2661b044647fa447fef2ecbcc8f7cdb4329ca2feb03fb23/numpy-1.17.2-cp37-cp37m-manylinux1_x86_64.whl (20.3MB)
Collecting pytz>=2017.2 (from pandas)
  Downloading https://files.pythonhosted.org/packages/e7/f9/f0b53f88060247251bf481fa6ea62cd0d25bf1b11a87888e53ce5b7c8ad2/pytz-2019.3-py2.py3-none-any.whl (509kB)
Collecting python-dateutil>=2.6.1 (from pandas)
  Downloading https://files.pythonhosted.org/packages/41/17/c62faccbfbd163c7f57f3844689e3a78bae1f403648a6afb1d0866d87fbb/python_dateutil-2.8.0-py2.py3-none-any.whl (226kB)
Collecting six>=1.5 (from python-dateutil>=2.6.1->pandas)
  Downloading https://files.pythonhosted.org/packages/73/fb/00a976f728d0d1fecfe898238ce23f502a721c0ac0ecfedb80e0d88c64e9/six-1.12.0-py2.py3-none-any.whl
Installing collected packages: numpy, pytz, six, python-dateutil, pandas
Successfully installed numpy-1.17.2 pandas-0.25.1 python-dateutil-2.8.0 pytz-2019.3 six-1.12.0
You are using pip version 19.0.3, however version 19.2.3 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
[root♥25e14fb5c939 (月 10月 14 09:57:02) /home/postgres/script_scratch/python]$cat log
Collecting pandas
  Downloading https://files.pythonhosted.org/packages/7e/ab/ea76361f9d3e732e114adcd801d2820d5319c23d0ac5482fa3b412db217e/pandas-0.25.1-cp37-cp37m-manylinux1_x86_64.whl (10.4MB)
Collecting numpy>=1.13.3 (from pandas)
  Downloading https://files.pythonhosted.org/packages/ba/e0/46e2f0540370f2661b044647fa447fef2ecbcc8f7cdb4329ca2feb03fb23/numpy-1.17.2-cp37-cp37m-manylinux1_x86_64.whl (20.3MB)
Collecting pytz>=2017.2 (from pandas)
  Downloading https://files.pythonhosted.org/packages/e7/f9/f0b53f88060247251bf481fa6ea62cd0d25bf1b11a87888e53ce5b7c8ad2/pytz-2019.3-py2.py3-none-any.whl (509kB)
Collecting python-dateutil>=2.6.1 (from pandas)
  Downloading https://files.pythonhosted.org/packages/41/17/c62faccbfbd163c7f57f3844689e3a78bae1f403648a6afb1d0866d87fbb/python_dateutil-2.8.0-py2.py3-none-any.whl (226kB)
Collecting six>=1.5 (from python-dateutil>=2.6.1->pandas)
  Downloading https://files.pythonhosted.org/packages/73/fb/00a976f728d0d1fecfe898238ce23f502a721c0ac0ecfedb80e0d88c64e9/six-1.12.0-py2.py3-none-any.whl
Installing collected packages: numpy, pytz, six, python-dateutil, pandas
Successfully installed numpy-1.17.2 pandas-0.25.1 python-dateutil-2.8.0 pytz-2019.3 six-1.12.0
[root♥25e14fb5c939 (月 10月 14 09:57:11) /home/postgres/script_scratch/python]$find / -name "*pandas*" 2>/dev/null
/usr/local/lib/python3.7/site-packages/pandas-0.25.1.dist-info
/usr/local/lib/python3.7/site-packages/pandas
/usr/local/lib/python3.7/site-packages/pandas/tests/io/json/test_pandas.py
/usr/local/lib/python3.7/site-packages/pandas/tests/io/json/__pycache__/test_pandas.cpython-37.pyc
```

# 標準入力からの標準出力 via python
```
[postgres💟25e14fb5c939 (月 10月 14 09:51:37) ~/script_scratch/python]$seq 10 | python -c 'import sys;stdin=sys.stdin.read();print(stdin,end="");' | xargs
1 2 3 4 5 6 7 8 9 10
[postgres💟25e14fb5c939 (月 10月 14 09:54:32) ~/script_scratch/python]$seq 1 | python -c 'import sys;stdin=sys.stdin.read();print(stdin,end="");' | xargs
1
```


# python開業なし出力
```
[postgres💟25e14fb5c939 (月 10月 14 09:50:52) ~/script_scratch/python]$seq 10 | python -c 'import sys;stdin=sys.stdin.read();print(stdin);'
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

[postgres💟25e14fb5c939 (月 10月 14 09:51:02) ~/script_scratch/python]$seq 10 | python -c 'import sys;stdin=sys.stdin.read();print(stdin,end="");'
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
```

# ダイナミック実行手前
```
[postgres💟25e14fb5c939 (月 10月 14 09:39:46) ~/script_scratch/python]python
Python 3.7.4 (default, Oct 12 2019, 21:53:21) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-39)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> cmd='print(type(list(reversed(range(3, 10, 2)))))'
>>> eval(cmd)
<class 'list'>
>>> cmd='print(list(reversed(range(3, 10, 2))))'
>>> eval(cmd)
[9, 7, 5, 3]
>>> 

```

# 標準入力読み取り
https://www.lifewithpython.com/2014/05/python-get-stdin-standard-input.html

```
[postgres💟25e14fb5c939 (月 10月 14 09:38:30) ~/script_scratch/python]$seq 10 | python -c 'import sys;stdin=sys.stdin.readline();print(stdin);print(type(stdin));'
1

<class 'str'>
[postgres💟25e14fb5c939 (月 10月 14 09:39:30) ~/script_scratch/python]$seq 10 | python -c 'import sys;stdin=sys.stdin.read();print(stdin);print(type(stdin));'
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
[postgres💟25e14fb5c939 (月 10月 14 09:39:36) ~/script_scratch/python]$seq 10 | python -c 'import sys;stdin=sys.stdin.readline();print(stdin);print(type(stdin));'
1

<class 'str'>
[postgres💟25e14fb5c939 (月 10月 14 09:39:40) ~/script_scratch/python]$seq 10 | python -c 'import sys;stdin=sys.stdin.readlines();print(stdin);print(type(stdin));'
['1\n', '2\n', '3\n', '4\n', '5\n', '6\n', '7\n', '8\n', '9\n', '10\n']
<class 'list'>

```

# range関数
https://note.nkmk.me/python-range-usage/

# ユニコード!

https://python.civic-apps.com/char-ord/

# シングルクォートとダブルクォートのちがい
https://note.nkmk.me/python-str-literal-constructor/

# 文字列操作大切
https://note.nkmk.me/python-format-zero-hex/

# pythonスクリプト色つける
```
[postgres💞25e14fb5c939 (日 10月 13 22:47:07) ~/script_scratch/python]$find / -name "*termcolor*" 2>/dev/null
[postgres💟25e14fb5c939 (日 10月 13 22:50:30) ~/script_scratch/python]$su root
Password: 
[root♥25e14fb5c939 (日 10月 13 22:50:36) /home/postgres/script_scratch/python]$pip install termcolor
Collecting termcolor
  Downloading https://files.pythonhosted.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981/termcolor-1.1.0.tar.gz
Installing collected packages: termcolor
  Running setup.py install for termcolor ... done
Successfully installed termcolor-1.1.0
You are using pip version 19.0.3, however version 19.2.3 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.

[root♥25e14fb5c939 (日 10月 13 22:50:44) /home/postgres/script_scratch/python]$find / -name "*termcolor*" 2>/dev/null
/usr/local/lib/python3.7/site-packages/__pycache__/termcolor.cpython-37.pyc
/usr/local/lib/python3.7/site-packages/termcolor.py
/usr/local/lib/python3.7/site-packages/termcolor-1.1.0-py3.7.egg-info
```
実行例
```
[postgres💟25e14fb5c939 (日 10月 13 22:53:26) ~/script_scratch/python]$python my_msg.py
Warning
[postgres💟25e14fb5c939 (日 10月 13 22:53:30) ~/script_scratch/python]$cat my_msg.py
#!/usr/local/bin/python3.7

import termcolor

warning_sentence = termcolor.colored('Warning', 'red')
print(warning_sentence)
[postgres💟25e14fb5c939 (日 10月 13 22:53:34) ~/script_scratch/python]$python my_msg.py
Warning

```

# テスト実行方法
これをまねる

https://note.nkmk.me/python-bin-oct-hex-int-format/

```
[postgres💟25e14fb5c939 (日 10月 13 23:08:09) ~/script_scratch/python]$python vi /usr/local/src/Python-3.7.4/Lib/test/test_int_literal.py
/usr/local/bin/python3.7: can't open file 'vi': [Errno 2] No such file or directory
[postgres💟25e14fb5c939 (日 10月 13 23:08:12) ~/script_scratch/python]$python /usr/local/src/Python-3.7.4/Lib/test/test_int_literal.py
......
----------------------------------------------------------------------
Ran 6 tests in 0.001s

OK

```

# 参考文献

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

# 環境
```
[postgres💞25e14fb5c939 (日 10月 13 20:44:02) ~/script_scratch/python]$python
Python 3.7.4 (default, Oct 12 2019, 21:53:21) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-39)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> 

```

# pythonファイル実行

```
[postgres💞25e14fb5c939 (日 10月 13 20:38:59) ~]$ll
total 3324
-rw-r--r-- 1 root     root          58 10月 13 16:34 ARG_FILE
-rw-r--r-- 1 root     root          70 10月 13 16:33 CMD_FILE
-rw-r--r-- 1 root     root         386 10月 13 20:38 a.py
-rw-r--r-- 1 postgres postgres 2835456  5月 12 19:36 dvdrental.tar
-rw-r--r-- 1 postgres postgres  550906 10月 12 21:48 dvdrental.zip
[postgres💞25e14fb5c939 (日 10月 13 20:39:03) ~]$python a.py
[0, 6, 12]
[0, 5, 7, 10, 14]
[0, 2, 4, 6, 8, 10, 12, 14]
[0, 3, 6, 9, 12]
[0, 5, 10]
[0, 7, 14]
```

# pythonコマンドラインより実行

```
[postgres💞25e14fb5c939 (日 10月 13 20:37:00) ~]$python -c '\
liz=[x for x in range(15) if x%2==0 and x%3==0 ];\
lizz=[x for x in range(15) if x%5==0 or x%7==0 ];\
lizzz=[x for x in range(15) if x%2==0 ];\
lizzzz=[x for x in range(15) if x%3==0 ];\
lizzzzz=[x for x in range(15) if x%5==0 ];\
lizzzzzz=[x for x in range(15) if x%7==0 ];\
print(liz);
print(lizz);
print(lizzz);
print(lizzzz);
print(lizzzzz);
print(lizzzzzz);
'
[0, 6, 12]
[0, 5, 7, 10, 14]
[0, 2, 4, 6, 8, 10, 12, 14]
[0, 3, 6, 9, 12]
[0, 5, 10]
[0, 7, 14]
```

# dynamicぱい


```
[postgres💞25e14fb5c939 (日 10月 13 21:03:17) ~/script_scratch/python]$echo -e "def liz():\n  return[x for x in range(15) if x%2==0 and x%3==0 ];\nprint(liz());" | sed '1i#!/usr/local/bin/python3.7' >liz.py
[postgres💞25e14fb5c939 (日 10月 13 21:03:36) ~/script_scratch/python]ll
total 12
-rw-r--r-- 1 root     root      386 10月 13 20:38 a.py
-rw-rw-r-- 1 postgres postgres  106 10月 13 21:03 liz.py
-rw-r--r-- 1 root     root     1908 10月 13 20:50 manual.md
[postgres💞25e14fb5c939 (日 10月 13 21:03:37) ~/script_scratch/python]python liz.py
[0, 6, 12]
```

# dynamicぱい分解

```
[postgres💞25e14fb5c939 (日 10月 13 21:13:55) ~/script_scratch/python]$grep liz*= a.py | sed -E 's;(liz*)=(.*);echo -e "def \1():\\n  return\2\\nprint(\1())\;" > \1.py;' | bash
[postgres💞25e14fb5c939 (日 10月 13 21:15:41) ~/script_scratch/python]$ls liz* | xargs -I@ sed '1i#\!/usr/local/bin/python3.7\n' @
[postgres💞25e14fb5c939 (日 10月 13 21:19:54) ~/script_scratch/python]$ls liz* | xargs -I@ python @
[0, 6, 12]
[0, 5, 7, 10, 14]
[0, 2, 4, 6, 8, 10, 12, 14]
[0, 3, 6, 9, 12]
[0, 5, 10]
[0, 7, 14]
```
