環境

```
$ cat /etc/os-release
NAME="Ubuntu"
VERSION="18.04.4 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.4 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic




$ uname -r
3.10.0-1062.el7.x86_64
```

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
