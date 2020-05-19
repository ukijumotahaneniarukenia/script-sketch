ワークスペース作成

```
mkdir -p wrksp
cd wrksp
```

build.gradle作成

```
cat <<EOS >build.gradle
configurations {
    domaGenRuntime
}

repositories {
    mavenCentral()
    maven {url 'https://oss.sonatype.org/content/repositories/snapshots/'}
}

dependencies {
    domaGenRuntime 'org.seasar.doma:doma-gen:2.26.0'
    domaGenRuntime 'mysql:mysql-connector-java:8.0.18'
}

task gen {
    group = 'doma-gen'
    doLast {
        ant.taskdef(resource: 'domagentask.properties',
            classpath: configurations.domaGenRuntime.asPath)
        ant.gen(url: 'jdbc:mysql://127.0.0.1/sakila', user: 'root', password: 'Mysql3306') {
            entityConfig()
            daoConfig()
            sqlConfig()
        }
    }
}
EOS
```


サンプルデータベース作成ダウンロード


https://dev.mysql.com/doc/index-other.html


```

curl -sSLO https://downloads.mysql.com/docs/sakila-db.zip

unzip sakila-db.zip 

```


sakila-dbデータファイル等をmysqlプロセスにマウント


```
$ll sakila-db/*sql
-rw-r--r--. 1 mysql mysql 3351768  1月 23 01:13 sakila-db/sakila-data.sql
-rw-r--r--. 1 mysql mysql   24278  1月 23 01:13 sakila-db/sakila-schema.sql
$mysql -uroot -pMysql3306 < sakila-db/sakila-schema.sql
mysql: [Warning] Using a password on the command line interface can be insecure.
$mysql -uroot -pMysql3306 < sakila-db/sakila-data.sql 
mysql: [Warning] Using a password on the command line interface can be insecure.
```

sakilaデータベースに接続

```
$mysql -uroot -pMysql3306 -Dsakila
mysql: [Warning] Using a password on the command line interface can be insecure.
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 19
Server version: 8.0.20 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>


```


build.gradleファイルがあるディレクトリでタスク実行

```

$ls
build.gradle  sakila-db  sakila-db.zip


mysql doc-centos-7-6-18-10-mysql-dbeaver ~/wrksp$/home/mysql/.sdkman/candidates/gradle/6.1.1/bin/gradle gen

> Task :gen
[ant:gen] Loading class `com.mysql.jdbc.Driver'. This is deprecated. The new driver class is `com.mysql.cj.jdbc.Driver'. The driver is automatically registered via the SPI and manual loading of the driver class is generally unnecessary.

BUILD SUCCESSFUL in 705ms
1 actionable task: 1 executed
```


srcフォルダが作成される
```

$ls
build.gradle  sakila-db  sakila-db.zip  src


```
