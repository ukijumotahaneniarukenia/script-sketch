- うまくとりいれたいんだよな
  - https://qiita.com/koduki/items/086d42b5a3c74ed8b59e#forkjoin

mvn使おう
  - https://www.qoosky.io/techs/07d7bf8708
  - ハンディじゃないんだよな
```
$cd ~/script-sketch/java

$mvn archetype:generate -DgroupId=app -DartifactId=00001-java-10進数から2進数へ変換_convert_dec_to_hex_DONE_dec2hex -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

$cd ~/script-sketch/java

$javac $(find 00001-java-10進数から2進数へ変換_convert_dec_to_hex_DONE_dec2hex -name "App.java")

$tree 00001-java-10進数から2進数へ変換_convert_dec_to_hex_DONE_dec2hex
00001-java-10進数から2進数へ変換_convert_dec_to_hex_DONE_dec2hex
├── pom.xml
└── src
    ├── main
    │   └── java
    │       └── app
    │           ├── App$1.class
    │           ├── App.class
    │           └── App.java
    └── test
        └── java
            └── app
                └── AppTest.java

7 directories, 5 files

$java -cp .:00001-java-10進数から2進数へ変換_convert_dec_to_hex_DONE_dec2hex/src/main/java/app App

$seq 17 | java -cp .:00001-java-10進数から2進数へ変換_convert_dec_to_hex_DONE_dec2hex/src/main/java/app App
1
2
3
4
5
6
7
8
9
a
b
c
d
e
f
10
11
```
