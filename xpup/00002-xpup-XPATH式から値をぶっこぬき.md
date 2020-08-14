- IN

```
$ cat pom.xml
<?xml version="1.0"?>
<project>
  <modelVersion>4.0.0</modelVersion>
  <groupId>app</groupId>
  <artifactId>nnn</artifactId>
  <version>1.0-SNAPSHOT</version>
  <name>nnn</name>
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
  </dependencies>
  <build>
    <pluginManagement>
      <plugins>
        <plugin>
          <artifactId>maven-clean-plugin</artifactId>
          <version>3.1.0</version>
        </plugin>
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
        <plugin>
          <artifactId>maven-site-plugin</artifactId>
          <version>3.7.1</version>
        </plugin>
        <plugin>
          <artifactId>maven-project-info-reports-plugin</artifactId>
          <version>3.0.0</version>
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


- CMD

```
$ cat pom.json | jq -r --stream -c 'select(.[1]!=null)|.[0]|map(if type=="number" then "["+(.+1|tostring)+"]" else "/"+. end)|join("")' | while read xpath;do echo $xpath;cat pom.xml | xpup "$xpath";done | xargs -n2
```

- OUT

```
/project/modelVersion 4.0.0
/project/groupId app
/project/artifactId nnn
/project/version 1.0-SNAPSHOT
/project/name nnn
/project/url http://www.example.com
/project/properties/project.build.sourceEncoding UTF-8
/project/properties/maven.compiler.source 1.7
/project/properties/maven.compiler.target 1.7
/project/dependencies/dependency/groupId junit
/project/dependencies/dependency/artifactId junit
/project/dependencies/dependency/version 4.11
/project/dependencies/dependency/scope test
/project/build/pluginManagement/plugins/plugin[1]/artifactId maven-clean-plugin
/project/build/pluginManagement/plugins/plugin[1]/version 3.1.0
/project/build/pluginManagement/plugins/plugin[2]/artifactId maven-resources-plugin
/project/build/pluginManagement/plugins/plugin[2]/version 3.0.2
/project/build/pluginManagement/plugins/plugin[3]/artifactId maven-compiler-plugin
/project/build/pluginManagement/plugins/plugin[3]/version 3.8.0
/project/build/pluginManagement/plugins/plugin[4]/artifactId maven-surefire-plugin
/project/build/pluginManagement/plugins/plugin[4]/version 2.22.1
/project/build/pluginManagement/plugins/plugin[5]/artifactId maven-jar-plugin
/project/build/pluginManagement/plugins/plugin[5]/version 3.0.2
/project/build/pluginManagement/plugins/plugin[6]/artifactId maven-install-plugin
/project/build/pluginManagement/plugins/plugin[6]/version 2.5.2
/project/build/pluginManagement/plugins/plugin[7]/artifactId maven-deploy-plugin
/project/build/pluginManagement/plugins/plugin[7]/version 2.8.2
/project/build/pluginManagement/plugins/plugin[8]/artifactId maven-site-plugin
/project/build/pluginManagement/plugins/plugin[8]/version 3.7.1
/project/build/pluginManagement/plugins/plugin[9]/artifactId maven-project-info-reports-plugin
/project/build/pluginManagement/plugins/plugin[9]/version 3.0.0
/project/build/plugins/plugin/groupId org.apache.maven.plugins
/project/build/plugins/plugin/artifactId maven-compiler-plugin
/project/build/plugins/plugin/configuration/source 8
/project/build/plugins/plugin/configuration/target 8
```
