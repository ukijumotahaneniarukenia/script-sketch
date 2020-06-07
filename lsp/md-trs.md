#1

- 事象

```

 ./clangd: error while loading shared libraries: libz3.so.4.8: cannot open shared object file: No such file or directory

```



- 原因

対象のダイナミックリンクファイルが存在していないから

- 対処

リンクファイルのキャッシュができているか確認

```

aine-MS-7B98 (aine)  17:33:34  lsp  (master)  ldconfig -p | grep libz3
	libz3.so.4 (libc6,x86-64) => /lib/x86_64-linux-gnu/libz3.so.4
	libz3.so (libc6,x86-64) => /lib/x86_64-linux-gnu/libz3.so
```

できてなければインストール

```

apt install -y libz3-dev

```


- 予防
