- IN

```

```


- CMD
kotlinメソッド名ぶっこ抜き
```
java -jar jardump-4-0-0-SNAPSHOT.jar /home/aine/.sdkman/candidates/gradle/current/lib/kotlin-stdlib-1.3.61.jar | awk -v FS="\t" '$0=$7' | awk '{a[$0]=$0}END{for(e in a)print e}' | grep -v MMMMM-03-メソッド名 | sort
```


- OUT

```

```
