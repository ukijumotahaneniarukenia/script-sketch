https://www.graalvm.org/getting-started/

https://www.graalvm.org/docs/getting-started/linux

https://github.com/graalvm/graalvm-ce-builds/releases

https://www.graalvm.org/docs/reference-manual/native-image/

インストール

```
cd /home/aine/media

mv graalvm-ce-java11-linux-amd64-20.1.0.tar.gz /usr/local/src

cd graalvm-ce-java11-20.1.0/

echo "export GRAALVM_HOME=/usr/local/src/graalvm-ce-java11-20.1.0" >>$HOME/.bashrc
echo 'export PATH=$GRAALVM_HOME/bin:$PATH' >>$HOME/.bashrc

$ gu --version
GraalVM Updater 20.1.0


$ gu install native-image


$ native-image --version
GraalVM Version 20.1.0 (Java Version 11.0.7)

```


外部ライブラリ依存ありでhttpsプロトコルを使用する際のnativeバイナリ化

```

mkdir wrksp
cd wrksp/
cp /home/kuraine/script-sketch/java/00009-java-クローラー-実行可能なjar外部依存ありポータブル/nnn/target/nnn-1.0-SNAPSHOT-bin.tar.bz2 .

tree -ugh
.
└── [kuraine  kuraine  355K]  nnn-1.0-SNAPSHOT-bin.tar.bz2

0 directories, 1 file

tar xvf nnn-1.0-SNAPSHOT-bin.tar.bz2
nnn-1.0-SNAPSHOT/jsoup-1.12.2.jar
nnn-1.0-SNAPSHOT/nnn-1.0-SNAPSHOT.jar

tree -ugh
.
├── [kuraine  kuraine  4.0K]  nnn-1.0-SNAPSHOT
│   ├── [kuraine  kuraine  382K]  jsoup-1.12.2.jar
│   └── [kuraine  kuraine  3.3K]  nnn-1.0-SNAPSHOT.jar
└── [kuraine  kuraine  355K]  nnn-1.0-SNAPSHOT-bin.tar.bz2

1 directory, 3 files


httpsなどはオプションで明示的に有効化しないとだめぽい

$ native-image --enable-https -jar nnn-1.0-SNAPSHOT/nnn-1.0-SNAPSHOT.jar testcmd
Build on Server(pid: 2166, port: 34702)*
[testcmd:2166]    classlist:     876.81 ms,  0.96 GB
[testcmd:2166]        (cap):     503.94 ms,  0.96 GB
[testcmd:2166]        setup:   1,318.88 ms,  0.96 GB
WARNING GR-10238: VarHandle for static field is currently not fully supported. Static field private static volatile java.lang.System$Logger jdk.internal.event.EventHelper.securityLogger is not properly marked for Unsafe access!
[testcmd:2166]     (clinit):     244.22 ms,  2.29 GB
[testcmd:2166]   (typeflow):   8,086.06 ms,  2.29 GB
[testcmd:2166]    (objects):  10,602.17 ms,  2.29 GB
[testcmd:2166]   (features):     462.06 ms,  2.29 GB
[testcmd:2166]     analysis:  19,849.97 ms,  2.29 GB
[testcmd:2166]     universe:     485.72 ms,  2.30 GB
[testcmd:2166]      (parse):   1,032.58 ms,  2.30 GB
[testcmd:2166]     (inline):   1,775.50 ms,  3.47 GB
[testcmd:2166]    (compile):   9,044.70 ms,  4.82 GB
[testcmd:2166]      compile:  12,637.07 ms,  4.82 GB
[testcmd:2166]        image:   1,279.80 ms,  4.82 GB
[testcmd:2166]        write:     341.81 ms,  4.82 GB
[testcmd:2166]      [total]:  36,925.83 ms,  4.82 GB

結構でかくなる

tree -ugh
.
├── [kuraine  kuraine  4.0K]  nnn-1.0-SNAPSHOT
│   ├── [kuraine  kuraine  382K]  jsoup-1.12.2.jar
│   └── [kuraine  kuraine  3.3K]  nnn-1.0-SNAPSHOT.jar
├── [kuraine  kuraine  355K]  nnn-1.0-SNAPSHOT-bin.tar.bz2
└── [kuraine  kuraine   24M]  testcmd

1 directory, 4 files


ポータブル化




$ mv testcmd $HOME/.local/bin/
$ rm -rf *

うまくじっこうできている

$ testcmd | head
ukijumotahaneniarukenia – Just another WordPress site
	https://ukijumotahaneniarukenia.site#content
	https://ukijumotahaneniarukenia.site/
	https://ukijumotahaneniarukenia.site/
	https://ukijumotahaneniarukenia.site/2020/04/30/javalang%e3%81%ae%e7%89%b9%e5%ae%9a%e3%81%ae%e3%82%af%e3%83%a9%e3%82%b9%e3%81%8b%e3%82%89%e3%83%a1%e3%82%bf%e6%83%85%e5%a0%b1%e3%82%92%e3%82%af%e3%83%ad%e3%82%b9%e3%83%86%e3%83%bc%e3%83%96%e3%83%ab/
	https://ukijumotahaneniarukenia.site/author/ukijumotahaneniarukenia/
	https://ukijumotahaneniarukenia.site/2020/04/30/javalang%e3%81%ae%e7%89%b9%e5%ae%9a%e3%81%ae%e3%82%af%e3%83%a9%e3%82%b9%e3%81%8b%e3%82%89%e3%83%a1%e3%82%bf%e6%83%85%e5%a0%b1%e3%82%92%e3%82%af%e3%83%ad%e3%82%b9%e3%83%86%e3%83%bc%e3%83%96%e3%83%ab/#respond
	https://ukijumotahaneniarukenia.site/category/%e6%9c%aa%e5%88%86%e9%a1%9e/
	https://ukijumotahaneniarukenia.site/2020/04/30/javalang%e3%81%ae%e7%89%b9%e5%ae%9a%e3%81%ae%e3%82%af%e3%83%a9%e3%82%b9%e3%81%8b%e3%82%89%e3%83%a1%e3%82%bf%e6%83%85%e5%a0%b1%e3%82%92%e3%82%af%e3%83%ad%e3%82%b9%e3%83%86%e3%83%bc%e3%83%96%e3%83%ab/
	https://ukijumotahaneniarukenia.site/2019/07/23/python-install/

```
