# 参考文献

https://maven.apache.org/download.cgi


# インストール

jdkが必要

```
$cd /usr/local/src
$curl -LO http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
$tar xvf apache-maven-3.6.3-bin.tar.gz
$cd apache-maven-3.6.3/
$echo 'export MAVEN_HOME=/usr/local/src/apache-maven-3.6.3'>>~/.bashrc
$echo 'export PATH=$PATH:$MAVEN_HOME/bin'>>~/.bashrc
$source ~/.bashrc


$java -version
openjdk version "13" 2019-09-17
OpenJDK Runtime Environment (build 13+33)
OpenJDK 64-Bit Server VM (build 13+33, mixed mode, sharing)

$mvn --version
Apache Maven 3.6.3 (cecedd343002696d0abb50b32b541b8a6ba2883f)
Maven home: /usr/local/src/apache-maven-3.6.3
Java version: 13, vendor: Oracle Corporation, runtime: /usr/local/src/jdk-13
Default locale: ja_JP, platform encoding: UTF-8
OS name: "linux", version: "3.10.0-1062.el7.x86_64", arch: "amd64", family: "unix"
```
