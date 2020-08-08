- REF

  - https://ja.stackoverflow.com/questions/34510/maven-%E3%81%AE-pom-xml-%E3%81%AB%E5%AF%BE%E3%81%97%E3%81%A6-xmllint-%E3%81%AE-xpath-%E3%81%A7%E8%A6%81%E7%B4%A0%E3%82%92%E6%8B%BE%E3%81%86%E3%81%93%E3%81%A8%E3%81%8C%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84

- IN

```
$ cat pom.xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>app</groupId>
  <artifactId>nnn</artifactId>
  <version>0.1.0</version>

  <parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>2.2.4.RELEASE</version>
    <relativePath/> <!-- lookup parent from repository -->
  </parent>

  <dependencies>
    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-webflux</artifactId>
    </dependency>

    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-test</artifactId>
      <scope>test</scope>
    </dependency>

    <dependency>
      <groupId>io.projectreactor</groupId>
      <artifactId>reactor-test</artifactId>
      <scope>test</scope>
    </dependency>
  </dependencies>

  <properties>
    <java.version>1.8</java.version>
  </properties>

  <build>
    <plugins>
      <plugin>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-maven-plugin</artifactId>
      </plugin>
    </plugins>
  </build>

</project>
```

- CMD

```
$ echo "cat //*[local-name()='project']/*[local-name()='parent']/*[local-name()='version']" | xmllint --shell pom.xml | sed '/^\/ >/d' | sed 's/<[^>]*.//g'
```

- OUT

```
2.2.4.RELEASE
```

- CMD

```
$ echo "cat //*[name()='project']/*[name()='parent']/*[name()='version']" | xmllint --shell pom.xml | sed '/^\/ >/d' | sed 's/<[^>]*.//g'
```

- OUT

```
2.2.4.RELEASE
```


- CMD

```
$ xmllint --xpath "/*[name()='project']/*[name()='parent']" pom.xml | xmllint --format -
```

- OUT


```
<?xml version="1.0"?>
<parent>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-parent</artifactId>
  <version>2.2.4.RELEASE</version>
  <relativePath/>
  <!-- lookup parent from repository -->
</parent>
```


- CMD

```
$ xmllint --xpath "/*[name()='project']/*[name()='dependencies']" pom.xml | xmllint --format -
```


- OUT

```
<?xml version="1.0"?>
<dependencies>
  <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-webflux</artifactId>
  </dependency>
  <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-test</artifactId>
    <scope>test</scope>
  </dependency>
  <dependency>
    <groupId>io.projectreactor</groupId>
    <artifactId>reactor-test</artifactId>
    <scope>test</scope>
  </dependency>
</dependencies>
```


- CMD
  - ポジション未対応
```
$ cat pom.xml | xml el | ruby -F/ -anle 'puts $F.map{|x| "\x27"+x+"\x27"}.join("]/*[name()=")' | sed 's_^_/*[name()=_;s_$_]_'
```

- OUT

  - テキストかテキストでないか
```
$ cat pom.xml | xml el | ruby -F/ -anle 'puts $F.map{|x| "\x27"+x+"\x27"}.join("]/*[name()=")' | sed 's_^_/*[name()=_;s_$_]_'
/*[name()='project']
/*[name()='project']/*[name()='modelVersion']
/*[name()='project']/*[name()='groupId']
/*[name()='project']/*[name()='artifactId']
/*[name()='project']/*[name()='version']
/*[name()='project']/*[name()='parent']
/*[name()='project']/*[name()='parent']/*[name()='groupId']
/*[name()='project']/*[name()='parent']/*[name()='artifactId']
/*[name()='project']/*[name()='parent']/*[name()='version']
/*[name()='project']/*[name()='parent']/*[name()='relativePath']
/*[name()='project']/*[name()='dependencies']
/*[name()='project']/*[name()='dependencies']/*[name()='dependency']
/*[name()='project']/*[name()='dependencies']/*[name()='dependency']/*[name()='groupId']
/*[name()='project']/*[name()='dependencies']/*[name()='dependency']/*[name()='artifactId']
/*[name()='project']/*[name()='dependencies']/*[name()='dependency']
/*[name()='project']/*[name()='dependencies']/*[name()='dependency']/*[name()='groupId']
/*[name()='project']/*[name()='dependencies']/*[name()='dependency']/*[name()='artifactId']
/*[name()='project']/*[name()='dependencies']/*[name()='dependency']/*[name()='scope']
/*[name()='project']/*[name()='dependencies']/*[name()='dependency']
/*[name()='project']/*[name()='dependencies']/*[name()='dependency']/*[name()='groupId']
/*[name()='project']/*[name()='dependencies']/*[name()='dependency']/*[name()='artifactId']
/*[name()='project']/*[name()='dependencies']/*[name()='dependency']/*[name()='scope']
/*[name()='project']/*[name()='properties']
/*[name()='project']/*[name()='properties']/*[name()='java.version']
/*[name()='project']/*[name()='build']
/*[name()='project']/*[name()='build']/*[name()='plugins']
/*[name()='project']/*[name()='build']/*[name()='plugins']/*[name()='plugin']
/*[name()='project']/*[name()='build']/*[name()='plugins']/*[name()='plugin']/*[name()='groupId']
/*[name()='project']/*[name()='build']/*[name()='plugins']/*[name()='plugin']/*[name()='artifactId']
```
