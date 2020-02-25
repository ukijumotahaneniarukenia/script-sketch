# 所感

  - エクスポートする際に、ヘッダ行を付与すること。

  - インポートする際には、ヘッダ行を除くことにする。

  - 複数テーブル対応

# エクスポート

- データベース単位

ダンプ
```
$pg_dump testdb>testdb_$(date "+%Y_%m_%d").dmp
```

確認
```
$ls -lh testdb_2020_02_25.dmp
```

- 単一テーブル単位

  - CSV

エクスポート
```
$psql -U postgres -d testdb -c "COPY test_tbl TO '/home/postgres/test_tbl_$(date "+%Y_%m_%d").csv' WITH CSV HEADER DELIMITER ',';"
```

確認
```
$ls -lh test_tbl_2020_02_25.csv
-rw-r--r--. 1 postgres postgres 345  2月 25 22:06 test_tbl_2020_02_25.csv

$cat test_tbl_2020_02_25.csv
col1,col2,col3
lnUtSwxQKx,IfeJEsXojL,GvwEiZV/4Q
6le8BjNHeY,v/gUuQ9gNS,Fe7J3AJHd/
183DtWzbrl,2eTlyVn/m8,oPFMrx9N5O
Q6yA5jf43j,uChRx7u+ae,AmlQHQzhEX
lxgvq/awYh,ZZ700tw01d,xGwmw15nA+
7e09o5HBbn,4wEv/ooq97,lm2lrAs8Gm
tn7/SQ4mH/,on9X7O3MWG,RnWKFkDmme
L+LN93LayS,NTFxZjcAo2,ZIFba/k01g
H/nxTeowEV,dG9e7rAdPd,pUrqmehQgn
3ZZp1pLVaO,2fSYBbEx90,/kk9+ZfmL0
```

  - TSV

エクスポート
```
$psql -U postgres -d testdb -c "COPY test_tbl TO '/home/postgres/test_tbl_$(date "+%Y_%m_%d").tsv' WITH CSV HEADER DELIMITER E'\t';"
```


確認
```
$ls -lh test_tbl_2020_02_25.tsv
-rw-r--r--. 1 postgres postgres 345  2月 25 22:08 test_tbl_2020_02_25.tsv

$cat test_tbl_2020_02_25.tsv
col1	col2	col3
lnUtSwxQKx	IfeJEsXojL	GvwEiZV/4Q
6le8BjNHeY	v/gUuQ9gNS	Fe7J3AJHd/
183DtWzbrl	2eTlyVn/m8	oPFMrx9N5O
Q6yA5jf43j	uChRx7u+ae	AmlQHQzhEX
lxgvq/awYh	ZZ700tw01d	xGwmw15nA+
7e09o5HBbn	4wEv/ooq97	lm2lrAs8Gm
tn7/SQ4mH/	on9X7O3MWG	RnWKFkDmme
L+LN93LayS	NTFxZjcAo2	ZIFba/k01g
H/nxTeowEV	dG9e7rAdPd	pUrqmehQgn
3ZZp1pLVaO	2fSYBbEx90	/kk9+ZfmL0
```

# インポート

- データベース単位

データベース作成
```
$psql -U postgres -c "create database testdb"
```

リストア
```
$psql testdb < testdb_2020_02_25.dmp
```


- 単一テーブル単位

  - CSV（ヘッダ行なし）

ファイル作成
```
$echo "cat /dev/urandom | base64 -w0 | fold -w 10 | paste -d',' $(seq 3 | xargs -I@ echo - | xargs) | head -n10" | sh | perl -pe 's/\x22|\x27//g'>test.csv
```

テーブル削除
```
$psql -U postgres -d testdb -c "drop table test_tbl;"
```

テーブル作成
```
$psql -U postgres -d testdb -c "create table test_tbl (col1 text,col2 text,col3 text);"
CREATE TABLE
```

インポート
```
$psql -U postgres -d testdb -c "\copy test_tbl from 'test.csv' with csv;"
COPY 10
```

確認
```
$psql -U postgres -d testdb
psql (12.0)
Type "help" for help.

testdb=# select * from test_tbl;
    col1    |    col2    |    col3
------------+------------+------------
 8y4fXRv06g | SEffEMws/f | BXbAYQMB27
 ArLIy3Doyu | j+2Nxl0bfV | JjrmSNFu6O
 KuVDNd0qfX | L1d6hMK9Yr | Ly3XsEeeBg
 9sacpwN6+i | 4sTdhbhd0F | QKikTabOD1
 dNx6E/C29N | dLI58tRwF3 | 2LxsnnktoH
 clRT6FtJ5n | rOwpFANYCk | 7Bq2lt5k4p
 1PHalHaydQ | bgCqsVuc0R | E8gt0oKgFy
 sKdLyH+nZf | weQ6o3quEm | OTuJsETKWt
 aDVL6NdCgk | z/QJ8xukm3 | XhSETWL0mV
 4yLc4TBH7S | 3wS4CSCMgx | +seH3ST3pR
(10 rows)
```

  - TSV（ヘッダ行なし）


ファイル作成
```
$echo "cat /dev/urandom | base64 -w0 | fold -w 10 | paste -d'\t' $(seq 3 | xargs -I@ echo - | xargs) | head -n10" | sh | perl -pe 's/\x22|\x27//g'>test.tsv
```

テーブル削除
```
$psql -U postgres -d testdb -c "drop table test_tbl;"
```

テーブル作成
```
$psql -U postgres -d testdb -c "create table test_tbl (col1 text,col2 text,col3 text);"
```

インポート

```
$psql -U postgres -d testdb -c "\copy test_tbl from 'test.tsv'"
```


確認

```
$psql -U postgres -d testdb
psql (12.0)
Type "help" for help.

testdb=# select * from test_tbl;
    col1    |    col2    |    col3
------------+------------+------------
 lnUtSwxQKx | IfeJEsXojL | GvwEiZV/4Q
 6le8BjNHeY | v/gUuQ9gNS | Fe7J3AJHd/
 183DtWzbrl | 2eTlyVn/m8 | oPFMrx9N5O
 Q6yA5jf43j | uChRx7u+ae | AmlQHQzhEX
 lxgvq/awYh | ZZ700tw01d | xGwmw15nA+
 7e09o5HBbn | 4wEv/ooq97 | lm2lrAs8Gm
 tn7/SQ4mH/ | on9X7O3MWG | RnWKFkDmme
 L+LN93LayS | NTFxZjcAo2 | ZIFba/k01g
 H/nxTeowEV | dG9e7rAdPd | pUrqmehQgn
 3ZZp1pLVaO | 2fSYBbEx90 | /kk9+ZfmL0
(10 rows)
```
