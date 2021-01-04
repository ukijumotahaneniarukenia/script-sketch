nコマンドインストール

```
$ sudo npm install -g n
/usr/bin/n -> /usr/lib/node_modules/n/bin/n
+ n@7.0.0
added 1 package from 4 contributors in 0.185s
```

現在のバージョン確認

```
$ node -v
v14.15.3


$ npm -v
6.14.9
```


ダウングレード対象存在確認

```
$ sudo n ls-remote --all | grep ^12.2
12.20.0
12.2.0
```

ダウングレード

```
$ sudo n 12.20.0
  installing : node-v12.20.0
       mkdir : /usr/local/n/versions/node/12.20.0
       fetch : https://nodejs.org/dist/v12.20.0/node-v12.20.0-linux-x64.tar.xz
   installed : v12.20.0 (with npm 6.14.8)
```

端末再起動後、バージョン確認

```
$ node -v
v12.20.0


$ npm -v
6.14.8
```

アップグレード

```
$ sudo n 14.15.3
   installed : v14.15.3 (with npm 6.14.9)
```

端末再起動後、バージョン確認

```
$ node -v
v14.15.3

$ npm -v
6.14.9
```

