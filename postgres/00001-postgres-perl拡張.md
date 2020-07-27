安定している

|key|value|
|:-:|:-:|
|Host|localhost|
|Port|5432|
|Database|testdb|
|ユーザー名|postgres|
|パスワード|postgres_pwd|


# 参考文献

https://www.postgresql.jp/document/11/html/plperl-funcs.html</br>

# データ格納ディレクトリの作成

postgresユーザーで実行

```
$initdb -D ~/pgdat
```

# ポスグレプロセス起動

postgresユーザーで実行

```
$pg_ctl -D ~/pgdat -l ~/launch_postgres.log start
```

プロセス確認

```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
postgres     1  0.0  0.0  42688  1576 pts/0    Ss+  21:30   0:00 /usr/sbin/init
postgres 25115  0.0  0.0  14376  2056 pts/1    Ss   22:20   0:00 /bin/bash
postgres 25138  0.0  0.0 171504 13592 ?        Ss   22:20   0:00 /usr/local/bin/postgres -D /home/postgres/pgdat
postgres 25140  0.0  0.0 171504   832 ?        Ss   22:20   0:00 postgres: checkpointer
postgres 25141  0.0  0.0 171636  1320 ?        Ss   22:20   0:00 postgres: background writer
postgres 25142  0.0  0.0 171504  5016 ?        Ss   22:20   0:00 postgres: walwriter
postgres 25143  0.0  0.0 172056  2032 ?        Ss   22:20   0:00 postgres: autovacuum launcher
postgres 25144  0.0  0.0  26056  1132 ?        Ss   22:20   0:00 postgres: stats collector
postgres 25145  0.0  0.0 172060  1572 ?        Ss   22:20   0:00 postgres: logical replication launcher
postgres 25147  0.0  0.0  54296  1860 pts/1    R+   22:21   0:00 ps aux
```

待受ポート確認
```
$lsof -i:5432
COMMAND    PID     USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
postgres 25138 postgres    3u  IPv4 2455508      0t0  TCP localhost:postgres (LISTEN)
```

ログ確認

```
$ll
total 12
-rw-------.  1 postgres postgres  764  1月 13 22:18 launch_postgres.log
drwx------. 19 postgres postgres 4096  1月 13 22:18 pgdat
$tail launch_postgres.log
2020-01-13 22:20:40.359 JST [25138] LOG:  starting PostgreSQL 12.0 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-39), 64-bit
2020-01-13 22:20:40.360 JST [25138] LOG:  listening on IPv4 address "127.0.0.1", port 5432
2020-01-13 22:20:40.360 JST [25138] LOG:  could not bind IPv6 address "::1": Cannot assign requested address
2020-01-13 22:20:40.360 JST [25138] HINT:  Is another postmaster already running on port 5432? If not, wait a few seconds and retry.
2020-01-13 22:20:40.367 JST [25138] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
2020-01-13 22:20:40.385 JST [25139] LOG:  database system was shut down at 2020-01-13 22:18:33 JST
2020-01-13 22:20:40.391 JST [25138] LOG:  database system is ready to accept connections
```

# データベース復元

postgresユーザーで実行
tarファイルある場所でリストア
事前にデータファイルをマウントするデータベースを作成しておく

```
$psql -U postgres -c "create database dvdrental"
$pg_restore -U postgres -d dvdrental dvdrental.tar
```

# データベース作成
postgresユーザーで実行
```
$psql -U postgres -c "create database testdb"
```

# データベース削除
postgresユーザーで実行
```
$psql -U postgres -c "drop database testdb"
```

# データベース一覧取得
postgresユーザーで実行
```
$psql -l
```
# データベース接続
postgresユーザーで実行
```
$psql -U postgres -d testdb
```

# 他言語拡張可能一覧取得
postgresユーザーで実行
```
$psql -U postgres -d testdb -c "SELECT * FROM pg_available_extensions;"

  name   | default_version | installed_version |                comment
---------+-----------------+-------------------+----------------------------------------
 plpgsql | 1.0             | 1.0               | PL/pgSQL procedural language
 plperlu | 1.0             |                   | PL/PerlU untrusted procedural language
 plperl  | 1.0             |                   | PL/Perl procedural language
(3 rows)
```

# perl拡張!
postgresユーザーで実行
```
$psql -U postgres -d testdb -c "CREATE EXTENSION plperl;"
```

installed_versionに空白以外が出れば使える

postgresユーザーで実行
```
$psql -U postgres -d testdb -c "SELECT * FROM pg_available_extensions;"
  name   | default_version | installed_version |                comment
---------+-----------------+-------------------+----------------------------------------
 plpgsql | 1.0             | 1.0               | PL/pgSQL procedural language
 plperlu | 1.0             |                   | PL/PerlU untrusted procedural language
 plperl  | 1.0             | 1.0               | PL/Perl procedural language
(3 rows)
```

# 動作確認

作成するファンクションは以下
```
CREATE OR REPLACE FUNCTION perl_set_int(int)
RETURNS SETOF INTEGER
AS $$
    return [0..$_[0]];
$$ LANGUAGE plperl;
```

postgresユーザーで実行
```
$psql -U postgres -d testdb
psql (12.0)
Type "help" for help.

testdb=# CREATE OR REPLACE FUNCTION perl_set_int(int)
testdb-# RETURNS SETOF INTEGER
testdb-# AS $$
testdb$#     return [0..$_[0]];
testdb$# $$ LANGUAGE plperl;
CREATE FUNCTION

testdb=# select n from generate_series(1,5) as t(n);
 n
---
 1
 2
 3
 4
 5
(5 rows)

testdb=# select n,perl_set_int(n) from generate_series(1,5) as t(n);
 n | perl_set_int
---+--------------
 1 |            0
 1 |            1
 2 |            0
 2 |            1
 2 |            2
 3 |            0
 3 |            1
 3 |            2
 3 |            3
 4 |            0
 4 |            1
 4 |            2
 4 |            3
 4 |            4
 5 |            0
 5 |            1
 5 |            2
 5 |            3
 5 |            4
 5 |            5
(20 rows)
```


# ポスグレプロセス停止

postgresユーザーで実行
```
$pg_ctl -D ~/pgdat stop
```

プロセス確認
```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
postgres     1  0.0  0.0  42688  1576 pts/0    Ss+  21:30   0:00 /usr/sbin/init
postgres 25043  0.0  0.0  14376  2116 pts/1    Ss   22:13   0:00 /bin/bash
postgres 25077  0.0  0.0  54296  1860 pts/1    R+   22:16   0:00 ps aux
```

ログ確認
```
$tail launch_postgres.log
2020-01-13 22:22:19.122 JST [25138] LOG:  received fast shutdown request
2020-01-13 22:22:19.139 JST [25138] LOG:  aborting any active transactions
2020-01-13 22:22:19.140 JST [25138] LOG:  background worker "logical replication launcher" (PID 25145) exited with exit code 1
2020-01-13 22:22:19.141 JST [25140] LOG:  shutting down
2020-01-13 22:22:19.162 JST [25138] LOG:  database system is shut down
```


# トラシュー

原因２つ

## 1.perl関連のライブラリパッケージの不足
configure: error: could not determine flags for linking embedded Perl.
This probably means that ExtUtils::Embed or ExtUtils::MakeMaker is not
installed.

## 2.libperlダイナミックリンクライブラリファイルの不足
configure: error: cannot build PL/Perl because libperl is not a shared library
You might have to rebuild your Perl installation.  Refer to the
documentation for details.  Use --without-perl to disable building
PL/Perl.

## 1.の解決

rootユーザーで以下のコマンドを実行
```
yum install -y perl-App-cpanminus wxGTK-devel perl-ExtUtils-Embed perl-File-HomeDir perl-Term-ReadLine-Gnu wxGTK3 cpan
```

## 2.の解決

これを参考にConfigureのビルドおぷしょんへ**-Duseshrplib**を追加
http://lfsbookja.osdn.jp/9.0-ja/lfsbookja-9.0.pdf

```
cd /usr/local/src && curl -LO https://www.cpan.org/src/5.0/perl-5.30.0.tar.gz && \
tar -xzf perl-5.30.0.tar.gz && \
cd perl-5.30.0 && \
./Configure -des -Dprefix=/usr/local -Duseshrplib && \
make -j12 && \
make -j12 install
```

ダイナミックリンクライブラリファイルの確認
```
$perl -V
  @INC:
    /usr/local/lib/perl5/site_perl/5.30.0/x86_64-linux
    /usr/local/lib/perl5/site_perl/5.30.0
    /usr/local/lib/perl5/5.30.0/x86_64-linux
    /usr/local/lib/perl5/5.30.0
```

@INCで取得できたディレクトリ配下にlibperl.soダイナミックリンクファイルが存在することを確認する
```
$find / -name "*libperl.so*" 2>/dev/null
/usr/local/lib/perl5/5.30.0/x86_64-linux/CORE/libperl.so★←これがシステム共通以外
/usr/local/src/perl-5.30.0/libperl.so★←これがシステム共通以外
/usr/lib64/perl5/CORE/libperl.so★←これがシステム共通
```

