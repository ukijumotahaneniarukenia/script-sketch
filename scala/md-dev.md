
- https://scala-text.github.io/scala_text/basic.html
- sbtがパッケージ管理ツール
```
$sbt console
```


```
scala> println("unko")
unko

```

- VERSION

```
$scala --version
Scala code runner version 2.13.1 -- Copyright 2002-2019, LAMP/EPFL and Lightbend, Inc.
```

- MAN

```
$cd ~/script-sketch/scala
$mkdir -p 00001-scala-標準入力
$cd 00001-scala-標準入力
$echo 'scalaVersion:="2.13.1"' >build.sbt
$touch main.scala
$cat <<EOS
import scala.io.StdIn.readLine

object main {
  def main(args: Array[String]) = {
    println("うんこ")
  }
}
EOS
```

- コンパイル

```
$scalac main.scala
```

```
$ll
total 28
drwxr-xr-x. 2 kuraine kuraine 4096  4月  4 13:32  ./
drwxr-xr-x. 3 kuraine kuraine 4096  4月  4 12:56  ../
-rw-r--r--. 1 kuraine kuraine   26  4月  4 13:29  .gitignore
-rw-r--r--. 1 kuraine kuraine   23  4月  4 12:57  build.sbt
-rw-r--r--. 1 kuraine kuraine  661  4月  4 13:32 'main$.class'
-rw-r--r--. 1 kuraine kuraine  593  4月  4 13:32  main.class
-rw-r--r--. 1 kuraine kuraine  113  4月  4 13:32  main.scala
```

- 実行
```
$scala main
うんこ
```
