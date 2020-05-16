[辞書作成とかはこれを分割してまとめておくのがよさそう](http://aoba.cc.saga-u.ac.jp/lecture/TclTk/text.pdf)

[エディタはこれがよさそう](http://vtcl.sourceforge.net/)

GUIアプリを起動する際のモック作成にtclちょうどいい

デフォでマルチぷらっとホーム

以下の手順で起動できる

```
chmod 755 00001-tk-メッセージと終了ボタン.tk
./00001-tk-メッセージと終了ボタン.tk
```


vtclエディタの起動


ちょっと年季があるが便利で手作り感がすごく好きなので、微調整して使えるようにする


```
git clone https://github.com/hpheidinger/vtcl.vtcl-8.6.git
cd vtcl.vtcl-8.6

```

configureする

```
./configure 
```

以下が標準出力に出力される

```

Using /bin/wish8.5

```


vtcl.tclファイルがエディタの起動ファイル

修正前

```
$cat vtcl
#!/bin/sh

PATH_TO_WISH=/bin/wish8.5
VTCL_HOME=/usr/local/vtcl-8.6

export PATH_TO_WISH
export VTCL_HOME

exec ${PATH_TO_WISH} ${VTCL_HOME}/vtcl.tcl $*

```


修正後

ホームの環境変数値を修正した

```
$cat vtcl
#!/bin/sh

PATH_TO_WISH=/bin/wish8.5
VTCL_HOME=$HOME/vtcl.vtcl-8.6

export PATH_TO_WISH
export VTCL_HOME

exec ${PATH_TO_WISH} ${VTCL_HOME}/vtcl.tcl $*
```


起動方法

コマンドライン引数なしの場合

```
$./$HOME/vtcl.vtcl-8.6/vtcl.tcl
```

or


コマンドライン引数ありの場合

```
$./$HOME/vtcl.vtcl-8.6/vtcl.tcl 森 鴎外
```
