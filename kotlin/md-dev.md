
単一ファイルに限る

kotlin実行可能jarの作成

```

$ kotlinc a.kt -include-runtime -d app.jar


```


```

$ ls -lh app.jar a.kt
-rw-r--r--. 1 kuraine kuraine   33  6月  4 23:22 a.kt
-rw-r--r--. 1 kuraine kuraine 1.4M  6月  4 23:25 app.jar


```


実行

```

$ java -jar app.jar
hello
```
