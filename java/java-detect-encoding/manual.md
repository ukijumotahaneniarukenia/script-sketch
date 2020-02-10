# ファルダ構成

```
$tree java-detect-encoding
java-detect-encoding
|-- JAR-INF
|   |-- META-INF
|   |   `-- MANIFEST.MF
|   |-- app
|   |   `-- DetectEnc.class
|   `-- lib
|       `-- icu4j-65.1.jar
|-- detect-enc.jar
|-- manual.md
|-- pom.xml
`-- src
    `-- app
        `-- DetectEnc.java
```

# クラスファイル作成

javaファイルをコンパイル

プロジェクトのフォルダに移動してから実行

```
$cd java-detect-encoding
$javac -cp "JAR-INF/lib/*" -d JAR-INF src/app/*
```

# クラスファイル実行

```
$cd java-detect-encoding
$java -cp "JAR-INF:JAR-INF/lib/*" app.DetectEnc
```

# マニュフェストファイル作成

```
$cat JAR-INF/META-INF/MANIFEST.MF 
Main-Class: app.DetectEnc
Class-Path: ./JAR-INF/lib/icu4j-65.1.jar

```

# jarファイル作成

```
$cd java-detect-encoding
$jar cvfm detect-enc.jar JAR-INF/META-INF/MANIFEST.MF -C JAR-INF .
マニフェストが追加されました
app/を追加中です(入=0)(出=0)(0%格納されました)
app/DetectEnc.classを追加中です(入=1085)(出=644)(40%収縮されました)
エントリMETA-INF/を無視します
エントリMETA-INF/MANIFEST.MFを無視します
lib/を追加中です(入=0)(出=0)(0%格納されました)
lib/icu4j-65.1.jarを追加中です(入=12901874)(出=12028108)(6%収縮されました)
```

# jarファイル展開

```
$jar tf detect-enc.jar 
META-INF/
META-INF/MANIFEST.MF
app/
app/DetectEnc.class
lib/
lib/icu4j-65.1.jar
```

# jarファイル実行

```
$java -jar detect-enc.jar 
UTF-8
```
