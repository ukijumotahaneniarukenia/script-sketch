デフォルトだとrootしかはいれないので、権限付与

```
$ chmod 755 /var/lib/machines
```

移動

```
$ cd /var/lib/machines
```

洗い替え
```
$ sudo rm -rf vir-ubuntu-20-04
```

テンプレートファイルから複製
```
$ sudo cp -a vir-ubuntu-20-04-template vir-ubuntu-20-04
```


rootユーザのパスワードを設定するため、ブートせずにログインし、パスワード変更
```
$ sudo systemd-nspawn -D /var/lib/machines/vir-ubuntu-20-04
Spawning container vir-ubuntu-20-04 on /var/lib/machines/vir-ubuntu-20-04.
Press ^] three times within 1s to kill container.
root@vir-ubuntu-20-04:~# echo 'root:root_pwd' | chpasswd
root@vir-ubuntu-20-04:~# logout
Container vir-ubuntu-20-04 exited successfully.
```


ブート
```
$ sudo systemd-nspawn -b -D /var/lib/machines/vir-ubuntu-20-04
```

rootユーザーでログイン

```
Ubuntu 20.04 LTS aine-MS-7B98 console

aine-MS-7B98 login: root
Password: 
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.4.0-42-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

root@aine-MS-7B98:~# 
```


一般ユーザの作成

```
DEFAULT_USER_ID=1000
DEFAULT_USER_NAME=aine
DEFAULT_GROUP_ID=1000
DEFAULT_GROUP_NAME=aine

groupadd -g $DEFAULT_GROUP_ID $DEFAULT_GROUP_NAME && \
useradd -m -g $DEFAULT_GROUP_NAME -u $DEFAULT_USER_ID $DEFAULT_USER_NAME && \
chsh -s /bin/bash $DEFAULT_USER_NAME && \
echo $DEFAULT_USER_NAME':'$DEFAULT_USER_NAME'_pwd' | chpasswd && \
echo "$DEFAULT_USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
echo 'root:root_pwd' | chpasswd
```


一般ユーザーでsudoが使えるように

```
echo "Set disable_coredump false" >> /etc/sudo.conf
```


レポジトリの設定

```
sed -i.bak 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list
```

DNSの設定

```
sed -i.bak 's/#DNS=/DNS=8.8.8.8/' /etc/systemd/resolved.conf
```

アップデート（再起動し直す必要はなかった）
```
apt update
```

ブラウザが立ち上がるか
```
apt install -y firefox
```


一般ユーザーで入り直し

```
root@aine-MS-7B98:~# logout

Ubuntu 20.04 LTS aine-MS-7B98 console

aine-MS-7B98 login: aine
Password: 
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.4.0-42-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

aine@aine-MS-7B98:~$ 
aine@aine-MS-7B98:~$ 
aine@aine-MS-7B98:~$ sudo echo うんこ
うんこ
```

X転送できるように設定
```
export DISPLAY=:0.0
```

立ち上がる検索できる
```
firefox
```


rootユーザーで入り直し

日本語フォントのインストール

```
apt install -y fontconfig curl unzip
```


フォント設定したいユーザーで入り直し
```
mkdir -p $HOME/.fonts
cd $HOME/.fonts
curl -sSLO https://github.com/mzyy94/RictyDiminished-for-Powerline/archive/master.zip
unzip master.zip
mv RictyDiminished-for-Powerline-master/*ttf .
fc-cache -fv
```


この時点でfirefoxを起動すると日本語の豆腐表示はなくなる


アドオンとか入れ直したいなら
```
cd /home/aine
rm -rf .cache/ .mozilla/ Desktop/ Downloads/
```

firefox再起動


gitなどの開発環境整備

```
su root
cd /usr/local/src
apt install -y git
git clone https://github.com/ukijumotahaneniarukenia/script-repo.git

cd script-repo

bash ubuntu-20-04-install-dev-pkg.sh

bash ubuntu-20-04-install-tool-pkg.sh

bash ubuntu-20-04-install-network-pkg.sh

bash ubuntu-20-04-install-vim-system.sh

bash ubuntu-20-04-install-vim-user.sh

bash ubuntu-20-04-install-vim_plug.sh

bash ubuntu-20-04-config-dotfile.sh

bash ubuntu-20-04-config-env.sh

bash ubuntu-20-04-config-ld.sh

bash ubuntu-20-04-config-font-RictyDiminished.sh

```


日本語パック
```
apt install -y language-pack-ja-base language-pack-ja
```

IME起動できるか
できてない
```
apt install -y ibus-mozc

ibus-daemon -dxr

ibus-setup
```

