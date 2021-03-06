# 参考文献

https://qiita.com/dcm_shiramizu/items/881f9faf6c515c621308

# フォルダ構成

```
$cd ~/script_scratch/R/20000_辞書構築
$ll
total 954248
-rw-rw-r--. 1 rstudio rstudio         0  1月 26 22:29 20001-sqlite3とpython374を使って辞書構築.py
-rw-rw-r--. 1 rstudio rstudio 415233411  1月 26 21:48 jawiki-latest-page.sql
-rw-rw-r--. 1 rstudio rstudio  35611668  1月 26 21:43 jawiki-latest-redirect.sql
-rw-r--r--. 1 rstudio rstudio 526290944  1月 26 22:14 pages.db
```

# バージョン確認

```
$python3 --version
Python 3.7.4

$sqlite3 --version
-- Loading resources from /home/rstudio/.sqliterc
3.30.0 2019-10-04 15:03:17 c20a35336432025445f9f7e289d0cc3e4003fb17f45a4ce74c6269c407c6e09f
```

# mysql2sqliteコマンドのインストール

```
$cd /usr/local/src
$git clone https://github.com/dumblob/mysql2sqlite.git
$cd mysql2sqlite
$mv mysql2sqlite ../../bin/
```

# 辞書データダウンロード

```
$cd /usr/local/src
$curl -LO https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-page.sql.gz
$curl -LO https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-redirect.sql.gz
$gunzip jawiki-latest-page.sql.gz
$gunzip jawiki-latest-redirect.sql.gz
```

# データベース作成

- rootユーザーで実行

```
$cd /usr/local/src
$mysql2sqlite jawiki-latest-page.sql | sqlite3 pages.db
$mysql2sqlite jawiki-latest-redirect.sql | sqlite3 pages.db
$mv /usr/local/src/pages.db ~/script-sketch/python/
$chown -R kuraine:kuraine pages.db
```

# テーブル構成確認

```
$cd ~/script-sketch/python/
$sqlite3 pages.db
-- Loading resources from /home/rstudio/.sqliterc
SQLite version 3.30.0 2019-10-04 15:03:17
Enter ".help" for usage hints.
sqlite>>>.schema
CREATE TABLE `page` (
  `page_id` integer  NOT NULL PRIMARY KEY AUTOINCREMENT
,  `page_namespace` integer NOT NULL DEFAULT '0'
,  `page_title` varbinary(255) NOT NULL DEFAULT ''
,  `page_restrictions` varbinary(255) NOT NULL DEFAULT ''
,  `page_is_redirect` integer  NOT NULL DEFAULT '0'
,  `page_is_new` integer  NOT NULL DEFAULT '0'
,  `page_random` double  NOT NULL DEFAULT '0'
,  `page_touched` varbinary(14) NOT NULL DEFAULT ''
,  `page_links_updated` varbinary(14) DEFAULT NULL
,  `page_latest` integer  NOT NULL DEFAULT '0'
,  `page_len` integer  NOT NULL DEFAULT '0'
,  `page_content_model` varbinary(32) DEFAULT NULL
,  `page_lang` varbinary(35) DEFAULT NULL
,  UNIQUE (`page_namespace`,`page_title`)
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE INDEX "idx_page_page_random" ON "page" (`page_random`);
CREATE INDEX "idx_page_page_len" ON "page" (`page_len`);
CREATE INDEX "idx_page_page_redirect_namespace_len" ON "page" (`page_is_redirect`,`page_namespace`,`page_len`);
CREATE TABLE `redirect` (
  `rd_from` integer  NOT NULL DEFAULT '0'
,  `rd_namespace` integer NOT NULL DEFAULT '0'
,  `rd_title` varbinary(255) NOT NULL DEFAULT ''
,  `rd_interwiki` varbinary(32) DEFAULT NULL
,  `rd_fragment` varbinary(255) DEFAULT NULL
,  PRIMARY KEY (`rd_from`)
);
CREATE INDEX "idx_redirect_rd_ns_title" ON "redirect" (`rd_namespace`,`rd_title`,`rd_from`);
```

# クエリ単体実行

```
$cd ~/script-sketch/python/
$sqlite3 pages.db <20001-sqlite3とpython3を使って辞書構築.sql | less
```


# 後処理

```
$sqlite3 pages.db <20001-sqlite3とpython3を使って辞書構築.sql >test-big.csv
$sed -i -r 's/"//g;s/,/\t/g' test-big.tsv
$mv test-big.csv test-big.tsv
```
