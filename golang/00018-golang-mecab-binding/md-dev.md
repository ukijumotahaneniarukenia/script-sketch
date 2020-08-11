- https://github.com/ryuichiueda/ke2daira

環境

```
$ cat /etc/os-release
NAME="Ubuntu"
VERSION="19.10 (Eoan Ermine)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 19.10"
VERSION_ID="19.10"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=eoan
UBUNTU_CODENAME=eoan



$ uname -r
3.10.0-1062.el7.x86_64
```


ライブラリのインストール

コマンド、辞書、ダイナミックリンクライブラリの順

```
apt install -y mecab mecab-ipadic-utf8 libmecab-dev
```


```

export CGO_CFLAGS="-I$(mecab-config --inc-dir)"
export CGO_LDFLAGS="$(mecab-config --libs)"

export GOPATH=$(pwd)
go get github.com/shogo82148/go-mecab



```


コンパイル

```

$ ( export GOPATH=$(pwd) && cd src/main && go install )

```

実行

```

$ ./bin/main
こんにちは 世界

<nil>
Hello, playground


```
