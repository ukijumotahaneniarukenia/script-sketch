- うまくとりいれたいんだよな
  - https://qiita.com/koduki/items/086d42b5a3c74ed8b59e#forkjoin

mvn使おう
  - https://www.qoosky.io/techs/07d7bf8708
  - ハンディじゃないんだよな
```
mkdir 00007-java-クローラー-crawling-DONE-crawl

cd 00007-java-クローラー-crawling-DONE-crawl

mvn archetype:generate -DgroupId=app -DartifactId=nnn -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

vi $(find 00007* -name "pom.xml")

cd ~/script-sketch/java/00007-java-クローラー-crawling-DONE-crawl/nnn

mvn dependency:copy-dependencies

vi $(find 00007* -name "App.java")

javac -cp ".:$(find 00007* -name "dependency")/*" $(find 00007* -name "App.java")

javac -cp "." $(find 00001* -name "App.java")

$tree 00007-java-クローラー-crawling-DONE-crawl
00007-java-クローラー-crawling-DONE-crawl
└── nnn
    ├── pom.xml
    ├── src
    │   ├── main
    │   │   └── java
    │   │       └── app
    │   │           ├── App$1.class
    │   │           ├── App.class
    │   │           └── App.java
    │   └── test
    │       └── java
    │           └── app
    │               └── AppTest.java
    └── target
        └── dependency
            ├── jsoup-1.12.2.jar
            └── junit-3.8.1.jar

10 directories, 7 files

java -cp ".:$(find 00007* -name "dependency"):$(find 00007* -name "app"|grep main)" App

java -cp ".:$(find 00001* -name "app"|grep main)" App
```
