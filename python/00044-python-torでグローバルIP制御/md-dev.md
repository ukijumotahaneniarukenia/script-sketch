ホストマシン上で実施

- VER

```
$ pip --version
pip 20.2.1 from /home/aine/script-sketch/python/00044-python-torでグローバルIP制御/venv/lib/python3.8/site-packages/pip (python 3.8)

$ python --version
Python 3.8.2

$ which pip
/home/aine/script-sketch/python/00044-python-torでグローバルIP制御/venv/bin/pip

$ which pip
/home/aine/script-sketch/python/00044-python-torでグローバルIP制御/venv/bin/pip

$ pip list | grep beautifulsoup4
beautifulsoup4 4.9.1


$ env | grep python
PWD=/home/aine/script-sketch/python/00044-python-torでグローバルIP制御
VIRTUAL_ENV=/home/aine/script-sketch/python/00044-python-torでグローバルIP制御/venv
PATH=/home/aine/script-sketch/python/00044-python-torでグローバルIP制御/venv/bin:/home/aine/.local/bin:/usr/local/bin:/usr/local/src/liteide/bin:/usr/local/src/android-studio/bin:/usr/local/src/swift-5.2.4-RELEASE-ubuntu20.04/usr/bin:/home/aine/.sdkman/candidates/grabin:/usr/local/src/graalvm-ce-java11-20.1.0/bin:/usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2/bin:/usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2/sbin:/usr/local/src/gradle-6.1/bin:/usr/local/src/solr-8.5.1/bin:/usr/local/src/apache-maven-3.6.3/bin:/usr/local/src/jdk-11/bin:/usr/local/src/jdk-11/bin:/usr/local/src/osxcross/target/bin:/home/aine/.cargo/bin:/usr/local/src/flutter/bin:/usr/local/src/chromedriver_linux64:/usr/local/src/chrome-linux:/usr/local/src/go/bin:/home/aine/.local/go-repo/bin:/usr/share/elasticsearch/bin:/home/aine/.local/script-search/bin:/home/aine/.local/script-cmd/bin:/home/aine/.local/bin:/usr/local/bin:/usr/local/src/liteide/bin:/usr/local/src/android-studio/bin:/usr/local/src/swift-5.2.4-RELEASE-ubuntu20.04/usr/bin:/home/aine/.sdkman/candidates/gradle/6.1/bin:/usr/local/src/graalvm-ce-java11-20.1.0/bin:/usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2/bin:/usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2/sbin:/usr/local/src/gradle-6.1/bin:/usr/local/src/solr-8.5.1/bin:/usr/local/src/apache-maven-3.6.3/bin:/usr/local/src/jdk-11/bin:/usr/local/src/jdk-11/bin:/usr/local/src/osxcross/target/bin:/home/aine/.cargo/bin:/usr/local/src/flutter/bin:/usr/local/src/chromedriver_linux64:/usr/local/src/chrome-linux:/usr/local/src/go/bin:/home/aine/.local/go-repo/bin:/usr/share/elasticsearch/bin:/home/aine/.local/script-search/bin:/home/aine/.local/script-cmd/bin:/home/aine/.cargo/bin:/home/aine/.local/bin:/home/aine/.local/bin:/usr/local/bin:/usr/local/src/liteide/bin:/usr/local/src/android-studio/bin:/usr/local/src/swift-5.2.4-RELEASE-ubuntu20.04/usr/bin:/home/aine/.sdkman/candidates/gradle/6.1/bin:/usr/local/src/graalvm-ce-java11-20.1.0/bin:/usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2/bin:/usr/local/src/spark-3.0.0-preview2-bin-hadoop3.2/sbin:/usr/local/src/gradle-6.1/bin:/usr/local/src/solr-8.5.1/bin:/usr/local/src/apache-maven-3.6.3/bin:/usr/local/src/jdk-11/bin:/usr/local/src/jdk-11/bin:/usr/local/src/osxcross/target/bin:/home/aine/.cargo/bin:/usr/local/src/flutter/bin:/usr/local/src/chromedriver_linux64:/usr/local/src/chrome-linux:/usr/local/src/go/bin:/home/aine/.local/go-repo/bin:/usr/share/elasticsearch/bin:/home/aine/.local/script-search/bin:/home/aine/.local/script-cmd/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```


torのインストール
サービス管理のプロセス

```
$ sudo apt install tor
[sudo] aine のパスワード:
パッケージリストを読み込んでいます... 完了
依存関係ツリーを作成しています
状態情報を読み取っています... 完了
以下の追加パッケージがインストールされます:
  tor-geoipdb torsocks
提案パッケージ:
  mixmaster torbrowser-launcher socat tor-arm apparmor-utils obfs4proxy
以下のパッケージが新たにインストールされます:
  tor tor-geoipdb torsocks
アップグレード: 0 個、新規インストール: 3 個、削除: 0 個、保留: 0 個。
2,439 kB のアーカイブを取得する必要があります。
この操作後に追加で 13.5 MB のディスク容量が消費されます。
続行しますか? [Y/n] y
取得:1 http://jp.archive.ubuntu.com/ubuntu focal/universe amd64 tor amd64 0.4.2.7-1 [1,410 kB]
取得:2 http://jp.archive.ubuntu.com/ubuntu focal/universe amd64 torsocks amd64 2.3.0-2 [61.5 kB]
取得:3 http://jp.archive.ubuntu.com/ubuntu focal/universe amd64 tor-geoipdb all 0.4.2.7-1 [968 kB]
2,439 kB を 0秒 で取得しました (5,340 kB/s)
以前に未選択のパッケージ tor を選択しています。
(データベースを読み込んでいます ... 現在 250565 個のファイルとディレクトリがインストールされています。)
.../tor_0.4.2.7-1_amd64.deb を展開する準備をしています ...
tor (0.4.2.7-1) を展開しています...
以前に未選択のパッケージ torsocks を選択しています。
.../torsocks_2.3.0-2_amd64.deb を展開する準備をしています ...
torsocks (2.3.0-2) を展開しています...
以前に未選択のパッケージ tor-geoipdb を選択しています。
.../tor-geoipdb_0.4.2.7-1_all.deb を展開する準備をしています ...
tor-geoipdb (0.4.2.7-1) を展開しています...
tor (0.4.2.7-1) を設定しています ...
Something or somebody made /var/lib/tor disappear.
Creating one for you again.
Something or somebody made /var/log/tor disappear.
Creating one for you again.
Created symlink /etc/systemd/system/multi-user.target.wants/tor.service → /lib/systemd/system/tor.service.
torsocks (2.3.0-2) を設定しています ...
tor-geoipdb (0.4.2.7-1) を設定しています ...
man-db (2.9.1-1) のトリガを処理しています ...
systemd (245.4-4ubuntu3.2) のトリガを処理しています ...
```


```
$ tor --version
Tor version 0.4.2.7.
```

```
$ systemctl status tor
● tor.service - Anonymizing overlay network for TCP (multi-instance-master)
     Loaded: loaded (/lib/systemd/system/tor.service; enabled; vendor preset: enabled)
     Active: active (exited) since Thu 2020-08-06 02:35:02 JST; 57s ago
   Main PID: 124275 (code=exited, status=0/SUCCESS)
      Tasks: 0 (limit: 38313)
     Memory: 0B
     CGroup: /system.slice/tor.service

 8月 06 02:35:02 aine-MS-7B98 systemd[1]: Starting Anonymizing overlay network for TCP (multi-instance-master)...
 8月 06 02:35:02 aine-MS-7B98 systemd[1]: Finished Anonymizing overlay network for TCP (multi-instance-master).
```

```
$ which tor
/usr/sbin/tor
```


プロセス

```
$ ps auxwwf | grep debian | grep -v grep
debian-+  124296  0.5  0.1  40296 35696 ?        Ss   02:35   0:01 /usr/bin/tor --defaults-torrc /usr/share/tor/tor-service-defaults-torrc -f /etc/tor/torrc --RunAsDaemon 0
```

ブラウザもある

```
$ tor --help
Copyright (c) 2001-2004, Roger Dingledine
Copyright (c) 2004-2006, Roger Dingledine, Nick Mathewson
Copyright (c) 2007-2019, The Tor Project, Inc.

tor -f <torrc> [args]
See man page for options, or https://www.torproject.org/ for documentation.
```

rootユーザーで実施

9050でLISTEN

最終行でホスト名を別のホスト名にマスカレードしてESTABLISHED

torはルータ上ではなくローカルホスト上でのプロキシサーバみたいな振る舞い
グローバルプライベートIP（本物）をグローバルパブリックIP（偽物）に変換するようなイメージ。

リクエストの代行

- https://qiita.com/syui/items/ebd6734a8102c7906cc1

```
$ lsof -P | awk '$1=="tor"'
lsof: WARNING: can't stat() fuse.gvfsd-fuse file system /run/user/1000/gvfs
      Output information may be incomplete.
lsof: WARNING: can't stat() fuse.portal file system /run/user/1000/doc
      Output information may be incomplete.
tor       124296                        debian-tor  cwd       DIR              259,3      4096          2 /
tor       124296                        debian-tor  rtd       DIR              259,3      4096          2 /
tor       124296                        debian-tor  txt       REG              259,3   3351256    2888952 /usr/bin/tor
tor       124296                        debian-tor  mem       REG              259,3     51832    2891598 /usr/lib/x86_64-linux-gnu/libnss_files-2.31.so
tor       124296                        debian-tor  mem       REG              259,3    104984    2891123 /usr/lib/x86_64-linux-gnu/libgcc_s.so.1
tor       124296                        debian-tor  mem       REG              259,3    137584    2891212 /usr/lib/x86_64-linux-gnu/libgpg-error.so.0.28.0
tor       124296                        debian-tor  mem       REG              259,3   1168056    2891136 /usr/lib/x86_64-linux-gnu/libgcrypt.so.20.2.5
tor       124296                        debian-tor  mem       REG              259,3    129248    2891469 /usr/lib/x86_64-linux-gnu/liblz4.so.1.9.2
tor       124296                        debian-tor  mem       REG              259,3     40040    2891800 /usr/lib/x86_64-linux-gnu/librt-2.31.so
tor       124296                        debian-tor  mem       REG              259,3     18816    2890971 /usr/lib/x86_64-linux-gnu/libdl-2.31.so
tor       124296                        debian-tor  mem       REG              259,3   2029224    2890836 /usr/lib/x86_64-linux-gnu/libc-2.31.so
tor       124296                        debian-tor  mem       REG              259,3    157224    2891739 /usr/lib/x86_64-linux-gnu/libpthread-2.31.so
tor       124296                        debian-tor  mem       REG              259,3     31120    2890857 /usr/lib/x86_64-linux-gnu/libcap.so.2.32
tor       124296                        debian-tor  mem       REG              259,3    334192    2885356 /usr/lib/x86_64-linux-gnu/libseccomp.so.2.4.3
tor       124296                        debian-tor  mem       REG              259,3    686160    2892172 /usr/lib/x86_64-linux-gnu/libzstd.so.1.4.4
tor       124296                        debian-tor  mem       REG              259,3    153912    2891471 /usr/lib/x86_64-linux-gnu/liblzma.so.5.2.4
tor       124296                        debian-tor  mem       REG              259,3    701152    2884452 /usr/lib/x86_64-linux-gnu/libsystemd.so.0.28.0
tor       124296                        debian-tor  mem       REG              259,3   2954080    2890917 /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
tor       124296                        debian-tor  mem       REG              259,3    598104    2891897 /usr/lib/x86_64-linux-gnu/libssl.so.1.1
tor       124296                        debian-tor  mem       REG              259,3    346672    2891044 /usr/lib/x86_64-linux-gnu/libevent-2.1.so.7.0.0
tor       124296                        debian-tor  mem       REG              259,3   1369352    2891474 /usr/lib/x86_64-linux-gnu/libm-2.31.so
tor       124296                        debian-tor  mem       REG              259,3    108936    2892168 /usr/lib/x86_64-linux-gnu/libz.so.1.2.11
tor       124296                        debian-tor  mem       REG              259,3    191472    2890596 /usr/lib/x86_64-linux-gnu/ld-2.31.so
tor       124296                        debian-tor    0r      CHR                1,3       0t0          6 /dev/null
tor       124296                        debian-tor    1u     unix 0xffff9294122e0c00       0t0    1617291 type=STREAM
tor       124296                        debian-tor    2u     unix 0xffff9294122e0c00       0t0    1617291 type=STREAM
tor       124296                        debian-tor    3u  a_inode               0,14         0      16598 [eventpoll]
tor       124296                        debian-tor    4r     FIFO               0,13       0t0    1615145 pipe
tor       124296                        debian-tor    5w     FIFO               0,13       0t0    1615145 pipe
tor       124296                        debian-tor    6u     IPv4            1615146       0t0        TCP localhost:9050 (LISTEN)
tor       124296                        debian-tor    7u     unix 0xffff9294193e4000       0t0    1615149 type=DGRAM
tor       124296                        debian-tor    8uW     REG              259,3         0    5642049 /var/lib/tor/lock
tor       124296                        debian-tor    9u     unix 0xffff9294193e6000       0t0    1615181 /run/tor/socks type=STREAM
tor       124296                        debian-tor   10u     unix 0xffff9294193e1000       0t0    1615182 /run/tor/control type=STREAM
tor       124296                        debian-tor   17u     IPv4            1618330       0t0        TCP aine-MS-7B98:44966->host-185-117-118-59.creanova.org:443 (ESTABLISHED)
```
