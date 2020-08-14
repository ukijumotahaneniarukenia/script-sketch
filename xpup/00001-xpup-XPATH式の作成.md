- IN


```
$ cat pom.json
{
  "project": {
    "modelVersion": "4.0.0",
    "groupId": "app",
    "artifactId": "nnn",
    "version": "1.0-SNAPSHOT",
    "name": "nnn",
    "url": "http://www.example.com",
    "properties": {
      "project.build.sourceEncoding": "UTF-8",
      "maven.compiler.source": "1.7",
      "maven.compiler.target": "1.7"
    },
    "dependencies": {
      "dependency": {
        "groupId": "junit",
        "artifactId": "junit",
        "version": "4.11",
        "scope": "test"
      }
    },
    "build": {
      "pluginManagement": {
        "plugins": {
          "plugin": [
            {
              "artifactId": "maven-clean-plugin",
              "version": "3.1.0"
            },
            {
              "artifactId": "maven-resources-plugin",
              "version": "3.0.2"
            },
            {
              "artifactId": "maven-compiler-plugin",
              "version": "3.8.0"
            },
            {
              "artifactId": "maven-surefire-plugin",
              "version": "2.22.1"
            },
            {
              "artifactId": "maven-jar-plugin",
              "version": "3.0.2"
            },
            {
              "artifactId": "maven-install-plugin",
              "version": "2.5.2"
            },
            {
              "artifactId": "maven-deploy-plugin",
              "version": "2.8.2"
            },
            {
              "artifactId": "maven-site-plugin",
              "version": "3.7.1"
            },
            {
              "artifactId": "maven-project-info-reports-plugin",
              "version": "3.0.0"
            }
          ]
        }
      },
      "plugins": {
        "plugin": {
          "groupId": "org.apache.maven.plugins",
          "artifactId": "maven-compiler-plugin",
          "configuration": {
            "source": "8",
            "target": "8"
          }
        }
      }
    }
  }
}
```

- CMD

```
$ cat pom.json | jq -r --stream -c 'select(.[1]!=null)|.[0]|map(if type=="number" then "[position()="+(.+1|tostring)+"]" else "/"+. end)|join("")'
```

- OUT

```
/project/modelVersion
/project/groupId
/project/artifactId
/project/version
/project/name
/project/url
/project/properties/project.build.sourceEncoding
/project/properties/maven.compiler.source
/project/properties/maven.compiler.target
/project/dependencies/dependency/groupId
/project/dependencies/dependency/artifactId
/project/dependencies/dependency/version
/project/dependencies/dependency/scope
/project/build/pluginManagement/plugins/plugin[position()=1]/artifactId
/project/build/pluginManagement/plugins/plugin[position()=1]/version
/project/build/pluginManagement/plugins/plugin[position()=2]/artifactId
/project/build/pluginManagement/plugins/plugin[position()=2]/version
/project/build/pluginManagement/plugins/plugin[position()=3]/artifactId
/project/build/pluginManagement/plugins/plugin[position()=3]/version
/project/build/pluginManagement/plugins/plugin[position()=4]/artifactId
/project/build/pluginManagement/plugins/plugin[position()=4]/version
/project/build/pluginManagement/plugins/plugin[position()=5]/artifactId
/project/build/pluginManagement/plugins/plugin[position()=5]/version
/project/build/pluginManagement/plugins/plugin[position()=6]/artifactId
/project/build/pluginManagement/plugins/plugin[position()=6]/version
/project/build/pluginManagement/plugins/plugin[position()=7]/artifactId
/project/build/pluginManagement/plugins/plugin[position()=7]/version
/project/build/pluginManagement/plugins/plugin[position()=8]/artifactId
/project/build/pluginManagement/plugins/plugin[position()=8]/version
/project/build/pluginManagement/plugins/plugin[position()=9]/artifactId
/project/build/pluginManagement/plugins/plugin[position()=9]/version
/project/build/plugins/plugin/groupId
/project/build/plugins/plugin/artifactId
/project/build/plugins/plugin/configuration/source
/project/build/plugins/plugin/configuration/target
```


- CMD


こっちが正しかった

```
$ cat pom.json | jq -r --stream -c 'select(.[1]!=null)|.[0]|map(if type=="number" then "["+(.+1|tostring)+"]" else "/"+. end)|join("")'
```


- OUT

```
/project/modelVersion
/project/groupId
/project/artifactId
/project/version
/project/name
/project/url
/project/properties/project.build.sourceEncoding
/project/properties/maven.compiler.source
/project/properties/maven.compiler.target
/project/dependencies/dependency/groupId
/project/dependencies/dependency/artifactId
/project/dependencies/dependency/version
/project/dependencies/dependency/scope
/project/build/pluginManagement/plugins/plugin[1]/artifactId
/project/build/pluginManagement/plugins/plugin[1]/version
/project/build/pluginManagement/plugins/plugin[2]/artifactId
/project/build/pluginManagement/plugins/plugin[2]/version
/project/build/pluginManagement/plugins/plugin[3]/artifactId
/project/build/pluginManagement/plugins/plugin[3]/version
/project/build/pluginManagement/plugins/plugin[4]/artifactId
/project/build/pluginManagement/plugins/plugin[4]/version
/project/build/pluginManagement/plugins/plugin[5]/artifactId
/project/build/pluginManagement/plugins/plugin[5]/version
/project/build/pluginManagement/plugins/plugin[6]/artifactId
/project/build/pluginManagement/plugins/plugin[6]/version
/project/build/pluginManagement/plugins/plugin[7]/artifactId
/project/build/pluginManagement/plugins/plugin[7]/version
/project/build/pluginManagement/plugins/plugin[8]/artifactId
/project/build/pluginManagement/plugins/plugin[8]/version
/project/build/pluginManagement/plugins/plugin[9]/artifactId
/project/build/pluginManagement/plugins/plugin[9]/version
/project/build/plugins/plugin/groupId
/project/build/plugins/plugin/artifactId
/project/build/plugins/plugin/configuration/source
/project/build/plugins/plugin/configuration/target
```
