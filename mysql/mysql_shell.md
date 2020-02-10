参考文献

https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-json-wrapping.html
```
 MySQL  localhost:33060+ ssl  Py > \e
 MySQL  localhost:33060+ ssl  Py > import sys
                                 > 
                                 > print(sys.version)
                                 > 
  File "<string>", line 1
    import sys
             ^
SyntaxError: multiple statements found while compiling a single statement
 MySQL  localhost:33060+ ssl  Py > import sys;print(sys.version);
3.7.4 (default, Sep 13 2019, 06:54:48) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-39.0.1)]


```

モジュール検索

https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-startup-scripts.html
```
```

プロンプト変更

https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-prompt-themes.html

```

```

```
[root💞ab9938775985 (火 12月 10 06:46:18) /home/root/script_scratch/mysql]$yum install mysql-shell
Loaded plugins: fastestmirror, ovl
Loading mirror speeds from cached hostfile
epel/x86_64/metalink                                                                                                                                                                        | 8.4 kB  00:00:00     
 * base: ftp.nara.wide.ad.jp
 * epel: ftp.riken.jp
 * extras: ty1.mirror.newmediaexpress.com
 * remi-safe: ftp.riken.jp
 * updates: ftp.nara.wide.ad.jp
base                                                                                                                                                                                        | 3.6 kB  00:00:00     
epel                                                                                                                                                                                        | 5.3 kB  00:00:00     
extras                                                                                                                                                                                      | 2.9 kB  00:00:00     
mysql-connectors-community                                                                                                                                                                  | 2.5 kB  00:00:00     
mysql-tools-community                                                                                                                                                                       | 2.5 kB  00:00:00     
mysql80-community                                                                                                                                                                           | 2.5 kB  00:00:00     
remi-safe                                                                                                                                                                                   | 3.0 kB  00:00:00     
updates                                                                                                                                                                                     | 2.9 kB  00:00:00     
(1/3): epel/x86_64/updateinfo                                                                                                                                                               | 1.0 MB  00:00:00     
(2/3): remi-safe/primary_db                                                                                                                                                                 | 1.6 MB  00:00:00     
(3/3): epel/x86_64/primary_db                                                                                                                                                               | 6.9 MB  00:00:00     
Resolving Dependencies
--> Running transaction check
---> Package mysql-shell.x86_64 0:8.0.18-1.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

===================================================================================================================================================================================================================
 Package                                          Arch                                        Version                                             Repository                                                  Size
===================================================================================================================================================================================================================
Installing:
 mysql-shell                                      x86_64                                      8.0.18-1.el7                                        mysql-tools-community                                       27 M

Transaction Summary
===================================================================================================================================================================================================================
Install  1 Package

Total download size: 27 M
Installed size: 97 M
Is this ok [y/d/N]: y
Downloading packages:
mysql-shell-8.0.18-1.el7.x86_64.rpm                                                                                                                                                         |  27 MB  00:00:01     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : mysql-shell-8.0.18-1.el7.x86_64                                                                                                                                                                 1/1 
  Verifying  : mysql-shell-8.0.18-1.el7.x86_64                                                                                                                                                                 1/1 

Installed:
  mysql-shell.x86_64 0:8.0.18-1.el7                                                                                                                                                                                

Complete!
```


インストールされた場所

```
[root💞ab9938775985 (火 12月 10 06:48:46) /home/root/script_scratch/mysql]$find {/usr/local/bin,/bin/,/sbin} -name "*mysql*" 2>/dev/null
/bin/mysqlsh
/bin/mysql-secret-store-login-path
/bin/mysql_secure_installation
/bin/mysqlshow
/bin/mysqlcheck
/bin/mysqldumpslow
/bin/mysql_tzinfo_to_sql
/bin/mysql_ssl_rsa_setup
/bin/mysqld_pre_systemd
/bin/mysqldump
/bin/mysqlbinlog
/bin/mysqlimport
/bin/mysql
/bin/mysql_upgrade
/bin/mysqlslap
/bin/mysql_config_editor
/bin/mysqlpump
/bin/mysqladmin
[root💞ab9938775985 (火 12月 10 06:49:15) /home/root/script_scratch/mysql]$ll /bin/mysqlsh
-rwxr-xr-x. 1 root root 32574648  9月 13 17:24 /bin/mysqlsh
```

![./1.png]()

```
[root💞ab9938775985 (火 12月 10 06:50:42) /home/root/script_scratch/mysql]$/bin/mysqlsh
MySQL Shell 8.0.18

Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  JS > \connect root@localhost:3306
Creating a session to 'root@localhost:3306'
Please provide the password for 'root@localhost:3306': *********
Save password for 'root@localhost:3306'? [Y]es/[N]o/Ne[v]er (default No): 
Fetching schema names for autocompletion... Press ^C to stop.
Your MySQL connection id is 94
Server version: 8.0.18 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:3306 ssl  JS > 
Bye!
```

```
 MySQL  localhost:33060+ ssl  JS > \use testdb
Default schema `testdb` accessible through db.
 MySQL  localhost:33060+ ssl  testdb  JS > 
 MySQL  localhost:33060+ ssl  testdb  JS > 
 MySQL  localhost:33060+ ssl  testdb  JS > 
 MySQL  localhost:33060+ ssl  testdb  JS > 
 MySQL  localhost:33060+ ssl  testdb  JS > 

```
