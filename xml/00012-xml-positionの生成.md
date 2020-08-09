- IN

```

```

- CMD


```
$ cat test.json | jq --stream -c '' | jq -cr '.[0]|map(if type=="number" then "[position()="+((.+1)|tostring)+"]" else "/"+. end)|join("")'
```


- OUT

```
/?xml/@version
/?xml/@version
/project/modelVersion
/project/groupId
/project/artifactId
/project/version
/project/parent/groupId
/project/parent/artifactId
/project/parent/version
/project/parent/relativePath
/project/parent/relativePath
/project/dependencies/dependency[position()=1]/groupId
/project/dependencies/dependency[position()=1]/artifactId
/project/dependencies/dependency[position()=1]/artifactId
/project/dependencies/dependency[position()=2]/groupId
/project/dependencies/dependency[position()=2]/artifactId
/project/dependencies/dependency[position()=2]/scope
/project/dependencies/dependency[position()=2]/scope
/project/dependencies/dependency[position()=3]/groupId
/project/dependencies/dependency[position()=3]/artifactId
/project/dependencies/dependency[position()=3]/scope
/project/dependencies/dependency[position()=3]/scope
/project/dependencies/dependency[position()=3]
/project/dependencies/dependency
/project/properties/java.version
/project/properties/java.version
/project/build/plugins/plugin/groupId
/project/build/plugins/plugin/artifactId
/project/build/plugins/plugin/artifactId
/project/build/plugins/plugin
/project/build/plugins
/project/build
/project
```



- CMD

```
$ cat test.json | jq --stream -c '' | jq -cr '.[0]|map(if type=="number" then "[position()="+((.+1)|tostring)+"]" else "/"+. end)|join("")|.+"/text()"'
```

- OUT
```
/?xml/@version/text()
/?xml/@version/text()
/project/modelVersion/text()
/project/groupId/text()
/project/artifactId/text()
/project/version/text()
/project/parent/groupId/text()
/project/parent/artifactId/text()
/project/parent/version/text()
/project/parent/relativePath/text()
/project/parent/relativePath/text()
/project/dependencies/dependency[position()=1]/groupId/text()
/project/dependencies/dependency[position()=1]/artifactId/text()
/project/dependencies/dependency[position()=1]/artifactId/text()
/project/dependencies/dependency[position()=2]/groupId/text()
/project/dependencies/dependency[position()=2]/artifactId/text()
/project/dependencies/dependency[position()=2]/scope/text()
/project/dependencies/dependency[position()=2]/scope/text()
/project/dependencies/dependency[position()=3]/groupId/text()
/project/dependencies/dependency[position()=3]/artifactId/text()
/project/dependencies/dependency[position()=3]/scope/text()
/project/dependencies/dependency[position()=3]/scope/text()
/project/dependencies/dependency[position()=3]/text()
/project/dependencies/dependency/text()
/project/properties/java.version/text()
/project/properties/java.version/text()
/project/build/plugins/plugin/groupId/text()
/project/build/plugins/plugin/artifactId/text()
/project/build/plugins/plugin/artifactId/text()
/project/build/plugins/plugin/text()
/project/build/plugins/text()
/project/build/text()
/project/text()
```


```
$ cat test.xml | xmllint --xpath '/project/dependencies/dependency[position()=1]/groupId/text()' -
org.springframework.boot
```
