
このフローがシンプルでいい


GOPATH設定

シングルバイナリ取得

パス設定

```
$ echo 'export GOPATH=$HOME/.local' >>$HOME/.bashrc
$ go get -u github.com/murooka/go-diff-image/...
$ echo 'export PATH=$GOPATH/bin:$PATH' >>$HOME/.bashrc


$ ls *png
after.png  before.png


$ diff-image before.png after.png


$ ls *png
after.png  before.png  diff.png


```
