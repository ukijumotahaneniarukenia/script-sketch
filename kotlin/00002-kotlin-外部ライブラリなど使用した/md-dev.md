外部ライブラリというより、Cとかの親和性が高い的な意味でネイティブ。

使い勝手的なのはkotlinの文法で、単一実行可能なコマンドラインアプリなどがハンディに作れるということか。

```
$ mkdir -p 00002-kotlin-外部ライブラリなど使用した

$ echo '/.idea/* /.gradle/* /gradle/wrapper/*' | xargs -n1 >.gitignore



```


ビルド



```

$ ./gradlew runDebugExecutableLinux | tee log

```


実行バイナリ

```

$ ls -lh ./nnn/build/bin/linux/debugExecutable/nnn.kexe
-rwxr-xr-x. 1 kuraine kuraine 791K  5月 29 22:39 ./nnn/build/bin/linux/debugExecutable/nnn.kexe




$ ./nnn/build/bin/linux/debugExecutable/nnn.kexe
Hello, Kotlin/Native!

```



ポータブルか

```

$ mv ./nnn/build/bin/linux/debugExecutable/nnn.kexe $HOME/.local/bin/nnn


$ export PATH=$HOME/.local/bin:$PATH





```


ポータブル

```

$ nnn
Hello, Kotlin/Native!

```


