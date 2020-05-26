バージョン

```
$java --version
openjdk 11 2018-09-25
OpenJDK Runtime Environment 18.9 (build 11+28)
OpenJDK 64-Bit Server VM 18.9 (build 11+28, mixed mode)
```

ディレクトリ構成

```
$find
.
./nnn
./nnn/nnn.iml
./nnn/.idea
./nnn/.idea/compiler.xml
./nnn/.idea/workspace.xml
./nnn/.idea/misc.xml
./nnn/.idea/encodings.xml
./nnn/pom.xml
./nnn/src
./nnn/src/main
./nnn/src/main/java
./nnn/src/main/java/app
./nnn/src/main/java/app/App.java
./nnn/src/test
./nnn/src/test/java
./nnn/src/test/java/app
./nnn/src/test/java/app/AppTest.java
```

コンパイル

```
doc-ubuntu-19-10-vim (kuraine)  21:53:52  IdeaProjects   cd nnn/src/main/java
doc-ubuntu-19-10-vim (kuraine)  21:54:11  java   ls
app
doc-ubuntu-19-10-vim (kuraine)  21:54:13  java   javac app/App.java 
doc-ubuntu-19-10-vim (kuraine)  21:54:20  java   find
.
./app
./app/App.java
./app/App.class
```

実行

```
doc-ubuntu-19-10-vim (kuraine)  21:54:25  java   java app/App
Hello World!
```

コマンドライン引数からjar作成できる

```
$jar --create --file app.jar --main-class app/App app/App.class
find
.
./app
./app/App.java
./app/App.class
./app.jar
```

jarファイルで実行

```
$java -jar app.jar
Hello World!
```

依存関係をチェック

```
$jdeps --list-deps app.jar
   java.base
```


jre作成

```
$find $JAVA_HOME -type d | grep jmods
/usr/local/src/jdk-11/jmods


$jlink --compress=2 --module-path "$(find $JAVA_HOME -type d | grep jmods)" --add-modules java.base --output min-jre
$find
.
./app
./app/App.java
./app/App.class
./min-jre
./min-jre/legal
./min-jre/legal/java.base
./min-jre/legal/java.base/ASSEMBLY_EXCEPTION
./min-jre/legal/java.base/LICENSE
./min-jre/legal/java.base/icu.md
./min-jre/legal/java.base/public_suffix.md
./min-jre/legal/java.base/aes.md
./min-jre/legal/java.base/unicode.md
./min-jre/legal/java.base/asm.md
./min-jre/legal/java.base/ADDITIONAL_LICENSE_INFO
./min-jre/legal/java.base/cldr.md
./min-jre/legal/java.base/c-libutl.md
./min-jre/include
./min-jre/include/jni.h
./min-jre/include/linux
./min-jre/include/linux/jni_md.h
./min-jre/include/classfile_constants.h
./min-jre/include/jvmticmlr.h
./min-jre/include/jvmti.h
./min-jre/bin
./min-jre/bin/java
./min-jre/bin/keytool
./min-jre/release
./min-jre/lib
./min-jre/lib/libzip.so
./min-jre/lib/server
./min-jre/lib/server/Xusage.txt
./min-jre/lib/server/libjsig.so
./min-jre/lib/server/libjvm.so
./min-jre/lib/libnio.so
./min-jre/lib/libjsig.so
./min-jre/lib/tzdb.dat
./min-jre/lib/jexec
./min-jre/lib/libjimage.so
./min-jre/lib/libverify.so
./min-jre/lib/security
./min-jre/lib/security/default.policy
./min-jre/lib/security/blacklisted.certs
./min-jre/lib/security/public_suffix_list.dat
./min-jre/lib/security/cacerts
./min-jre/lib/libjava.so
./min-jre/lib/modules
./min-jre/lib/libnet.so
./min-jre/lib/classlist
./min-jre/lib/jvm.cfg
./min-jre/lib/jrt-fs.jar
./min-jre/lib/jli
./min-jre/lib/jli/libjli.so
./min-jre/conf
./min-jre/conf/net.properties
./min-jre/conf/security
./min-jre/conf/security/java.policy
./min-jre/conf/security/policy
./min-jre/conf/security/policy/README.txt
./min-jre/conf/security/policy/unlimited
./min-jre/conf/security/policy/unlimited/default_local.policy
./min-jre/conf/security/policy/unlimited/default_US_export.policy
./min-jre/conf/security/policy/limited
./min-jre/conf/security/policy/limited/exempt_local.policy
./min-jre/conf/security/policy/limited/default_local.policy
./min-jre/conf/security/policy/limited/default_US_export.policy
./min-jre/conf/security/java.security
./app.jar
```

パスを消して作成したjreで実行する

```
$export PATH=$JAVA_HOME/bin:$PATH



$echo $JAVA_HOME/
/usr/local/src/jdk-11/

$unset JAVA_HOME
$echo $JAVA_HOME/
/

$export JAVA_HOME=min-jre



$java -jar app.jar
Hello World!
```
