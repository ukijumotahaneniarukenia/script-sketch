jupyter関連コマンドインストール

```
pip3 install --user jupyter
```

jupyter notebook起動

- https://qiita.com/tand826/items/0c478bf63ead75427782

```
jupyter notebook --port 8000 --ip=0.0.0.0 --allow-root
```


- jupyter-notebookの起動

  - https://github.com/codenvy/codenvy/issues/2427

事前にブラウザをインストール

firefoxは日本語入力できなくっているのが発覚。chromeで代用。

```

apt install -y firefox

```


```

$ firefox --version
Mozilla Firefox 77.0.1

```

起動

```

jupyter-notebook --ip=0.0.0.0 --port=8080

```


- Rstudioのインストール40分ぐらいかかった。なぞ。


停止

```
jupyter-notebook stop --NbserverStopApp.port=8080
```


目次の追加

- 停止した状態で以下のコマンドを実行。実行後、起動し、拡張機能でTOCを選択。各ノートブック単位で、TOCの自動生成ボタンを押下すると、左側にTOCが出力される。

```
pip3 install --user jupyter_contrib_nbextensions


jupyter contrib nbextension install --user


jupyter nbextension enable codefolding/main
```
