スクリプト実行後
```
machinectl terminate vir-ubuntu-20-04-001
```

ブート起動

```
systemd-nspawn -b -D /var/lib/machines/vir-ubuntu-20-04-001
```

X転送許可

ログインしている間のみなので、スクリプトに置き換え

```
export DISPLAY=:0.0
```

ホームディレクトリの権限整備

```
chown -R aine:aine /home/aine/
```


Xアプリ

```
apt install -y firefox


firefox
```


日本語入力。。。。18-04をつかう。

