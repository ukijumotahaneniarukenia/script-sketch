実行ユーザーのホームディレクトリに圧縮ファイルを配備

```
kuraine doc-ubuntu-19-10-go-vscode ~$ls -l eclipse-inst-linux64.tar.gz
-rw-r--r--. 1 kuraine kuraine 51392635  5月 20 23:03 eclipse-inst-linux64.tar.gz
```

権限等が実行者ユーザーのもの出ない場合、書き換える

```
kuraine doc-ubuntu-19-10-go-vscode ~$sudo chown -R kuraine:kuraine eclipse-inst-linux64.tar.gz
```

```
$tar xvf eclipse-inst-linux64.tar.gz
```

インストーラの起動

```
$./eclipse-installer/eclipse-inst
```


アプリ起動

```
$$HOME/eclipse/javascript-2020-03/eclipse/eclipse 1>$HOME/launch-eclipse.log 2>&1 &
```


マーケットプレイスから**nodeeclipse**で検索し、プラグインをインストール


通信状況にもよるが20分ぐらいはみつもっておく
