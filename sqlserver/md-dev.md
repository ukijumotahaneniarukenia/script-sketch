- dbeaver起動方法

ソースからインストールしているのでいつもとちがう

フルパス指定

```
root docker-container-ubuntu-16-04-sqlserver-dbeaver /home/mssql$ll /usr/local/src/dbeaver/product/standalone/target/products/org.jkiss.dbeaver.core.product/linux/gtk/x86_64/dbeaver/dbeaver
-rwxr-xr-x. 1 root root 61176  5月  8 12:21 /usr/local/src/dbeaver/product/standalone/target/products/org.jkiss.dbeaver.core.product/linux/gtk/x86_64/dbeaver/dbeaver*

$/usr/local/src/dbeaver/product/standalone/target/products/org.jkiss.dbeaver.core.product/linux/gtk/x86_64/dbeaver/dbeaver 1>$HOME/launch-dbeaver.log 2>&1 &
```

- パスなど
  - 実行ユーザーはmssql
```
$export MSSQL_HOME=/opt/mssql
$export PATH=$MSSQL_HOME/bin:$PATH
$export MSSQL_TOOLS_HOME=/opt/mssql-tools
$export PATH=$MSSQL_TOOLS_HOME/bin:$PATH
```


- プロセス起動
  - 実行ユーザーはmssql
```
$sqlservr --accept-eula 1>$HOME/launch-sqlserver.log 2>&1 &
```

- プロセス確認

```
$ps uax
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.0  20692  1268 pts/0    Ss   11:30   0:00 bash /etc/init/run.sh
root         8  0.0  0.0 252404 20920 ?        S    11:30   0:01 fcitx
root         9  0.0  0.0  20900  1580 pts/0    S+   11:30   0:00 bash
root        15  0.0  0.0  43588   416 ?        S    11:30   0:00 dbus-launch --autolaunch bc74deaa9e044c079ed6fc963d084157 --binary-syntax --close-stderr
root        16  0.0  0.0  42752   932 ?        Ss   11:30   0:00 /usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --session
root        22  0.0  0.0  42884  1408 ?        Ss   11:30   0:00 /usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --config-file /usr/share/fcitx/dbus/daemon.conf
root        26  0.0  0.0  27624   480 ?        SN   11:30   0:00 /usr/bin/fcitx-dbus-watcher unix:abstract=/tmp/dbus-A8Q40Wngd8,guid=9b6d5e5637fcfef125e50b965eb4c434 22
root        27  0.0  0.0      0     0 ?        Z    11:30   0:00 [mozc_server] <defunct>
root        40  0.0  0.0      0     0 ?        Z    11:30   0:00 [mozc_tool] <defunct>
root      2949  0.0  0.0  20916  2120 pts/1    Ss   12:44   0:00 /bin/bash
root      2956  0.0  0.0  52004  1768 pts/1    S    12:45   0:00 su mssql
mssql     2957  0.0  0.0  20904  2076 pts/1    S    12:45   0:00 bash
mssql     3053  0.3  0.0 151156 16772 pts/1    Sl+  12:45   0:00 sqlservr --accept-eula
mssql     3055  9.4  2.5 12209768 828508 pts/1 Sl+  12:45   0:07 sqlservr --accept-eula
root      3249  0.0  0.0  20912  2056 pts/2    Ss   12:47   0:00 /bin/bash
root      3256  0.0  0.0  37084  1668 pts/2    R+   12:47   0:00 ps uax
```

- sqlservrコマンド

```
$/opt/mssql/bin/sqlservr --help
usage: sqlservr [OPTIONS...]

Configuration options:
  -T<#>                     Enable a traceflag
  -y<#>                     Enable dump when server encounters specified error
  -k<#>                     Checkpoint speed (in MB/sec)

Administrative options:
  --accept-eula             Accept the SQL Server EULA
  --pid <pid>               Set server product key
  --reset-sa-password       Reset system administrator password. Password should
                            be specified in the MSSQL_SA_PASSWORD environment
                            variable.
  -f                        Minimal configuration mode
  -m                        Single user administration mode
  -K                        Force regeneration of Service Master Key
  --setup                   Set basic configuration settings and then shutdown.
  --force-setup             Same as --setup, but also reinitialize master and model databases.

General options:
  -v                        Show program version
  --help                    Display this help information
```

- sqlcmdコマンド

```
$sqlcmd -?
Microsoft (R) SQL Server Command Line Tool
Version 17.5.0001.2 Linux
Copyright (C) 2017 Microsoft Corporation. All rights reserved.

usage: sqlcmd            [-U login id]          [-P password]
  [-S server or Dsn if -D is provided]
  [-H hostname]          [-E trusted connection]
  [-N Encrypt Connection][-C Trust Server Certificate]
  [-d use database name] [-l login timeout]     [-t query timeout]
  [-h headers]           [-s colseparator]      [-w screen width]
  [-a packetsize]        [-e echo input]        [-I Enable Quoted Identifiers]
  [-c cmdend]
  [-q "cmdline query"]   [-Q "cmdline query" and exit]
  [-m errorlevel]        [-V severitylevel]     [-W remove trailing spaces]
  [-u unicode output]    [-r[0|1] msgs to stderr]
  [-i inputfile]         [-o outputfile]
  [-k[1|2] remove[replace] control characters]
  [-y variable length type display width]
  [-Y fixed length type display width]
  [-p[1] print statistics[colon format]]
  [-R use client regional setting]
  [-K application intent]
  [-M multisubnet failover]
  [-b On error batch abort]
  [-D Dsn flag, indicate -S is Dsn]
  [-X[1] disable commands, startup script, environment variables [and exit]]
  [-x disable variable substitution]
  [-g enable column encryption]
  [-G use Azure Active Directory for authentication]
  [-? show syntax summary]

```

- bcpコマンド

```
$/opt/mssql-tools/bin/bcp --help
usage: /opt/mssql-tools/bin/bcp {dbtable | query} {in | out | queryout | format} datafile
  [-m maxerrors]            [-f formatfile]          [-e errfile]
  [-F firstrow]             [-L lastrow]             [-b batchsize]
  [-n native type]          [-c character type]      [-w wide character type]
  [-N keep non-text native] [-q quoted identifier]
  [-t field terminator]     [-r row terminator]
  [-a packetsize]           [-K application intent]
  [-S server name or DSN if -D provided]             [-D treat -S as DSN]
  [-U username]             [-P password]
  [-T trusted connection]   [-v version]             [-R regional enable]
  [-k keep null values]     [-E keep identity values]
  [-h "load hints"]         [-d database name]
```

- sqlserverに接続

```
$sqlcmd -S localhost -U SA -P "QseDt7167"
```

- 動作確認

```
1> select 1;
2> go

-----------
          1

(1 rows affected)
1> SELECT @@SERVERNAME;
2> go

--------------------------------------------------------------------------------------------------------------------------------
42f186a04e1b

(1 rows affected)
1> CREATE DATABASE testdb;
2> go
1> SELECT Name from sys.Databases;
2> go
Name
--------------------------------------------------------------------------------------------------------------------------------
master
tempdb
model
msdb
testdb

(5 rows affected)
1> use testdb
2> go
Changed database context to 'testdb'.
1> CREATE TABLE Inventory (id INT, name NVARCHAR(50), quantity INT);
2> go
1> INSERT INTO Inventory VALUES (1, 'banana', 150); INSERT INTO Inventory VALUES (2, 'orange', 154);
2> go

(1 rows affected)

(1 rows affected)
1> SELECT * FROM Inventory;
2> go
id          name                                               quantity
----------- -------------------------------------------------- -----------
          1 banana                                                     150
          2 orange                                                     154

(2 rows affected)
1> select @@version;
2> go

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Microsoft SQL Server 2019 (RTM) - 15.0.2000.5 (X64)
	Sep 24 2019 13:48:23
	Copyright (C) 2019 Microsoft Corporation
	Developer Edition (64-bit) on Linux (Ubuntu 16.04.6 LTS) <X64>

(1 rows affected)
1> drop table Inventory;
2> go
1> SELECT * FROM Inventory;
2> go
Msg 208, Level 16, State 1, Server 42f186a04e1b, Line 1
Invalid object name 'Inventory'.
````

