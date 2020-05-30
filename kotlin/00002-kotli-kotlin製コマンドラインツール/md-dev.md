外部ライブラリというより、Cとかヘッダファイルのライブラリを使えるという意味でネイティブ。

使い勝手的なのはkotlinの文法で、単一実行可能なコマンドラインアプリなどがハンディに作れるということか。

- https://kotlinlang.org/docs/reference/native-overview.html

```
$ gradle -version

------------------------------------------------------------
Gradle 6.4.1
------------------------------------------------------------

Build time:   2020-05-15 19:43:40 UTC
Revision:     1a04183c502614b5c80e33d603074e0b4a2777c5

Kotlin:       1.3.71
Groovy:       2.5.10
Ant:          Apache Ant(TM) version 1.10.7 compiled on September 1 2019
JVM:          11 (Oracle Corporation 11+28)
OS:           Linux 3.10.0-1062.el7.x86_64 amd64

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

手順

```
$ mkdir -p 00002-kotli-kotlin製コマンドラインツール

$ cd 00002-kotli-kotlin製コマンドラインツール

$ echo '/.idea/* ' | xargs -n1 >.gitignore

$ tree
.
├── gradle.properties
├── nnn
│   ├── build.gradle
│   ├── gradle
│   │   └── wrapper
│   │       └── gradle-wrapper.properties
│   └── src
│       ├── linuxMain
│       │   └── kotlin
│       │       └── sample
│       │           └── SampleLinux.kt
│       └── linuxTest
│           └── kotlin
│               └── sample
│                   └── SampleTests.kt
└── settings.gradle

10 directories, 6 files

$ cd nnn

buikd.gradleファイルが存在しているディレクトリでビルド

$ ls
build.gradle  gradle  src


$ gradle runReleaseExecutableLinux

> Configure project :nnn
Kotlin Multiplatform Projects are an experimental feature.

> Task :nnn:runReleaseExecutableLinux
Hello, Kotlin/Native!

BUILD SUCCESSFUL in 25s
2 actionable tasks: 2 executed


$ find
.
./build
./build/bin
./build/bin/linux
./build/bin/linux/releaseExecutable
./build/bin/linux/releaseExecutable/nnn.kexe
./gradle
./gradle/wrapper
./gradle/wrapper/gradle-wrapper.properties
./build.gradle
./src
./src/linuxTest
./src/linuxTest/kotlin
./src/linuxTest/kotlin/sample
./src/linuxTest/kotlin/sample/SampleTests.kt
./src/linuxMain
./src/linuxMain/kotlin
./src/linuxMain/kotlin/sample
./src/linuxMain/kotlin/sample/SampleLinux.kt

$ tree
.
├── build
│   └── bin
│       └── linux
│           └── releaseExecutable
│               └── nnn.kexe
├── build.gradle
├── gradle
│   └── wrapper
│       └── gradle-wrapper.properties
└── src
    ├── linuxMain
    │   └── kotlin
    │       └── sample
    │           └── SampleLinux.kt
    └── linuxTest
        └── kotlin
            └── sample
                └── SampleTests.kt

13 directories, 5 files


実行バイナリ

$ ls -lh ./build/bin/linux/releaseExecutable/nnn.kexe
-rwxr-xr-x. 1 kuraine kuraine 341K  5月 30 15:24 ./build/bin/linux/releaseExecutable/nnn.kexe


$ ./build/bin/linux/releaseExecutable/nnn.kexe
Hello, Kotlin/Native!


ポータブルか
$ mv ./build/bin/linux/releaseExecutable/nnn.kexe $HOME/.local/bin/nnn


$ export PATH=$HOME/.local/bin:$PATH


ポータブル

$ nnn
Hello, Kotlin/Native!

```
