# 参考文献
カンマ区切りハンドリングのヒント
https://qiita.com/choplin/items/9d5e2ff8721fb9509bf8

# データベース作成
```
[postgres💖4cecdc969f4c (月 10月 07 21:56:23) ~]$sudo yum install -y python-devel
[postgres💖4cecdc969f4c (月 10月 07 21:56:23) ~]$cd /usr/local/src/postgresql-12.0
[postgres💖4cecdc969f4c (月 10月 07 21:56:31) /usr/local/src/postgresql-12.0]$ls
COPYRIGHT  GNUmakefile.in  HISTORY  INSTALL  Makefile  README  aclocal.m4  config  configure  configure.in  contrib  doc  src
[postgres💖4cecdc969f4c (月 10月 07 21:56:33) /usr/local/src/postgresql-12.0]$sudo ./configure --prefix=/usr/local --with-python --with-includes=/usr/local/include/python3.7m --with-libraries=/lib64 | tee log
[postgres💖4cecdc969f4c (月 10月 07 21:58:29) /usr/local/src/postgresql-12.0]$sudo make -j12 | tee logg
All of PostgreSQL successfully made. Ready to install.
[postgres💖4cecdc969f4c (月 10月 07 21:59:34) /usr/local/src/postgresql-12.0]$sudo make -j12 install | tee loggg
PostgreSQL installation complete.


[postgres💙32a11b874593 (月 10月 07 21:11:16) /usr/local/src/postgresql-12.0/src/pl/plpython]$sudo ln -s /usr/local/lib/libpython3.7m.so.1.0 /usr/lib64/libpython3.7m.so.1.0
[postgres💙32a11b874593 (月 10月 07 21:13:25) /usr/local/src/postgresql-12.0/src/pl/plpython]$sudo ln -s /usr/local/lib/libpython3.7m.so /usr/lib64/libpython3.7m.so
[postgres💙32a11b874593 (月 10月 07 21:13:49) /usr/local/src/postgresql-12.0/src/pl/plpython]$sudo ldconfig
[postgres💙32a11b874593 (月 10月 07 21:13:54) /usr/local/src/postgresql-12.0/src/pl/plpython]$sudo ldconfig -p | grep python
	libpython3.7m.so.1.0 (libc6,x86-64) => /lib64/libpython3.7m.so.1.0
	libpython3.7m.so (libc6,x86-64) => /lib64/libpython3.7m.so
	libpython2.7.so.1.0 (libc6,x86-64) => /lib64/libpython2.7.so.1.0
	libpython2.7.so (libc6,x86-64) => /lib64/libpython2.7.so

[postgres💖4cecdc969f4c (月 10月 07 22:01:23) ~]$cd /usr/local/src/postgresql-12.0/src/pl/plpython
[postgres💖4cecdc969f4c (月 10月 07 22:02:04) /usr/local/src/postgresql-12.0/src/pl/plpython]$sudo gcc -std=gnu99 -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Werror=vla -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -O2 -fPIC -shared -o plpython3.so plpy_cursorobject.o plpy_elog.o plpy_exec.o plpy_main.o plpy_planobject.o plpy_plpymodule.o plpy_procedure.o plpy_resultobject.o plpy_spi.o plpy_subxactobject.o plpy_typeio.o plpy_util.o  -L../../../src/port -L../../../src/common    -Wl,--as-needed -Wl,-rpath,'/usr/lib64',--enable-new-dtags  -L/usr/lib64 -lpython3.7m -lpthread -ldl  -lutil -lm
[postgres💖4cecdc969f4c (月 10月 07 22:02:25) /usr/local/src/postgresql-12.0/src/pl/plpython]$sudo /usr/bin/install -c -m 755  plpython3.so '/usr/local/lib/postgresql/plpython3.so'
[postgres💖4cecdc969f4c (月 10月 07 22:02:46) /usr/local/src/postgresql-12.0/src/pl/plpython]$sudo /usr/bin/install -c -m 644 ./plpython3u.control ./plpython3u--1.0.sql ./plpython3u--unpackaged--1.0.sql '/usr/local/share/postgresql/extension/'

initdb -D ~/pgdata && \
pg_ctl -D ~/pgdata -l logfile start && \
psql -U postgres -c "create database test_01" && \
psql -U postgres -d test_01 -c "SELECT * FROM pg_available_extensions;" && \
psql -U postgres -d test_01 -c "CREATE EXTENSION plpython3u;" && \
psql -U postgres -d test_01 -c "SELECT * FROM pg_available_extensions;"

```

# 自身以外のセッション削除
```
test_01=# select pid, datname, client_addr from pg_stat_activity where datname = 'test_01';
  pid  | datname | client_addr 
-------+---------+-------------
   557 | test_01 | 127.0.0.1
 24212 | test_01 | 
(2 rows)

test_01=# select pg_terminate_backend(557); 
 pg_terminate_backend 
----------------------
 t
(1 row)
```

# データベース削除
```
[postgres💘a3d770713e93 (日 10月 06 14:47:27) ~/postgresql-11.5/script_scratch/postgres]$psql -U postgres -c "drop database test_01"
DROP DATABASE
```
