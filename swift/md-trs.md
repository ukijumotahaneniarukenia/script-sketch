#1


- 事象

```

aine-MS-7B98 (aine)  00:18:50  swift  (master)  swift
/usr/local/src/swift-5.2.4-RELEASE-ubuntu20.04/usr/bin/lldb: error while loading shared libraries: libpython2.7.so.1.0: cannot open shared object file: No such file or directory


```


- 原因

リンカが見に行く場所にリンクファイルが存在していない

```



```


- 対処

```

apt-get install -y libpython2.7

```


- 予防


```


```
