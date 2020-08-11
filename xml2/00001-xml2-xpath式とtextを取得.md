- IN

```
$ cat test.xml
<?xml version="1.0"?>
<project>
  <modelVersion>4.0.0</modelVersion>
  <groupId>app</groupId>
  <artifactId>nnn</artifactId>
  <version>0.1.0</version>
  <parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>2.2.4.RELEASE</version>
    <relativePath />
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
$ cat test.xml | xml2
```

- OUT

```
/project/modelVersion=4.0.0
/project/groupId=app
/project/artifactId=nnn
/project/version=0.1.0
/project/parent/groupId=org.springframework.boot
/project/parent/artifactId=spring-boot-starter-parent
/project/parent/version=2.2.4.RELEASE
/project/parent/relativePath
/project/dependencies/dependency/groupId=org.springframework.boot
/project/dependencies/dependency/artifactId=spring-boot-starter-webflux
/project/dependencies/dependency
/project/dependencies/dependency/groupId=org.springframework.boot
/project/dependencies/dependency/artifactId=spring-boot-starter-test
/project/dependencies/dependency/scope=test
/project/dependencies/dependency
/project/dependencies/dependency/groupId=io.projectreactor
/project/dependencies/dependency/artifactId=reactor-test
/project/dependencies/dependency/scope=test
/project/properties/java.version=1.8
/project/build/plugins/plugin/groupId=org.springframework.boot
/project/build/plugins/plugin/artifactId=spring-boot-maven-plugin
```
