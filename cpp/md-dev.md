- コンパイル

```
$g++ -std=c++11 -o main main.cpp
```

- 実行

```
$ls
.cbp  main  main.cpp
$main
bash: main: command not found
$./main
Hello world!
```

- インストール

```
$echo $PATH
/bin:/usr/local/src/gradle-6.1/bin:/usr/local/src/solr-8.4.1/bin:/usr/local/src/chromium-latest-linux/730479/chrome-linux:/usr/local/src/Komodo-Edit-11/bin:/usr/local/src/apache-maven-3.6.3/bin:/usr/local/src/sts-bundle/sts-3.9.11.RELEASE:/usr/local/src/jetty-distribution-9.4.24.v20191120/bin:/usr/local/src/apache-tomcat-9.0.30/bin:/usr/local/src/jdk-11/bin:/usr/local/src/go/bin:/usr/local/src/jdk-11/bin:/usr/local/src/xml2json:/home/kuraine/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/kuraine/.local/bin
$mv main /home/kuraine/.local/bin/
$ll /home/kuraine/.local/bin/
total 28
drwxr-xr-x. 1 kuraine kuraine 4096  5月  2 12:28 ./
drwxr-xr-x. 1 kuraine kuraine 4096  5月  2 12:20 ../
-rwxr-xr-x. 1 kuraine kuraine 8920  5月  2 12:27 main*
$ls
.cbp  main.cpp
```

動作確認

```
$main
Hello world!
$echo main | main
Hello world!
```
