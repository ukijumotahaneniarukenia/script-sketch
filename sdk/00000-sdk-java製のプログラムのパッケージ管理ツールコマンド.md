sdkコマンドは実行者単位でインストールされる

```
yum install -y zip

curl -s "https://get.sdkman.io" | bash
```

特定のコマンドを実行すると最新バージョンでインストールされる

これも実行者単位でインストールされる

```
sdk install gradle
```

特定のコマンドのインストール可能なバージョン一覧取得

```
$sdk list gradle
================================================================================
Available Gradle Versions
================================================================================
     6.4.1               5.3                 4.0.2               2.3
     6.4                 5.2.1               4.0.1               2.2.1
     6.4-rc-4            5.2                 4.0                 2.2
     6.4-rc-3            5.1.1               3.5.1               2.1
     6.4-rc-2            5.1                 3.5                 2.0
     6.4-rc-1            5.0                 3.4.1               1.12
     6.3                 4.10.3              3.4                 1.11
     6.2.2               4.10.2              3.3                 1.10
     6.2.1               4.10.1              3.2.1               1.9
     6.2                 4.10                3.2                 1.8
     6.1.1               4.9                 3.1                 1.7
     6.1                 4.8.1               3.0                 1.6
     6.0.1               4.8                 2.14.1              1.5
     6.0                 4.7                 2.14                1.4
     5.6.4               4.6                 2.13                1.3
     5.6.3               4.5.1               2.12                1.2
     5.6.2               4.5                 2.11                1.1
     5.6.1               4.4.1               2.10                1.0
     5.6                 4.4                 2.9                 0.9.2
     5.5.1               4.3.1               2.8                 0.9.1
     5.5                 4.3                 2.7                 0.9
     5.4.1               4.2.1               2.6                 0.8
     5.4                 4.2                 2.5                 0.7
     5.3.1               4.1                 2.4

================================================================================
+ - local version
* - installed
> - currently in use
================================================================================
```


```
mysql doc-centos-7-6-18-10-mysql-dbeaver ~$sdk install gradle

Downloading: gradle 6.4.1

In progress...

######################################################################## 100.0%

Installing: gradle 6.4.1
Done installing!


Setting gradle 6.4.1 as default.
mysql doc-centos-7-6-18-10-mysql-dbeaver ~$sdk install gradle 6.1.1

Downloading: gradle 6.1.1

In progress...

######################################################################## 100.0%

Installing: gradle 6.1.1
Done installing!


Setting gradle 6.1.1 as default.

```


一度ダウンロードしたらアーカイブされる

これも実行者単位

```
mysql doc-centos-7-6-18-10-mysql-dbeaver ~$find / -name "*gradle*" 2>/dev/null | grep archive
/home/mysql/.sdkman/archives/gradle-6.1.1.zip
/home/mysql/.sdkman/archives/gradle-6.4.1.zip
```

```
mysql doc-centos-7-6-18-10-mysql-dbeaver ~$find / -type f -name "*gradle" 2>/dev/null
/home/mysql/.sdkman/candidates/gradle/6.1.1/bin/gradle
/home/mysql/.sdkman/candidates/gradle/6.4.1/bin/gradle

mysql doc-centos-7-6-18-10-mysql-dbeaver ~$/home/mysql/.sdkman/candidates/gradle/6.4.1/bin/gradle -version

Welcome to Gradle 6.4.1!

Here are the highlights of this release:
 - Support for building, testing and running Java Modules
 - Precompiled script plugins for Groovy DSL
 - Single dependency lock file per project

For more details see https://docs.gradle.org/6.4.1/release-notes.html


------------------------------------------------------------
Gradle 6.4.1
------------------------------------------------------------

Build time:   2020-05-15 19:43:40 UTC
Revision:     1a04183c502614b5c80e33d603074e0b4a2777c5

Kotlin:       1.3.71
Groovy:       2.5.10
Ant:          Apache Ant(TM) version 1.10.7 compiled on September 1 2019
JVM:          11 (Oracle Corporation 11+28)
OS:           Linux 3.10.0-1062.el7.x86_64 amd64

mysql doc-centos-7-6-18-10-mysql-dbeaver ~$/home/mysql/.sdkman/candidates/gradle/6.1.1/bin/gradle -version

Welcome to Gradle 6.1.1!

Here are the highlights of this release:
 - Reusable dependency cache
 - Configurable compilation order between Groovy/Kotlin/Java/Scala
 - New sample projects in Gradle's documentation

For more details see https://docs.gradle.org/6.1.1/release-notes.html


------------------------------------------------------------
Gradle 6.1.1
------------------------------------------------------------

Build time:   2020-01-24 22:30:24 UTC
Revision:     a8c3750babb99d1894378073499d6716a1a1fa5d

Kotlin:       1.3.61
Groovy:       2.5.8
Ant:          Apache Ant(TM) version 1.10.7 compiled on September 1 2019
JVM:          11 (Oracle Corporation 11+28)
OS:           Linux 3.10.0-1062.el7.x86_64 amd64

```


短く実行したい場合はパス通す

```
export GRADLE_HOME=/home/mysql/.sdkman/candidates/gradle/6.1.1
export PATH=$GRADLE_HOME/bin:$PATH
```
