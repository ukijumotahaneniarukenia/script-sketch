pandocも同時にインストールしておくとはかどる

```
apt install -y pandoc
```


マークダウン記法で記載しEnterするたびにレンダラうごく便利。python-qt製。
- https://typora.io/

ショートカットなど

- https://qiita.com/4_mio_11/items/223326c3289f6b2c2a07


インストール

```
mv /home/aine/media/Typora-linux-x64.tar.gz /usr/local/src

cd /usr/local/src

chown -R root:root Typora-linux-x64.tar.gz

tar xvf Typora-linux-x64.tar.gz

chown -R root:root bin
```

パス通す
```
echo 'export PATH=/usr/local/src/bin/Typora-linux-x64:$PATH' >>$HOME/.bashrc
```

起動

chronium内蔵なので、--no-sandboxなどつけてやると安全じゃないけど安全に起動できる


fcitx-mozcのインプットメソッドで日本語入力とかも無事にできた

```
Typora --no-sandbox 1>$HOME/launch-Typora.log 2>&1 &

```
