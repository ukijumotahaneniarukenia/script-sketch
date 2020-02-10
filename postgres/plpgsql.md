この手順でできる場合とできない場合がある


configureする前にmake distcleanする。
https://postgrespro.com/list/thread-id/1551666
PYTHON環境変数にPython3の実行ファイルパス入れてみる
```
この順番ならいける


# 変更前キャッシュ確認
[postgres💞4974412cb8b3 (金 10月 11 00:23:25) ~]$/usr/sbin/ldconfig -p | grep py
	libpython2.7.so.1.0 (libc6,x86-64) => /lib64/libpython2.7.so.1.0

# Pythonヘッダファイルいんすこ
[postgres💞4974412cb8b3 (金 10月 11 00:23:37) ~]$sudo yum install -y python-devel

# いんすこ後キャッシュ確認
[postgres💞4974412cb8b3 (金 10月 11 00:24:16) ~]$/usr/sbin/ldconfig -p | grep py
	libpython2.7.so.1.0 (libc6,x86-64) => /lib64/libpython2.7.so.1.0
	libpython2.7.so (libc6,x86-64) => /lib64/libpython2.7.so

# soファイル所在確認
[postgres💟8bd422261606 (木 10月 10 22:01:28) /usr/local/src/postgresql-12.0]$find / -name "*libpython*" 2>/dev/null
/usr/share/systemtap/tapset/libpython2.7-64.stp
/usr/local/src/Python-3.7.4/libpython3.7m.a
/usr/local/src/Python-3.7.4/Tools/gdb/libpython.py
/usr/local/src/Python-3.7.4/libpython3.7m.so
/usr/local/src/Python-3.7.4/libpython3.7m.so.1.0
/usr/local/src/Python-3.7.4/libpython3.so
/usr/local/lib/libpython3.7m.so
/usr/local/lib/libpython3.7m.so.1.0
/usr/local/lib/libpython3.so
/usr/local/lib/python3.7/config-3.7m-x86_64-linux-gnu/libpython3.7m.a
/usr/lib64/libpython2.7.so.1.0
/usr/lib64/python2.7/config/libpython2.7.so
/usr/lib64/libpython2.7.so

# リンク作成対象の変更前
[postgres💞4974412cb8b3 (金 10月 11 00:24:48) ~]$su root
Password: 
[root🧡4974412cb8b3 (金 10月 11 00:25:07) /home/postgres]$
[root🧡4974412cb8b3 (金 10月 11 00:25:07) /home/postgres]$cat /etc/ld.so.conf
include ld.so.conf.d/*.conf

# リンク作成対象の変更後
[root🧡4974412cb8b3 (金 10月 11 00:25:26) /home/postgres]$echo /usr/local/lib >>/etc/ld.so.conf
[root🧡4974412cb8b3 (金 10月 11 00:25:49) /home/postgres]$cat /etc/ld.so.conf
include ld.so.conf.d/*.conf
/usr/local/lib

# キャッシュ作成
[root🧡4974412cb8b3 (金 10月 11 00:25:50) /home/postgres]$/usr/sbin/ldconfig

# 変更後キャッシュ確認
[root🧡4974412cb8b3 (金 10月 11 00:26:26) /home/postgres]$/usr/sbin/ldconfig -p | grep py
	libpython3.7m.so.1.0 (libc6,x86-64) => /usr/local/lib/libpython3.7m.so.1.0
	libpython3.7m.so (libc6,x86-64) => /usr/local/lib/libpython3.7m.so
	libpython3.so (libc6,x86-64) => /usr/local/lib/libpython3.so
	libpython2.7.so.1.0 (libc6,x86-64) => /lib64/libpython2.7.so.1.0
	libpython2.7.so (libc6,x86-64) => /lib64/libpython2.7.so

# ポスグレビルド
[postgres💞4974412cb8b3 (金 10月 11 00:28:45) ~]$cd /usr/local/src/postgresql-12.0
[postgres💞4974412cb8b3 (金 10月 11 00:29:38) /usr/local/src/postgresql-12.0]$sudo ./configure --prefix=/usr/local --with-python --with-includes=/usr/local/include/python3.7m --with-libraries=/lib64 | tee log
[postgres💞4974412cb8b3 (金 10月 11 00:30:17) /usr/local/src/postgresql-12.0]$sudo make -j12 | tee logg
All of PostgreSQL successfully made. Ready to install.
[postgres💞4974412cb8b3 (金 10月 11 00:30:34) /usr/local/src/postgresql-12.0]$sudo make -j12 install | tee loggg
PostgreSQL installation complete.

# plpython3手動作成
[postgres💞4974412cb8b3 (金 10月 11 00:30:34) /usr/local/src/postgresql-12.0]$cd /usr/local/src/postgresql-12.0/src/pl/plpython
[postgres💞4974412cb8b3 (金 10月 11 00:31:29) /usr/local/src/postgresql-12.0/src/pl/plpython]$sudo gcc -std=gnu99 -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Werror=vla -Wendif-labes -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -O2 -fPIC -shared -o plpython3.so plpy_cursorobject.o plpy_elog.o plpy_exec.o plpy_main.o plpy_planobject.o plpy_plpymodule.o plpy_procedure.o plpy_resultobject.o plpy_spi.o plpy_subxactobject.o plpy_typeio.o plpy_util.o  -L../../../src/port -L../../../src/common    -Wl,--as-needed -Wl,-rpath,'/usr/lib64',--enable-new-dtags  -L/usr/lib64 -lpython3.7m -lpthread -ldl  -lutil -lm
[postgres💞4974412cb8b3 (金 10月 11 00:31:37) /usr/local/src/postgresql-12.0/src/pl/plpython]$ls pl*
plpy_cursorobject.c  plpy_exec.c  plpy_planobject.c  plpy_procedure.c     plpy_spi.c            plpy_typeio.c  plpython.h                       plpython3u--1.0.sql
plpy_cursorobject.h  plpy_exec.h  plpy_planobject.h  plpy_procedure.h     plpy_spi.h            plpy_typeio.h  plpython2.so                     plpython3u--unpackaged--1.0.sql
plpy_cursorobject.o  plpy_exec.o  plpy_planobject.o  plpy_procedure.o     plpy_spi.o            plpy_typeio.o  plpython2u--1.0.sql              plpython3u.control
plpy_elog.c          plpy_main.c  plpy_plpymodule.c  plpy_resultobject.c  plpy_subxactobject.c  plpy_util.c    plpython2u--unpackaged--1.0.sql  plpythonu--1.0.sql
plpy_elog.h          plpy_main.h  plpy_plpymodule.h  plpy_resultobject.h  plpy_subxactobject.h  plpy_util.h    plpython2u.control               plpythonu--unpackaged--1.0.sql
plpy_elog.o          plpy_main.o  plpy_plpymodule.o  plpy_resultobject.o  plpy_subxactobject.o  plpy_util.o    plpython3.so                     plpythonu.control
[postgres💞4974412cb8b3 (金 10月 11 00:31:48) /usr/local/src/postgresql-12.0/src/pl/plpython]$sudo /usr/bin/install -c -m 755  plpython3.so '/usr/local/lib/postgresql/plpython3.so'
[postgres💞4974412cb8b3 (金 10月 11 00:32:10) /usr/local/src/postgresql-12.0/src/pl/plpython]$sudo /usr/bin/install -c -m 644 ./plpython3u.control ./plpython3u--1.0.sql ./plpython3u--unpackaged--1.0.sql '/usr/loal/share/postgresql/extension/'

# ポスグレ起動
[postgres💞4974412cb8b3 (金 10月 11 00:32:15) /usr/local/src/postgresql-12.0/src/pl/plpython]$cd ~
[postgres💞4974412cb8b3 (金 10月 11 00:32:29) ~]$initdb -D ~/pgdata
The files belonging to this database system will be owned by user "postgres".
This user must also own the server process.

The database cluster will be initialized with locale "ja_JP.utf8".
The default database encoding has accordingly been set to "UTF8".
initdb: could not find suitable text search configuration for locale "ja_JP.utf8"
The default text search configuration will be set to "simple".

Data page checksums are disabled.

creating directory /home/postgres/pgdata ... ok
creating subdirectories ... ok
selecting dynamic shared memory implementation ... posix
selecting default max_connections ... 100
selecting default shared_buffers ... 128MB
selecting default time zone ... Asia/Tokyo
creating configuration files ... ok
running bootstrap script ... ok
performing post-bootstrap initialization ... ok
syncing data to disk ... ok

initdb: warning: enabling "trust" authentication for local connections
You can change this by editing pg_hba.conf or using the option -A, or
--auth-local and --auth-host, the next time you run initdb.

Success. You can now start the database server using:

    pg_ctl -D /home/postgres/pgdata -l logfile start
[postgres💞4974412cb8b3 (金 10月 11 00:32:31) ~]$pg_ctl -D ~/pgdata -l logfile start
waiting for server to start.... done
server started
[postgres💞4974412cb8b3 (金 10月 11 00:32:55) ~]$psql -U postgres -c "create database test_01"
CREATE DATABASE
[postgres💞4974412cb8b3 (金 10月 11 00:33:09) ~]$psql -U postgres -d test_01 -c "SELECT * FROM pg_available_extensions;"
    name    | default_version | installed_version |                  comment                  
------------+-----------------+-------------------+-------------------------------------------
 plpgsql    | 1.0             | 1.0               | PL/pgSQL procedural language
 plpythonu  | 1.0             |                   | PL/PythonU untrusted procedural language
 plpython2u | 1.0             |                   | PL/Python2U untrusted procedural language
 plpython3u | 1.0             |                   | PL/Python3U untrusted procedural language
(4 rows)

[postgres💞4974412cb8b3 (金 10月 11 00:33:24) ~]$psql -U postgres -d test_01 -c "CREATE EXTENSION plpython3u;"
ERROR:  could not load library "/usr/local/lib/postgresql/plpython3.so": /usr/local/lib/postgresql/plpython3.so: undefined symbol: _Py_ZeroStruct


[postgres💞4974412cb8b3 (金 10月 11 00:34:35) ~]$psql -U postgres -d test_01 -c "CREATE EXTENSION plpython2u;"
CREATE EXTENSION
[postgres💞4974412cb8b3 (金 10月 11 00:34:42) ~]psql -U postgres -d test_01 -c "SELECT * FROM pg_available_extensions;"
    name    | default_version | installed_version |                  comment                  
------------+-----------------+-------------------+-------------------------------------------
 plpgsql    | 1.0             | 1.0               | PL/pgSQL procedural language
 plpythonu  | 1.0             |                   | PL/PythonU untrusted procedural language
 plpython2u | 1.0             | 1.0               | PL/Python2U untrusted procedural language
 plpython3u | 1.0             |                   | PL/Python3U untrusted procedural language
(4 rows)


create function pymx(a integer,b integer)
returns integer
as $$
if a>b:
return a
return b
$$ LANGUAGE plpython3u;

select pymx(10,2);

select pymx(10,12);

[postgres🧡dd3ca31d4bab (土 10月 12 10:50:53) ~]$ldd /usr/local/lib/postgresql/plpython3.so
	linux-vdso.so.1 =>  (0x00007ffefadf8000)
	libpython3.7m.so.1.0 => /usr/local/lib/libpython3.7m.so.1.0 (0x00007f379a828000)
	libpthread.so.0 => /usr/lib64/libpthread.so.0 (0x00007f379a60c000)
	libc.so.6 => /usr/lib64/libc.so.6 (0x00007f379a23e000)
	libcrypt.so.1 => /lib64/libcrypt.so.1 (0x00007f379a007000)
	libdl.so.2 => /lib64/libdl.so.2 (0x00007f3799e03000)
	libutil.so.1 => /lib64/libutil.so.1 (0x00007f3799c00000)
	libm.so.6 => /lib64/libm.so.6 (0x00007f37998fe000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f379afab000)
	libfreebl3.so => /lib64/libfreebl3.so (0x00007f37996fb000)
[postgres🧡dd3ca31d4bab (土 10月 12 10:51:05) ~]ldd /usr/local/lib/postgresql/plpython2.so
	linux-vdso.so.1 =>  (0x00007ffe03fb5000)
	libpython2.7.so.1.0 => /usr/lib64/libpython2.7.so.1.0 (0x00007f7af4a30000)
	libpthread.so.0 => /usr/lib64/libpthread.so.0 (0x00007f7af4814000)
	libc.so.6 => /usr/lib64/libc.so.6 (0x00007f7af4446000)
	libdl.so.2 => /lib64/libdl.so.2 (0x00007f7af4242000)
	libutil.so.1 => /lib64/libutil.so.1 (0x00007f7af403f000)
	libm.so.6 => /lib64/libm.so.6 (0x00007f7af3d3d000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f7af501c000)

```

# 参考文献
https://wasure-memo.h-tsk.com/2015/03/centos-7python34.html?m=1
https://wiki.toridge.com/index.php?python-%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%EF%BC%86%E8%A8%AD%E5%AE%9A
https://stackoverflow.com/questions/43333207/python-error-while-loading-shared-libraries-libpython3-4m-so-1-0-cannot-open?rq=1
https://forums.ubuntulinux.jp/viewtopic.php?id=19186
https://www.depesz.com/projects/#shell_utils
https://www.slideshare.net/DJTechHub/business-logic-with-postgre-sql-and-python
https://vdlz.xyz/Csharp/Database/Postgre/Install/Install941.html
http://raghavt.blogspot.com/2017/09/create-language-plpython3u-postgresql-96.html
https://wiki.tcl-lang.org/page/XML
https://wiki.tcl-lang.org/page/Brace+your+expr-essions
http://pyomeha.blog42.fc2.com/blog-entry-6.html
https://www.ibm.com/developerworks/jp/webservices/library/ws-xtcl/index.html
http://www.nslabs.jp/postgresql-install.rhtml
http://kamoland.com/wiki/wiki.cgi?%A5%D5%A5%A1%A5%A4%A5%EB%A5%B5%A1%BC%A5%D0%A4%F2PostgreSQL%A4%C7%C1%B4%CA%B8%B8%A1%BA%F7%A1%C1%B4%C4%B6%AD%B9%BD%C3%DB%CA%D4
https://www.slideshare.net/mobile/syachi/plperl
https://postgrespro.com/list/thread-id/1545565
https://postgresrocks.enterprisedb.com/t5/PostgreSQL/unable-to-install-pl-python-extension/m-p/4090
http://please-sleep.cou929.nu/20080718.html
https://stackoverflow.com/questions/7880454/python-executable-not-finding-libpython-shared-library
https://fluca1978.github.io/2018/04/12/PostgreSQL-plpython.html
https://wiki.toridge.com/index.php?python-%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%EF%BC%86%E8%A8%AD%E5%AE%9A
https://docs.python.org/ja/3/install/index.html#distutils-configuration-files
https://docs.python.org/ja/3/install/index.html#custom-installation
http://kenzo0107.hatenablog.com/entry/2015/02/17/114506
https://orebibou.com/2016/10/%E3%80%8E%E8%87%B4%E5%91%BD%E7%9A%84%E3%82%A8%E3%83%A9%E3%83%BC-python-h-%E3%81%9D%E3%81%AE%E3%82%88%E3%81%86%E3%81%AA%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%84%E3%83%87%E3%82%A3%E3%83%AC/
http://pgsqldeepdive.blogspot.com/2015/11/pgsummpy.html
http://pgsqldeepdive.blogspot.com/2016/01/plpython-aggregation-function.html
https://dev.classmethod.jp/server-side/db/psql-pl-python-trial/
http://www.koikikukan.com/archives/2016/10/27-000300.php
https://kenpg.bitbucket.io/blog/201505/19.html
http://dbnote.web.fc2.com/note_extension.html
http://tihiro.hatenablog.com/entry/2017/08/24/075734
https://www.postgresql.jp/document/9.3/html/plperl.html
https://qiita.com/tom-sato/items/e1903cb974fb6c6d5664
https://www.postgresql.jp/document/9.3/html/plperl-funcs.html
https://stackoverflow.com/questions/12010344/postgres-database-crash-when-installing-plpython
https://sites.google.com/site/gpsnmeajp/tcl-tk/tcl-tknosusume
