# ユーザー定義関数の作成

https://qiita.com/onunu/items/71064bbf48dc40c6ce11 </br>
https://qiita.com/okumurakengo/items/1208db98f98cb360c7ba </br>

```
$vi factorial.cpp
$gcc --version
gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

# 環境変数の設定

```
$export CPATH=/usr/include/mysql:/usr/include/c++/9
```

# コンパイル
```
$gcc factorial.cpp -shared -o /usr/lib/mysql/plugin/factorial.so
```

ダイナミックリンクファイル作成されているか確認
```
$ll /usr/lib/mysql/plugin/factorial.so
-rwxr-xr-x. 1 root root 23640 Jan 19 17:34 /usr/lib/mysql/plugin/factorial.so*
```

# 実行

```
$mysql -uuser01 -pMysql3306 -Dtestdb
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.18-0ubuntu0.19.10.1 (Ubuntu)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create function factorial returns string soname 'factorial.so';
Query OK, 0 rows affected (0.03 sec)
mysql> select factorial(6);
+--------------+
| factorial(6) |
+--------------+
| 720          |
+--------------+
1 row in set (0.00 sec)
```

