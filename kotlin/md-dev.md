環境

```
$ cat /etc/os-release
NAME="Ubuntu"
VERSION="18.04.4 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.4 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic

$ uname -r
3.10.0-1062.el7.x86_64
```

java インストールしてsdkコマンドインストールしてsdk経由でkotlinいんすこ

```
$ java -version
openjdk version "11" 2018-09-25
OpenJDK Runtime Environment 18.9 (build 11+28)
OpenJDK 64-Bit Server VM 18.9 (build 11+28, mixed mode)

$ kotlin -version
Kotlin version 1.3.72-release-468 (JRE 11+28)
```



```
$ mkdir -p ./00001-kotlin-ハローワールド/nnn/{out,bin}


$ echo '/nnn/bin/* /nnn/out/*  /.idea/* ' | xargs -n1 >./00001-kotlin-ハローワールド/.gitignore

$ find
.
./md-dev.md
./00001-kotlin-ハローワールド
./00001-kotlin-ハローワールド/nnn
./00001-kotlin-ハローワールド/nnn/out
./00001-kotlin-ハローワールド/nnn/bin
./00001-kotlin-ハローワールド/nnn/nnn.iml
./00001-kotlin-ハローワールド/nnn/src
./00001-kotlin-ハローワールド/nnn/src/main.kt
./00001-kotlin-ハローワールド/.idea
./00001-kotlin-ハローワールド/.idea/codeStyles
./00001-kotlin-ハローワールド/.idea/codeStyles/Project.xml
./00001-kotlin-ハローワールド/.idea/codeStyles/codeStyleConfig.xml
./00001-kotlin-ハローワールド/.idea/workspace.xml
./00001-kotlin-ハローワールド/.idea/.gitignore
./00001-kotlin-ハローワールド/.idea/misc.xml
./00001-kotlin-ハローワールド/.idea/libraries
./00001-kotlin-ハローワールド/.idea/libraries/KotlinJavaRuntime.xml
./00001-kotlin-ハローワールド/.idea/vcs.xml
./00001-kotlin-ハローワールド/.idea/.name
./00001-kotlin-ハローワールド/.idea/kotlinc.xml
./00001-kotlin-ハローワールド/.idea/modules.xml
```


実行可能なjarファイルの作成

```
$ cd $HOME/script-sketch/kotlin
$ kotlinc ./00001-kotlin-ハローワールド/nnn/src/main.kt -include-runtime -d ./00001-kotlin-ハローワールド/nnn/bin/main.jar
```


```
$ find
.
./md-dev.md
./00001-kotlin-ハローワールド
./00001-kotlin-ハローワールド/nnn
./00001-kotlin-ハローワールド/nnn/out
./00001-kotlin-ハローワールド/nnn/bin
./00001-kotlin-ハローワールド/nnn/bin/main.jar
./00001-kotlin-ハローワールド/nnn/nnn.iml
./00001-kotlin-ハローワールド/nnn/src
./00001-kotlin-ハローワールド/nnn/src/main.kt
./00001-kotlin-ハローワールド/.idea
./00001-kotlin-ハローワールド/.idea/codeStyles
./00001-kotlin-ハローワールド/.idea/codeStyles/Project.xml
./00001-kotlin-ハローワールド/.idea/codeStyles/codeStyleConfig.xml
./00001-kotlin-ハローワールド/.idea/workspace.xml
./00001-kotlin-ハローワールド/.idea/.gitignore
./00001-kotlin-ハローワールド/.idea/misc.xml
./00001-kotlin-ハローワールド/.idea/libraries
./00001-kotlin-ハローワールド/.idea/libraries/KotlinJavaRuntime.xml
./00001-kotlin-ハローワールド/.idea/vcs.xml
./00001-kotlin-ハローワールド/.idea/.name
./00001-kotlin-ハローワールド/.idea/kotlinc.xml
./00001-kotlin-ハローワールド/.idea/modules.xml
```


実行

```
$ kotlin ./00001-kotlin-ハローワールド/nnn/bin/main.jar
ハロー・ワールドハローキティ
```



実行ディレクトリを移動後、リネームして実行

```

$ cp ./00001-kotlin-ハローワールド/nnn/bin/main.jar $HOME/nnn.jar

$ cd $HOME

$ kotlin main.jar
ハロー・ワールドハローキティ
```
