# ファルダ構成

プロジェクトフォルダはjava-normalize

```
$tree java-normalize
java-normalize
|-- JAR-INF
|   |-- META-INF
|   |   `-- MANIFEST.MF
|   |-- app
|   |   |-- Full2Half.class
|   |   `-- Half2Full.class
|   `-- lib
|       `-- icu4j-65.1.jar
|-- manual.md
|-- src
|   `-- app
|       |-- Full2Half.java
|       `-- Half2Full.java
`-- test.txt
```

# クラスファイル作成

javaファイルをコンパイル

プロジェクトフォルダに移動してから実行

```
$javac -cp "JAR-INF/lib/*" -d JAR-INF src/app/*
```

# クラスファイル実行

```
$java -cp "JAR-INF:JAR-INF/lib/*" app.Half2Full test.txt 
ウンコ
ウンコ
$java -cp "JAR-INF:JAR-INF/lib/*" app.Full2Half test.txt 
ｳﾝｺ
ｳﾝｺ
```

# マニュフェストファイル作成

このプロジェクトの場合、実行エントリが不定なので、決め打ちでいいなら、作成

作成する必要なし

```
$cat JAR-INF/META-INF/MANIFEST.MF 
Main-Class: app.DetectEnc
Class-Path: ./JAR-INF/lib/icu4j-65.1.jar

```

# jarファイル作成

割愛

# jarファイル展開

割愛

# jarファイル実行

割愛
