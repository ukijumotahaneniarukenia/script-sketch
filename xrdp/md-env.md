xrdpコマンドインストール

CMD

```
$ apt search xrdp
```

OUT

```
ソート中... 完了
全文検索... 完了  
xorgxrdp/focal 1:0.2.12-1 amd64
  Remote Desktop Protocol (RDP) modules for X.org

xrdp/focal 0.9.12-1 amd64
  Remote Desktop Protocol (RDP) server
```


CMD

```
$ apt install xrdp
```

OUT

```
パッケージリストを読み込んでいます... 完了
依存関係ツリーを作成しています                
状態情報を読み取っています... 完了
以下の追加パッケージがインストールされます:
  xorgxrdp
提案パッケージ:
  guacamole xrdp-pulseaudio-installer
以下のパッケージが新たにインストールされます:
  xorgxrdp xrdp
アップグレード: 0 個、新規インストール: 2 個、削除: 0 個、保留: 5 個。
488 kB のアーカイブを取得する必要があります。
この操作後に追加で 3,212 kB のディスク容量が消費されます。
続行しますか? [Y/n] y
取得:1 http://jp.archive.ubuntu.com/ubuntu focal/universe amd64 xrdp amd64 0.9.12-1 [428 kB]
取得:2 http://jp.archive.ubuntu.com/ubuntu focal/universe amd64 xorgxrdp amd64 1:0.2.12-1 [59.9 kB]
488 kB を 0秒 で取得しました (1,056 kB/s)
以前に未選択のパッケージ xrdp を選択しています。
(データベースを読み込んでいます ... 現在 236514 個のファイルとディレクトリがインストールされています。)
.../xrdp_0.9.12-1_amd64.deb を展開する準備をしています ...
xrdp (0.9.12-1) を展開しています...
以前に未選択のパッケージ xorgxrdp を選択しています。
.../xorgxrdp_1%3a0.2.12-1_amd64.deb を展開する準備をしています ...
xorgxrdp (1:0.2.12-1) を展開しています...
xrdp (0.9.12-1) を設定しています ...

Generating 2048 bit rsa key...

ssl_gen_key_xrdp1 ok

saving to /etc/xrdp/rsakeys.ini

Created symlink /etc/systemd/system/multi-user.target.wants/xrdp-sesman.service → /lib/systemd/system/xrdp-sesman.service.
Created symlink /etc/systemd/system/multi-user.target.wants/xrdp.service → /lib/systemd/system/xrdp.service.
xorgxrdp (1:0.2.12-1) を設定しています ...
systemd (245.4-4ubuntu3.2) のトリガを処理しています ...
man-db (2.9.1-1) のトリガを処理しています ...
libc-bin (2.31-0ubuntu9) のトリガを処理しています ...
```

待受ポートオープン確認

```
$ lsof -i:3350 -i:3389 -P 
COMMAND     PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
xrdp-sesm 50982 root    7u  IPv6 203608      0t0  TCP ip6-localhost:3350 (LISTEN)
xrdp      51012 xrdp   11u  IPv6 201254      0t0  TCP *:3389 (LISTEN)
```

サービス起動確認

```
$ systemctl status xrdp.service
● xrdp.service - xrdp daemon
     Loaded: loaded (/lib/systemd/system/xrdp.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2020-09-22 19:18:54 JST; 6min ago
       Docs: man:xrdp(8)
             man:xrdp.ini(5)
   Main PID: 51012 (xrdp)
      Tasks: 1 (limit: 38313)
     Memory: 2.2M
     CGroup: /system.slice/xrdp.service
             └─51012 /usr/sbin/xrdp

 9月 22 19:18:53 aine-MS-7B98 xrdp[51002]: (51002)(140079574239040)[INFO ] address [0.0.0.0] port [3389] mode 1
 9月 22 19:18:53 aine-MS-7B98 xrdp[51002]: (51002)(140079574239040)[INFO ] listening to port 3389 on 0.0.0.0
 9月 22 19:18:53 aine-MS-7B98 xrdp[51002]: (51002)(140079574239040)[INFO ] xrdp_listen_pp done
 9月 22 19:18:53 aine-MS-7B98 xrdp[51002]: (51002)(140079574239040)[DEBUG] Closed socket 7 (AF_INET6 :: port 3389)
 9月 22 19:18:53 aine-MS-7B98 systemd[1]: xrdp.service: Can't open PID file /run/xrdp/xrdp.pid (yet?) after start: Operation not permitted
 9月 22 19:18:54 aine-MS-7B98 systemd[1]: Started xrdp daemon.
 9月 22 19:18:55 aine-MS-7B98 xrdp[51012]: (51012)(140079574239040)[INFO ] starting xrdp with pid 51012
 9月 22 19:18:55 aine-MS-7B98 xrdp[51012]: (51012)(140079574239040)[INFO ] address [0.0.0.0] port [3389] mode 1
 9月 22 19:18:55 aine-MS-7B98 xrdp[51012]: (51012)(140079574239040)[INFO ] listening to port 3389 on 0.0.0.0
 9月 22 19:18:55 aine-MS-7B98 xrdp[51012]: (51012)(140079574239040)[INFO ] xrdp_listen_pp done
```

他ホストから接続されていると以下のようにコネクションが張られる

サーブホストのホスト名は「aine-MS-7B98」なので、ホスト「aine-MS-7B98」からホストクライアント「aine-CF-SX1GE1DC」へxrdpサービスをサーブしている

```
$ lsof -i:3350 -i:3389 -P 
COMMAND    PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
xrdp-sesm  791 root    7u  IPv6  27487      0t0  TCP ip6-localhost:3350 (LISTEN)
xrdp       822 xrdp   11u  IPv6  30414      0t0  TCP *:3389 (LISTEN)
xrdp      3730 xrdp   12u  IPv6  53832      0t0  TCP aine-MS-7B98:3389->aine-CF-SX1GE1DC:39784 (ESTABLISHED)
```


クライアントから接続する際は、接続用のアカウントを作成しておく

適当に３つぐらい作成しておく

クライアントからはremminaではここで作成したアカウントを指定して接続する

メンテアカウント(aine)で接続してもなにも映らない（問題を棲み分ける意味でもメンテアカウント以外に複数個作成したほうが無難）

1つ目
```
groupadd -g 2000 kuraine
useradd -m -g kuraine -u 2000 kuraine
chsh -s /bin/bash kuraine
echo "kuraine:kuraine_pwd"|chpasswd
echo "kuraine ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
```

2つ目
```
groupadd -g 3000 nahato
useradd -m -g nahato -u 3000 nahato
chsh -s /bin/bash nahato
echo "nahato:nahato_pwd"|chpasswd
echo "nahato ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
```

3つ目
```
groupadd -g 4000 mujiku
useradd -m -g mujiku -u 3000 mujiku
chsh -s /bin/bash mujiku
echo "mujiku:mujiku_pwd"|chpasswd
echo "mujiku ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
```


テンプレート

```
groupadd -g USER_ID USER_NAME
useradd -m -g USER_NAME -u USER_ID USER_NAME
chsh -s /bin/bash USER_NAME
echo "USER_NAME:USER_NAME_pwd"|chpasswd
echo "USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
```

パタン生成

```
$ echo kuraine | ruby -F'\B' -anle 'a=[];a<<$F.permutation.map{|e|e.join("")};a.flatten[0..998].map.with_index{|ele,idx|user_id=idx;user_name=ele;puts "#{user_id.to_s + " " +user_name}"}'
```
