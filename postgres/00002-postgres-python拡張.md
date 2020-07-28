あんていしてる
dbeaver

コンテナ起動後、**postgres**ユーザーで実行755なので、実行できる

```
$bash /usr/local/src/script-repo/centos-7-6-18-10-healthcheck-postgres-12-X-with-python.sh
```


そのあとdbeaverに接続


|key|value|
|:-:|:-:|
|Host|localhost|
|Port|5432|
|Database|testdb|
|ユーザー名|postgres|
|パスワード|postgres_pwd|


[ポスグレ公式](https://www.postgresql.jp/document/11/html/plperl-funcs.html)

[レポから配布されているソフトでやるのがあんぱい](https://qiita.com/tom-sato/items/e1903cb974fb6c6d5664)


# パイソンビルド

```
cd /usr/local/src && \
curl -LO https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz && \
tar xvf Python-3.7.4.tgz && \
cd Python-3.7.4 && \
./configure --enable-shared --with-ensurepip=install && \
make -j12 && \
make -j12 install
```

# ダイナミックリンクライブラリの整備

```
echo "export LD_LIBRARY_PATH=/usr/local/lib" >> ~/.bashrc && source ~/.bashrc

echo '/usr/local/lib'>>/etc/ld.so.conf.d/local-ld.so.conf

ldconfig
```

ライブラリキャッシュが更新されたか確認

```
ldconfig -p | grep py
	libpython3.7m.so.1.0 (libc6,x86-64) => /usr/local/lib/libpython3.7m.so.1.0
	libpython3.7m.so (libc6,x86-64) => /usr/local/lib/libpython3.7m.so
	libpython3.5m.so.1.0 (libc6,x86-64) => /usr/lib/x86_64-linux-gnu/libpython3.5m.so.1.0
	libpython3.so (libc6,x86-64) => /usr/local/lib/libpython3.so
```

# ヘッダファイル確認

```
$find / -name "*Python.h*" 2>/dev/null
/usr/local/include/python3.7m/Python.h
/usr/local/src/Python-3.7.4/Include/Python.h
```

# ポスグレビルド

```
cd /usr/local/src && curl -LO https://ftp.postgresql.org/pub/source/v12.0/postgresql-12.0.tar.gz && \
tar xvf postgresql-12.0.tar.gz && \
chown -R root:root postgresql-12.0 && \
cd postgresql-12.0 && \
./configure --prefix=/usr/local --libdir=/usr/local/lib/postgresql --with-python && \
make -j12 && \
make -j12 install
```

# libpythonダイナミックリンクファイルの確認

```
$find / -name "*libpython*so*" 2>/dev/null
/usr/lib/x86_64-linux-gnu/libpython3.5m.so.1.0
/usr/lib/x86_64-linux-gnu/libpython3.5m.so.1
/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/libpython3.5.so
/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/libpython3.5m.so
/usr/local/lib/libpython3.7m.so
/usr/local/lib/libpython3.7m.so.1.0
/usr/local/lib/libpython3.so
/usr/local/src/Python-3.7.4/libpython3.7m.so
/usr/local/src/Python-3.7.4/libpython3.7m.so.1.0
/usr/local/src/Python-3.7.4/libpython3.so
```


# plpythonダイナミックリンクファイルの確認

```
$find / -name "*plpython*so*" 2>/dev/null
/usr/local/lib/postgresql/plpython3.so
/usr/local/src/postgresql-12.0/src/pl/plpython/plpython3.so
```

バージョン3.7にリンクされていることを確認

```
$ldd /usr/local/lib/postgresql/plpython3.so
	linux-vdso.so.1 =>  (0x00007ffed7131000)
	libpython3.7m.so.1.0 => /usr/local/lib/libpython3.7m.so.1.0 (0x00007fe938978000)
	libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007fe93875b000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fe938391000)
	libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fe93818d000)
	libutil.so.1 => /lib/x86_64-linux-gnu/libutil.so.1 (0x00007fe937f8a000)
	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007fe937c81000)
	/lib64/ld-linux-x86-64.so.2 (0x00007fe9390ef000)
```


# ポスグレプロセス起動

postgresユーザーで実行

```
initdb -D ~/pgdat
pg_ctl -D ~/pgdat -l ~/launch_postgres.log start
psql -U postgres -c "create database testdb"
psql -U postgres -d testdb -c "SELECT * FROM pg_available_extensions;"
    name    | default_version | installed_version |                  comment
------------+-----------------+-------------------+-------------------------------------------
 plpgsql    | 1.0             | 1.0               | PL/pgSQL procedural language
 plpython3u | 1.0             |                   | PL/Python3U untrusted procedural language
(2 rows)

psql -U postgres -d testdb -c "CREATE EXTENSION plpython3u;"

psql -U postgres -d testdb -c "SELECT * FROM pg_available_extensions;"
    name    | default_version | installed_version |                  comment
------------+-----------------+-------------------+-------------------------------------------
 plpgsql    | 1.0             | 1.0               | PL/pgSQL procedural language
 plpython3u | 1.0             | 1.0               | PL/Python3U untrusted procedural language
(2 rows)

```

# 動作確認

以下のファンクションを作成

```
create or replace function get_version()
returns text
as $$
  import sys
  return str(sys.version_info.major)+'.'+str(sys.version_info.minor)+'.'+str(sys.version_info.micro)
$$ language plpython3u;
```

```
postgres@b29d6d7d0ebe:~$ psql -U postgres -d testdb
psql (12.0)
Type "help" for help.

testdb=# create or replace function get_version()
testdb-# returns text
testdb-# as $$
testdb$#   import sys
testdb$#   return str(sys.version_info.major)+'.'+str(sys.version_info.minor)+'.'+str(sys.version_info.micro)
testdb$# $$ LANGUAGE plpython3u;
CREATE FUNCTION
testdb=# select get_version();
 get_version
-------------
 3.7.4
(1 row)
```


