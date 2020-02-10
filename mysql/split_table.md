引数がnullの場合

```bash
mysql> with sub as(select split_table(null) as tgt)select * from sub s1,json_table(s1.tgt,"$[*]" columns(ele longtext path "$.key"))s2;
+-----------------+------+
| tgt             | ele  |
+-----------------+------+
| [{"key": null}] | null |
+-----------------+------+
1 row in set (0.01 sec)
```

引数が空文字列の場合

```bash
mysql> with sub as(select split_table('') as tgt)select * from sub s1,json_table(s1.tgt,"$[*]" columns(ele longtext path "$.key"))s2;
+---------------+------+
| tgt           | ele  |
+---------------+------+
| [{"key": ""}] |      |
+---------------+------+
1 row in set (0.00 sec)
```

引数が単一要素文字列の場合

```bash
mysql> with sub as(select split_table('a') as tgt)select * from sub s1,json_table(s1.tgt,"$[*]" columns(ele longtext path "$.key"))s2;
+----------------+------+
| tgt            | ele  |
+----------------+------+
| [{"key": "a"}] | a    |
+----------------+------+
1 row in set (0.00 sec)
```

引数が複数要素文字列の場合

```bash
mysql> with sub as(select split_table('a,b') as tgt)select * from sub s1,json_table(s1.tgt,"$[*]" columns(ele longtext path "$.key"))s2;
+------------------------------+------+
| tgt                          | ele  |
+------------------------------+------+
| [{"key": "a"}, {"key": "b"}] | a    |
| [{"key": "a"}, {"key": "b"}] | b    |
+------------------------------+------+
2 rows in set (0.00 sec)
```

引数が複数要素文字列の場合その2

```bash
mysql> with sub as(select split_table('あっぷる,バナナ,ｵﾚﾝｼﾞ,大根') as tgt)select * from sub s1,json_table(s1.tgt,"$[*]" columns(ele longtext path "$.key"))s2;
+------------------------------------------------------------------------------------------------+-----------------+
| tgt                                                                                            | ele             |
+------------------------------------------------------------------------------------------------+-----------------+
| [{"key": "あっぷる"}, {"key": "バナナ"}, {"key": "ｵﾚﾝｼﾞ"}, {"key": "大根"}]                    | あっぷる        |
| [{"key": "あっぷる"}, {"key": "バナナ"}, {"key": "ｵﾚﾝｼﾞ"}, {"key": "大根"}]                    | バナナ          |
| [{"key": "あっぷる"}, {"key": "バナナ"}, {"key": "ｵﾚﾝｼﾞ"}, {"key": "大根"}]                    | ｵﾚﾝｼﾞ           |
| [{"key": "あっぷる"}, {"key": "バナナ"}, {"key": "ｵﾚﾝｼﾞ"}, {"key": "大根"}]                    | 大根            |
+------------------------------------------------------------------------------------------------+-----------------+
4 rows in set (0.00 sec)
```


以下はこれを実行した時のサーバ設定ファイル**/etc/my.cnf**。備忘。

```bash
[root💘ab9938775985 (日 12月 08 17:04:45) /home/root]$cat /etc/my.cnf
# For advice on how to change settings please see
# http://dev.mysql.com/doc/refman/8.0/en/server-configuration-defaults.html

[mysqld]
#
# Remove leading # and set to the amount of RAM for the most important data
# cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
# innodb_buffer_pool_size = 128M
#
# Remove the leading "# " to disable binary logging
# Binary logging captures changes between backups and is enabled by
# default. It's default setting is log_bin=binlog
# disable_log_bin
#
# Remove leading # to set options mainly useful for reporting servers.
# The server defaults are faster for transactions and fast SELECTs.
# Adjust sizes as needed, experiment to find the optimal values.
# join_buffer_size = 128M
# sort_buffer_size = 2M
# read_rnd_buffer_size = 2M
#
# Remove leading # to revert to previous value for default_authentication_plugin,
# this will increase compatibility with older clients. For background, see:
# https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_default_authentication_plugin
# default-authentication-plugin=mysql_native_password

datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock

log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid

#以下が追加していたやつ
log_timestamps=SYSTEM
skip-character-set-client-handshake
character-set-server=utf8mb4
explicit_defaults_for_timestamp=ON
```

さっき試したらうまくいってた。単一の際のハンドリング見直したからかな。良かった良かった。^^

```bash
mysql> with sub as(   select split_table('apple,banana,cinamon,daikon') as tgt  )select   *  from sub s1     ,json_table(       s1.tgt       ,"$[*]" columns(ele longtext path "$.key")     )s2;
+------------------------------------------------------------------------------+---------+
| tgt                                                                          | ele     |
+------------------------------------------------------------------------------+---------+
| [{"key": "apple"}, {"key": "banana"}, {"key": "cinamon"}, {"key": "daikon"}] | apple   |
| [{"key": "apple"}, {"key": "banana"}, {"key": "cinamon"}, {"key": "daikon"}] | banana  |
| [{"key": "apple"}, {"key": "banana"}, {"key": "cinamon"}, {"key": "daikon"}] | cinamon |
| [{"key": "apple"}, {"key": "banana"}, {"key": "cinamon"}, {"key": "daikon"}] | daikon  |
+------------------------------------------------------------------------------+---------+
4 rows in set (0.00 sec)
```

絵文字もいける。

```
mysql> with sub as(select split_table('apple,\U+1F34E,banana,\U+1F34C,cinamon,ＳＨＩＮＡＭＯＮＮ,daikon') as tgt  )select   *  from sub s1     ,json_table(       s1.tgt       ,"$[*]" columns(ele longtext path "$.key")     )s2;
+--------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------+
| tgt                                                                                                                                                    | ele                         |
+--------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------+
| [{"key": "apple"}, {"key": "🍎"}, {"key": "banana"}, {"key": "🍌"}, {"key": "cinamon"}, {"key": "ＳＨＩＮＡＭＯＮＮ"}, {"key": "daikon"}]                  | apple                       |
| [{"key": "apple"}, {"key": "🍎"}, {"key": "banana"}, {"key": "🍌"}, {"key": "cinamon"}, {"key": "ＳＨＩＮＡＭＯＮＮ"}, {"key": "daikon"}]                  | 🍎                            |
| [{"key": "apple"}, {"key": "🍎"}, {"key": "banana"}, {"key": "🍌"}, {"key": "cinamon"}, {"key": "ＳＨＩＮＡＭＯＮＮ"}, {"key": "daikon"}]                  | banana                      |
| [{"key": "apple"}, {"key": "🍎"}, {"key": "banana"}, {"key": "🍌"}, {"key": "cinamon"}, {"key": "ＳＨＩＮＡＭＯＮＮ"}, {"key": "daikon"}]                  | 🍌                            |
| [{"key": "apple"}, {"key": "🍎"}, {"key": "banana"}, {"key": "🍌"}, {"key": "cinamon"}, {"key": "ＳＨＩＮＡＭＯＮＮ"}, {"key": "daikon"}]                  | cinamon                     |
| [{"key": "apple"}, {"key": "🍎"}, {"key": "banana"}, {"key": "🍌"}, {"key": "cinamon"}, {"key": "ＳＨＩＮＡＭＯＮＮ"}, {"key": "daikon"}]                  | ＳＨＩＮＡＭＯＮＮ          |
| [{"key": "apple"}, {"key": "🍎"}, {"key": "banana"}, {"key": "🍌"}, {"key": "cinamon"}, {"key": "ＳＨＩＮＡＭＯＮＮ"}, {"key": "daikon"}]                  | daikon                      |
+--------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------+
7 rows in set (0.00 sec)
```

