- oracleのサイトから事前にrpmダウンロード

  - https://dev.mysql.com/downloads/workbench/

```
$rpm -ivh mysql-workbench-community-8.0.20-1.el7.x86_64.rpm 
error: Failed dependencies:
	gnome-keyring is needed by mysql-workbench-community-8.0.20-1.el7.x86_64
	gtkmm30 is needed by mysql-workbench-community-8.0.20-1.el7.x86_64
	libatkmm-1.6.so.1()(64bit) is needed by mysql-workbench-community-8.0.20-1.el7.x86_64
	libcairomm-1.0.so.1()(64bit) is needed by mysql-workbench-community-8.0.20-1.el7.x86_64
	libgdkmm-3.0.so.1()(64bit) is needed by mysql-workbench-community-8.0.20-1.el7.x86_64
	libgiomm-2.4.so.1()(64bit) is needed by mysql-workbench-community-8.0.20-1.el7.x86_64
	libglibmm-2.4.so.1()(64bit) is needed by mysql-workbench-community-8.0.20-1.el7.x86_64
	libgtkmm-3.0.so.1()(64bit) is needed by mysql-workbench-community-8.0.20-1.el7.x86_64
	libpangomm-1.4.so.1()(64bit) is needed by mysql-workbench-community-8.0.20-1.el7.x86_64
	libsigc-2.0.so.0()(64bit) is needed by mysql-workbench-community-8.0.20-1.el7.x86_64
	libzip is needed by mysql-workbench-community-8.0.20-1.el7.x86_64
	libzip.so.2()(64bit) is needed by mysql-workbench-community-8.0.20-1.el7.x86_64

```

こけるので、インストールしてから再度インストール

```
yum install -y gnome-keyring gtkmm30 libatkmm-1.6.so.1 libcairomm-1.0.so.1 libgdkmm-3.0.so.1 libgiomm-2.4.so.1 libglibmm-2.4.so.1 libgtkmm-3.0.so.1 libpangomm-1.4.so.1 libsigc-2.0.so.0 libzip libzip.so.2
```

mysqlユーザーで実行

```
$which mysql-workbench
/bin/mysql-workbench
$mysql-workbench 1>$HOME/launch-mysql-workbench.log 2>&1 &
```
