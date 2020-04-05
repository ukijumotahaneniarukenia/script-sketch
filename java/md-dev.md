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



- 外部ライブラリ依存がない実行可能jarの作成

  - コマンドラインのみ

```
$cd ~/script-sketch/java/00002-java-10進数から16進数へ変換-実行可能なjar-convert-dec-to-hex-DONE-dec2hex/nnn

$touch 00002-java-10進数から16進数へ変換-実行可能なjar-convert-dec-to-hex-DONE-dec2hex/nnn/manifest.txt

$cat << EOS >00002-java-10進数から16進数へ変換-実行可能なjar-convert-dec-to-hex-DONE-dec2hex/nnn/manifest.txt
Manifest-Version: 1.0
Main-Class: app.App

EOS
$tree 00002*
00002-java-10\351\200\262\346\225\260\343\201\213\343\202\21116\351\200\262\346\225\260\343\201\270\345\244\211\346\217\233-\345\256\237\350\241\214\345\217\257\350\203\275\343\201\252jar-convert-dec-to-hex-DONE-dec2hex
`-- nnn
    |-- dec2hex.jar
    |-- manifest.txt
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

12 directories, 10 files

//マニュフェストファイルがある場所で実行
$jar cvfm dec2hex.jar manifest.txt -C out app

$jar tf 00002-java-10進数から16進数へ変換-実行可能なjar-convert-dec-to-hex-DONE-dec2hex/nnn/dec2hex.jar
META-INF/
META-INF/MANIFEST.MF
app/
app/XXX.class
app/App$1.class
app/App.class

//マニュフェストファイルの内容を出力
$jar xf 00002-java-10進数から16進数へ変換-実行可能なjar-convert-dec-to-hex-DONE-dec2hex/nnn/dec2hex.jar META-INF/MANIFEST.MF

$java -jar 00002-java-10進数から16進数へ変換-実行可能なjar-convert-dec-to-hex-DONE-dec2hex/nnn/dec2hex.jar
^C
Usage:
seq 17 | java App

$seq 17 | java -jar 00002-java-10進数から16進数へ変換-実行可能なjar-convert-dec-to-hex-DONE-dec2hex/nnn/dec2hex.jar
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


- 実行可能jarで外部ライブラリの依存ありポータブルでない

```
$mkdir -p 00008-java-クローラー-実行可能なjar外部依存あり-crawling-DONE-crawl/nnn/target/dependency

$find ~/.m2/repository -maxdepth 1 -type d | xargs -I@ echo cp -r @ 00008-java-クローラー-実行可能なjar外部依存あり-crawling-DONE-crawl/nnn/target/dependency | sh

$javac -d $(find 00008* -type d -name "nnn")/out -cp "$(find 00008* -type d -name "nnn")/out:$(find 00008-java-クローラー-実行可能なjar外部依存あり-crawling-DONE-crawl -type f -name "*jar"|xargs|tr ' ' ':')" $(find 00008* -name "XXX.java")

$javac -d $(find 00008* -type d -name "nnn")/out -cp "$(find 00008* -type d -name "nnn")/out:$(find 00008-java-クローラー-実行可能なjar外部依存あり-crawling-DONE-crawl -type f -name "*jar"|xargs|tr ' ' ':')" $(find 00008* -name "App.java")

$cat manifest.txt
Manifest-Version: 1.0
Main-Class: app.App
Class-Path: ./target/dependency/jsoup-1.12.2.jar


$jar cvfm crawl.jar manifest.txt -C out app target/
マニフェストが追加されました
app/を追加中です(入=0)(出=0)(0%格納されました)
app/XXX.classを追加中です(入=5107)(出=2182)(57%収縮されました)
app/App$1.classを追加中です(入=277)(出=222)(19%収縮されました)
app/App.classを追加中です(入=3266)(出=1641)(49%収縮されました)
app/AppTest.classを追加中です(入=373)(出=275)(26%収縮されました)
target/を追加中です(入=0)(出=0)(0%格納されました)
target/dependency/を追加中です(入=0)(出=0)(0%格納されました)
target/dependency/jsoup-1.12.2.jarを追加中です(入=391231)(出=362437)(7%収縮されました)

$jar tf crawl.jar
META-INF/
META-INF/MANIFEST.MF
app/
app/XXX.class
app/App$1.class
app/App.class
app/AppTest.class
target/
target/dependency/
target/dependency/jsoup-1.12.2.jar

$jar xf crawl.jar META-INF/MANIFEST.MF

$cat META-INF/MANIFEST.MF
Manifest-Version: 1.0
Main-Class: app.App
Class-Path: ./target/dependency/jsoup-1.12.2.jar
Created-By: 11 (Oracle Corporation)

echo 'https://ukijumotahaneniarukenia.site/ a[href]' | java -jar crawl.jar
```


- 実行可能jarで外部ライブラリの依存ありポータブルである
  - maven使う
  - https://www.glamenv-septzen.net/view/1121
```


```
