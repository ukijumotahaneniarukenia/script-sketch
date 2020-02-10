Tcl 好きな人発見
[データ構造訓練](https://blog.it-see.net/it-dokata/tcl-tk/data-structure/) </ br>
[tclで絵文字表示](https://yuuki0xff.jp/articles/build-cpython-tcl-tk-for-adding-unicode-emoji-supports.html) </ br>

コンパイルオプション
絵文字でふぉでは印字できない
[絵文字表示のコンパイルオプション](https://wiki.tcl-lang.org/page/emoji) </ br>

[演算子](https://www.tutorialspoint.com/tcl-tk/tcl_operators.htm) </ br>

[文法とコマンド](https://freesoftnet.co.jp/webfiles/tclkits/doc/tclcom.html)</ br>

古いスレッドだけど、勉強になる。
[unicodeコマンド](http://www.rakunet.org/tsnet/TSfree/48/1442.html)</ br>

[eval!](http://www.interq.or.jp/japan/s-imai/tcltk/list.html)


# tdomライブラリのいんすこ

```
$mkdir lib
$cd lib
$curl -LO http://tdom.org/downloads/tdom-0.9.1-src.zip
$unzip tdom-0.9.1-src.zip 
$cd tdom-0.9.1
$cd unix/
$../configure
$make -j12
$make -j12 test
$sudo make -j12 install
```

いんすこログ

```
Installing header files in /usr/local/include
Installing ../generic/tdom.h
 : libtdom0.9.1.so
 /bin/sh ../tclconfig/install-sh -c  -m 444 libtdom0.9.1.so /usr/local/lib/tdom0.9.1/libtdom0.9.1.so
Installing documentation in /usr/local/share/man
Installing ../doc/dom.n
 : libtdomstub0.9.1.a
 /bin/sh ../tclconfig/install-sh -c  -m 444 libtdomstub0.9.1.a /usr/local/lib/tdom0.9.1/libtdomstub0.9.1.a
Installing ../doc/domDoc.n
Installing ../doc/domNode.n
Installing tdomConfig.sh to /usr/local/lib/
Installing ../doc/expat.n
 Install tdom.tcl /usr/local/lib/tdom0.9.1/tdom.tcl
Installing ../doc/expatapi.n
 Install pkgIndex.tcl /usr/local/lib/tdom0.9.1
Installing ../doc/pullparser.n
Installing ../doc/tdomcmd.n
Installing ../doc/tnc.n
```

バージョン情報

```
$tclsh8.6
% package require tdom
0.9.1
```
