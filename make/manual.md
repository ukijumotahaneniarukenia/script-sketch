# インストール手順

```
$curl -LO http://ftp.gnu.org/gnu/make/make-4.2.1.tar.gz
$tar xvf make-4.2.1.tar.gz 
$cd make-4.2.1
$./configure
$make -j12
$sudo make -j12 install
$make --version
GNU Make 4.2.1
このプログラムは x86_64-pc-linux-gnu 用にビルドされました
Copyright (C) 1988-2016 Free Software Foundation, Inc.
ライセンス GPLv3+: GNU GPL バージョン 3 以降 <http://gnu.org/licenses/gpl.html>
これはフリーソフトウェアです: 自由に変更および配布できます.
法律の許す限り、　無保証　です.
```

# 参考文献

https://www.ecoop.net/coop/translated/GNUMake3.77/make_toc.jp.html


https://b.ueda.tech/?post=20180303_make


# りんくはりなおす

docker内で反映されていなかったら、exitしてはいりなおす。

```
$make --version
GNU Make 4.2.1
このプログラムは x86_64-pc-linux-gnu 用にビルドされました
Copyright (C) 1988-2016 Free Software Foundation, Inc.
ライセンス GPLv3+: GNU GPL バージョン 3 以降 <http://gnu.org/licenses/gpl.html>
これはフリーソフトウェアです: 自由に変更および配布できます.
法律の許す限り、　無保証　です.
$gmake --version
GNU Make 3.82
Built for x86_64-redhat-linux-gnu
Copyright (C) 2010  Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
$which make
/usr/local/bin/make
$which gmake
/usr/bin/gmake
$ll /usr/local/bin/gmake
ls: cannot access /usr/local/bin/gmake: No such file or directory
$sudo ln -snf /usr/local/bin/make /usr/local/bin/gmake
$ll /usr/local/bin/gmake
lrwxrwxrwx. 1 root root 19 12月  7 09:22 /usr/local/bin/gmake -> /usr/local/bin/make
$which gmake
/usr/local/bin/gmake
$gmake --version
GNU Make 4.2.1
このプログラムは x86_64-pc-linux-gnu 用にビルドされました
Copyright (C) 1988-2016 Free Software Foundation, Inc.
ライセンス GPLv3+: GNU GPL バージョン 3 以降 <http://gnu.org/licenses/gpl.html>
これはフリーソフトウェアです: 自由に変更および配布できます.
法律の許す限り、　無保証　です.
```
