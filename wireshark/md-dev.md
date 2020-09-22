- https://www.wireshark.org/

コンテナホストでインストール

systemd環境あるコンテナならインストールできる

なにか聞かれたがはいと答えた

```
$ sudo apt install -y wireshark
```

rootユーザーで起動しないと権限エラーでパケット見えないものがあったので、基本rootで起動

```
sudo wireshark 1>$HOME/launch-wireshark.log 2>&1 &
```
