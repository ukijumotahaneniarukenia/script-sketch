- うまくとりいれたいんだよな
  - https://qiita.com/koduki/items/086d42b5a3c74ed8b59e#forkjoin


```
cd ~/script-sketch/java

javac XXX.java

cd 00001-java-10進数から16進数へ変換_convert_dec_to_hex_DONE_dec2hex

javac -cp .. dec2hex.java

java -cp .:.. dec2hex
```

mvn使おう
  - https://www.qoosky.io/techs/07d7bf8708

```
$mvn archetype:generate -DgroupId=app -DartifactId=00008-java-HTMLページクローリング_crawling_html_page_DONE_crawl -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false


$tree
.
00008-java-HTMLページクローリング_crawling_html_page_DONE_crawl
├── pom.xml
└── src
    ├── main
    │   └── java
    │       └── app
    │           └── App.java
    └── test
        └── java
            └── app
                └── AppTest.java
```
