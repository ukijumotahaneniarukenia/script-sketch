- うまくとりいれたいんだよな
  - https://qiita.com/koduki/items/086d42b5a3c74ed8b59e#forkjoin

- コマンドライン仕様
  - https://www.qoosky.io/techs/07d7bf8708
  - ハンディじゃないんだよな
  - アーティファクトIDはnnn
  - アーティファクトIDは日本語名だめk
  - 日本語のフォルダを作成してからテンプレ作成

```
cd ~/script-sketch/java

mkdir 00001-java-10進数から16進数へ変換-convert-dec-to-hex-DONE-dec2hex

cd 00001*

mvn archetype:generate -DgroupId=app -DartifactId=nnn -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

vi $(find 00001* -name "pom.xml")

( cd 00001*/nnn && mvn dependency:copy-dependencies )

cp XXX.java $(find 00001* -type d -name "app" | grep main)

vi $(find 00001* -name "App.java")

javac -d $(find 00001* -type d -name "nnn")/out -cp "$(find 00001* -type d -name "nnn")/out:$(find 00001* -name "dependency")/*" $(find 00001* -name "XXX.java")

javac -d $(find 00001* -type d -name "nnn")/out -cp "$(find 00001* -type d -name "nnn")/out:$(find 00001* -name "dependency")/*" $(find 00001* -name "App.java")

tree 00001*
00001-java-10\351\200\262\346\225\260\343\201\213\343\202\21116\351\200\262\346\225\260\343\201\270\345\244\211\346\217\233-convert-dec-to-hex-DONE-dec2hex
`-- nnn
    |-- out
    |   `-- app
    |       |-- App$1.class
    |       |-- App.class
    |       `-- XXX.class
    |-- pom.xml
    |-- src
    |   |-- main
    |   |   `-- java
    |   |       `-- app
    |   |           |-- App.java
    |   |           `-- XXX.java
    |   `-- test
    |       `-- java
    |           `-- app
    |               `-- AppTest.java
    `-- target
        `-- dependency
            `-- junit-3.8.1.jar

12 directories, 8 files

java -cp "$(find 00001* -name "dependency"):$(find 00001* -type d -name "nnn")/out" app/App

```

- IDE仕様

  - 日本語のフォルダを作成してからテンプレ作成
  - プロジェクト名にnnn
  - プロジェクトのロケーションに/home/kuraine/script-sketch/java/00007-java-クローラー-crawling-DONE-crawl/nnn
  - それ以外はコマンドラインと同じ
  - 外部jarは$HOME/.m2/repository配下にあるのでそれをクラスパスに指定

```
cp XXX.java $(find 00007* -type d -name "app" | grep main)

javac -d $(find 00007* -type d -name "nnn")/out -cp "$(find 00007* -type d -name "nnn")/out:$(find $HOME/.m2 -type f -name "*jar"|xargs|tr ' ' ':')" $(find 00007* -name "XXX.java")

javac -d $(find 00007* -type d -name "nnn")/out -cp "$(find 00007* -type d -name "nnn")/out:$(find $HOME/.m2 -type f -name "*jar"|xargs|tr ' ' ':')" $(find 00007* -name "App.java")

tree 00007-java-クローラー-crawling-DONE-crawl/
00007-java-\343\202\257\343\203\255\343\203\274\343\203\251\343\203\274-crawling-DONE-crawl/
`-- nnn
    |-- nnn.iml
    |-- out
    |   `-- app
    |       |-- App.class
    |       `-- XXX.class
    |-- pom.xml
    `-- src
        |-- main
        |   `-- java
        |       `-- app
        |           |-- App.java
        |           `-- XXX.java
        `-- test
            `-- java
                `-- app
                    `-- AppTest.java

10 directories, 7 files

java -cp "$(find 00007* -type d -name "nnn")/out:$(find $HOME/.m2 -type f -name "*jar"|xargs|tr ' ' ':')" app/App

```
