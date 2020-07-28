- クライアントアプリのインストール
  - https://clients.amazonworkspaces.com/linux-install.html

```
wget -q -O - https://workspaces-client-linux-public-key.s3-us-west-2.amazonaws.com/ADB332E7.asc | apt-key add -

echo "deb [arch=amd64] https://d3nt0h4h6pmmc4.cloudfront.net/ubuntu bionic main" | tee /etc/apt/sources.list.d/amazon-workspaces-clients.list

apt-get -y update

apt-get -y install workspacesclient
```

- 接続手順書
  - https://docs.aws.amazon.com/workspaces/latest/userguide/amazon-workspaces-linux-client.html


- 実行バイナリファイルなど

```
cd /opt/workspacesclient
```

これが実行バイナリファイル

```
/opt/workspacesclient/workspacesclient
```

- 実施

実行ファイルをたたく

```
$/opt/workspacesclient/workspacesclient

(workspacesclient:2046): dbind-WARNING **: 14:14:59.646: Couldn't connect to accessibility bus: Failed to connect to socket /tmp/dbus-L2LeixixRH: Connection refused
Gtk-Message: 14:14:59.664: Failed to load module "pk-gtk-module"
Gtk-Message: 14:14:59.664: Failed to load module "canberra-gtk-module"
Gtk-Message: 14:14:59.665: Failed to load module "pk-gtk-module"
Gtk-Message: 14:14:59.665: Failed to load module "canberra-gtk-module"

(workspacesclient:2046): GLib-GIO-CRITICAL **: 14:14:59.680: g_dbus_proxy_new_sync: assertion 'G_IS_DBUS_CONNECTION (connection)' failed
Gtk-Message: 14:16:33.072: GtkDialog mapped without a transient parent. This is discouraged.
Gtk-Message: 14:16:38.770: GtkDialog mapped without a transient parent. This is discouraged.
Gtk-Message: 14:16:45.121: GtkDialog mapped without a transient parent. This is discouraged.
Gtk-Message: 14:16:56.493: GtkDialog mapped without a transient parent. This is discouraged.
```

画面出たら、ワークスペース管理者の人から与えられた登録者コードを入力する

```

```

そのあと、ユーザー名、パスワード、MFAコードを入力し、サインインボタンを押下する


```

```


おしまい

