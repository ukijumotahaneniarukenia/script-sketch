- https://www.geeksforgeeks.org/sql-using-c-c-and-sqlite/

- https://stackoverrun.com/ja/q/2456068

- https://qiita.com/edo_m18/items/9dfab147482b2ce31840

- 静的リンクファイル

拡張子.a

```
$find / -name "*sqlite3*" 2>/dev/null | grep -P '(a|so)(\.[0-9])*$'
/usr/lib/x86_64-linux-gnu/libsqlite3.so
/usr/lib/x86_64-linux-gnu/libsqlite3.la
/usr/lib/x86_64-linux-gnu/libsqlite3.a
/usr/lib/x86_64-linux-gnu/libsqlite3.so.0
/usr/lib/x86_64-linux-gnu/libsqlite3.so.0.8.6
/usr/lib/python2.7/lib-dynload/_sqlite3.x86_64-linux-gnu.so
/usr/lib/python3.7/lib-dynload/_sqlite3.cpython-37m-x86_64-linux-gnu.so
/usr/local/lib/python3.7/lib-dynload/_sqlite3.cpython-37m-x86_64-linux-gnu.so
/usr/local/src/Python-3.7.4/build/lib.linux-x86_64-3.7/_sqlite3.cpython-37m-x86_64-linux-gnu.so
```


- 動的リンクファイル

拡張子 .so

```
$find / -name "*sqlite3*" 2>/dev/null | grep -P '(a|so)(\.[0-9])*$'
/usr/lib/x86_64-linux-gnu/libsqlite3.so
/usr/lib/x86_64-linux-gnu/libsqlite3.la
/usr/lib/x86_64-linux-gnu/libsqlite3.a
/usr/lib/x86_64-linux-gnu/libsqlite3.so.0
/usr/lib/x86_64-linux-gnu/libsqlite3.so.0.8.6
/usr/lib/python2.7/lib-dynload/_sqlite3.x86_64-linux-gnu.so
/usr/lib/python3.7/lib-dynload/_sqlite3.cpython-37m-x86_64-linux-gnu.so
/usr/local/lib/python3.7/lib-dynload/_sqlite3.cpython-37m-x86_64-linux-gnu.so
/usr/local/src/Python-3.7.4/build/lib.linux-x86_64-3.7/_sqlite3.cpython-37m-x86_64-linux-gnu.so
```


- コンパイル

```
$g++ main.cpp -lsqlite3 -o main
```


- 実行

```
$ls
main  main.cpp  md-dev.md

$./main
Opened db successfully

$ls
main  main.cpp  md-dev.md  testdb
```
