```
//作業ディレクトリの作成
$mkdir -p 00010-java-XMLからJSONへ変換-convert-xml-to-json-DONE-xml2json

//共通部品ファイルのコピー
$cp XXX.java $(find 00010* -type d -name "app" | grep main)

//共通部品コンパイル
$javac -d $(find 00010* -type d -name "nnn")/out -cp "$(find 00010* -type d -name "nnn")/out:$(find $HOME/.m2 -type f -name "*jar"|xargs|tr ' ' ':')" $(find 00010* -name "XXX.java")

//個別部品コンパイル
$javac -d $(find 00010* -type d -name "nnn")/out -cp "$(find 00010* -type d -name "nnn")/out:$(find $HOME/.m2 -type f -name "*jar"|xargs|tr ' ' ':')" $(find 00010* -name "App.java")

//エントリファイル実行
$java -cp "$(find 00010* -type d -name "nnn")/out:$(find $HOME/.m2 -type f -name "*jar"|xargs|tr ' ' ':')" app/App


//ポータブルでないjarファイルビルド

$mvn package
[INFO] Scanning for projects...
[WARNING] 
[WARNING] Some problems were encountered while building the effective model for app:nnn:jar:1.0-SNAPSHOT
[WARNING] 'build.pluginManagement.plugins.plugin.(groupId:artifactId)' must be unique but found duplicate declaration of plugin org.apache.maven.plugins:maven-jar-plugin @ line 77, column 17
[WARNING] 
[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.
[WARNING] 
[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.
[WARNING] 
[INFO] 
[INFO] ------------------------------< app:nnn >-------------------------------
[INFO] Building nnn 1.0-SNAPSHOT
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- maven-resources-plugin:3.0.2:resources (default-resources) @ nnn ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory /home/kuraine/script-sketch/java/00010-java-XMLからJSONへ変換-convert-xml-to-json-DONE-xml2json/nnn/src/main/resources
[INFO] 
[INFO] --- maven-compiler-plugin:3.8.0:compile (default-compile) @ nnn ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 2 source files to /home/kuraine/script-sketch/java/00010-java-XMLからJSONへ変換-convert-xml-to-json-DONE-xml2json/nnn/target/classes
[WARNING] /home/kuraine/script-sketch/java/00010-java-XMLからJSONへ変換-convert-xml-to-json-DONE-xml2json/nnn/src/main/java/app/XXX.java:[8,16] sun.misc.Signalは内部所有のAPIであり、今後のリリースで削除される可能性があります
[WARNING] /home/kuraine/script-sketch/java/00010-java-XMLからJSONへ変換-convert-xml-to-json-DONE-xml2json/nnn/src/main/java/app/XXX.java:[63,13] sun.misc.Signalは内部所有のAPIであり、今後のリリースで削除される可能性があります
[WARNING] /home/kuraine/script-sketch/java/00010-java-XMLからJSONへ変換-convert-xml-to-json-DONE-xml2json/nnn/src/main/java/app/XXX.java:[63,30] sun.misc.Signalは内部所有のAPIであり、今後のリリースで削除される可能性があります
[WARNING] /home/kuraine/script-sketch/java/00010-java-XMLからJSONへ変換-convert-xml-to-json-DONE-xml2json/nnn/src/main/java/app/XXX.java:[64,13] sun.misc.Signalは内部所有のAPIであり、今後のリリースで削除される可能性があります
[WARNING] /home/kuraine/script-sketch/java/00010-java-XMLからJSONへ変換-convert-xml-to-json-DONE-xml2json/nnn/src/main/java/app/XXX.java: sun.misc.Signalは内部所有のAPIであり、今後のリリースで削除される可能性があります
[INFO] 
[INFO] --- maven-resources-plugin:3.0.2:testResources (default-testResources) @ nnn ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] skip non existing resourceDirectory /home/kuraine/script-sketch/java/00010-java-XMLからJSONへ変換-convert-xml-to-json-DONE-xml2json/nnn/src/test/resources
[INFO] 
[INFO] --- maven-compiler-plugin:3.8.0:testCompile (default-testCompile) @ nnn ---
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 1 source file to /home/kuraine/script-sketch/java/00010-java-XMLからJSONへ変換-convert-xml-to-json-DONE-xml2json/nnn/target/test-classes
[INFO] 
[INFO] --- maven-surefire-plugin:2.22.1:test (default-test) @ nnn ---
[INFO] 
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running app.AppTest
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.025 s - in app.AppTest
[INFO] 
[INFO] Results:
[INFO] 
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] 
[INFO] --- maven-jar-plugin:2.4:jar (default-jar) @ nnn ---
[INFO] Building jar: /home/kuraine/script-sketch/java/00010-java-XMLからJSONへ変換-convert-xml-to-json-DONE-xml2json/nnn/target/nnn-1.0-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  1.763 s
[INFO] Finished at: 2020-04-05T20:38:35+09:00
[INFO] ------------------------------------------------------------------------


$jar xf target/nnn-1.0-SNAPSHOT.jar META-INF/MANIFEST.MF

cat META-INF/MANIFEST.MF
Manifest-Version: 1.0
Archiver-Version: Plexus Archiver
Created-By: Apache Maven 3.6.3
Built-By: kuraine
Build-Jdk: 11
Class-Path: lib/json-20190722.jar
Main-Class: app.App


$mvn dependency:copy-dependencies -DoutputDirectory=target/lib -DincludeScope=compile
[INFO] Scanning for projects...
[WARNING] 
[WARNING] Some problems were encountered while building the effective model for app:nnn:jar:1.0-SNAPSHOT
[WARNING] 'build.pluginManagement.plugins.plugin.(groupId:artifactId)' must be unique but found duplicate declaration of plugin org.apache.maven.plugins:maven-jar-plugin @ line 77, column 17
[WARNING] 
[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.
[WARNING] 
[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.
[WARNING] 
[INFO] 
[INFO] ------------------------------< app:nnn >-------------------------------
[INFO] Building nnn 1.0-SNAPSHOT
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- maven-dependency-plugin:2.8:copy-dependencies (default-cli) @ nnn ---
[INFO] Copying json-20190722.jar to /home/kuraine/script-sketch/java/00010-java-XMLからJSONへ変換-convert-xml-to-json-DONE-xml2json/nnn/target/lib/json-20190722.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  0.505 s
[INFO] Finished at: 2020-04-05T20:40:30+09:00
[INFO] ------------------------------------------------------------------------

$tree
.
|-- META-INF
|   `-- MANIFEST.MF
|-- nnn.iml
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
    |-- classes
    |   `-- app
    |       |-- App$1.class
    |       |-- App.class
    |       `-- XXX.class
    |-- generated-sources
    |   `-- annotations
    |-- generated-test-sources
    |   `-- test-annotations
    |-- lib
    |   `-- json-20190722.jar
    |-- maven-archiver
    |   `-- pom.properties
    |-- maven-status
    |   `-- maven-compiler-plugin
    |       |-- compile
    |       |   `-- default-compile
    |       |       |-- createdFiles.lst
    |       |       `-- inputFiles.lst
    |       `-- testCompile
    |           `-- default-testCompile
    |               |-- createdFiles.lst
    |               `-- inputFiles.lst
    |-- nnn-1.0-SNAPSHOT.jar
    |-- surefire-reports
    |   |-- TEST-app.AppTest.xml
    |   `-- app.AppTest.txt
    `-- test-classes
        `-- app
            `-- AppTest.class

28 directories, 22 files


$ls test.xml | java -jar target/nnn-1.0-SNAPSHOT.jar
0:[test.xml, test.json]
$ls
META-INF  nnn.iml  out  pom.xml  src  target  test.json  test.xml


$cat test.json | jq
{
  "agents": {
    "agent": [
      {
        "sex": "Male",
        "name": [
          {
            "type": "first",
            "content": "James"
          },
          {
            "type": "last",
            "content": "Bond"
          }
        ],
        "id": "007",
        "age": "Still attractive"
      },
      {
        "sex": "Yes, please",
        "name": [
          {
            "type": "first",
            "content": "Austin"
          },
          {
            "type": "last",
            "content": "Powers"
          }
        ],
        "id": "013",
        "age": "Depends on your timeline"
      }
    ]
  }
}
```


- この時のpom.xml

差分
```
        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-jar-plugin</artifactId>
          <configuration>
            <archive>
              <manifest>
                <mainClass>app.App</mainClass>
                <!-- Class-Path属性の自動設定 -->
                <addClasspath>true</addClasspath>
                <!-- Class-Path属性で"lib/"などprefixを付けたい時に指定 -->
                <classpathPrefix>lib</classpathPrefix>
              </manifest>
            </archive>
          </configuration>
        </plugin>
```

全量
```
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>app</groupId>
  <artifactId>nnn</artifactId>
  <version>1.0-SNAPSHOT</version>

  <name>nnn</name>
  <!-- FIXME change it to the project's website -->
  <url>http://www.example.com</url>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <maven.compiler.source>1.7</maven.compiler.source>
    <maven.compiler.target>1.7</maven.compiler.target>
  </properties>

  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.11</version>
      <scope>test</scope>
    </dependency>
    <dependency>
      <groupId>org.json</groupId>
      <artifactId>json</artifactId>
      <version>20190722</version>
    </dependency>
  </dependencies>

  <build>
    <pluginManagement><!-- lock down plugins versions to avoid using Maven defaults (may be moved to parent pom) -->
      <plugins>
        <!-- clean lifecycle, see https://maven.apache.org/ref/current/maven-core/lifecycles.html#clean_Lifecycle -->
        <plugin>
          <artifactId>maven-clean-plugin</artifactId>
          <version>3.1.0</version>
        </plugin>
        <!-- default lifecycle, jar packaging: see https://maven.apache.org/ref/current/maven-core/default-bindings.html#Plugin_bindings_for_jar_packaging -->
        <plugin>
          <artifactId>maven-resources-plugin</artifactId>
          <version>3.0.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-compiler-plugin</artifactId>
          <version>3.8.0</version>
        </plugin>
        <plugin>
          <artifactId>maven-surefire-plugin</artifactId>
          <version>2.22.1</version>
        </plugin>
        <plugin>
          <artifactId>maven-jar-plugin</artifactId>
          <version>3.0.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-install-plugin</artifactId>
          <version>2.5.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-deploy-plugin</artifactId>
          <version>2.8.2</version>
        </plugin>
        <!-- site lifecycle, see https://maven.apache.org/ref/current/maven-core/lifecycles.html#site_Lifecycle -->
        <plugin>
          <artifactId>maven-site-plugin</artifactId>
          <version>3.7.1</version>
        </plugin>
        <plugin>
          <artifactId>maven-project-info-reports-plugin</artifactId>
          <version>3.0.0</version>
        </plugin>
        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-jar-plugin</artifactId>
          <configuration>
            <archive>
              <manifest>
                <mainClass>app.App</mainClass>
                <!-- Class-Path属性の自動設定 -->
                <addClasspath>true</addClasspath>
                <!-- Class-Path属性で"lib/"などprefixを付けたい時に指定 -->
                <classpathPrefix>lib</classpathPrefix>
              </manifest>
            </archive>
          </configuration>
        </plugin>
      </plugins>
    </pluginManagement>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-compiler-plugin</artifactId>
        <configuration>
          <source>8</source>
          <target>8</target>
        </configuration>
      </plugin>
    </plugins>
  </build>
</project>
```
