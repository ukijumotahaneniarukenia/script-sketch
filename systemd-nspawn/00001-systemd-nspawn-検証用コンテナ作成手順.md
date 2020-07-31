これがでる
```
sudo: unable to resolve host vir-ubuntu-20-04: Temporary failure in name resolution
sudo: ホスト vir-ubuntu-20-04 の名前解決ができません: 名前解決に一時的に失敗しました
```

ホストファイルにマシン名を追加
- https://askubuntu.com/questions/59458/error-message-sudo-unable-to-resolve-host-none
```
vi /etc/hosts

127.0.0.1	vir-ubuntu-20-04
```

エントリファイルを作成し、権限付与後、コンテナファイルシステムへコピー

```
$ chmod 755 systemd-container-entrypoint.sh

$ cp systemd-container-entrypoint.sh vir-ubuntu-20-04/opt/systemd-container-entrypoint.sh

```


ブートし、rootユーザーでログイン後、エントリファイルを引数指定し、実行
```

Ubuntu 20.04 LTS aine-MS-7B98 console

aine-MS-7B98 login: root
Password: 
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.4.0-42-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

Last login: 土  8月  1 00:38:51 JST 2020 on pts/0
root@aine-MS-7B98:~# 
root@aine-MS-7B98:~# 
root@aine-MS-7B98:~# 
root@aine-MS-7B98:~# 
root@aine-MS-7B98:~# time /opt/systemd-container-entrypoint.sh 1000 aine 1000 aine aine_pwd


```

一般ユーザーないし、rootユーザーでログイン後、検証したいsystemdサービスをインストールしていく

ブートしてはいらないと、DNS設定がうまくいっていないので、コンテナ抜けてもう一度入る場合は、ブートする

```
$ systemd-nspawn -b -D /var/lib/machines/vir-ubuntu-20-04
```
