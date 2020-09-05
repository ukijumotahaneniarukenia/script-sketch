常駐デーモン化対象のプロセス

ジュピターノートブック

```
pip3 install --user jupyter

pip3 install --user jupyter_contrib_nbextensions

jupyter contrib nbextension install --user

jupyter nbextension enable codefolding/main
```

systemdが使える環境で実施
dockerコンテナだとNG
systemd-spawnだといけるはず


CMD

```
apt install -y supervisor
```

OUT

```
パッケージリストを読み込んでいます... 完了
依存関係ツリーを作成しています                
状態情報を読み取っています... 完了
以下のパッケージが自動でインストールされましたが、もう必要とされていません:
  libfprint-2-tod1 libllvm9 python3-click python3-colorama
これを削除するには 'sudo apt autoremove' を利用してください。
提案パッケージ:
  supervisor-doc
以下のパッケージが新たにインストールされます:
  supervisor
アップグレード: 0 個、新規インストール: 1 個、削除: 0 個、保留: 36 個。
281 kB のアーカイブを取得する必要があります。
この操作後に追加で 1,682 kB のディスク容量が消費されます。
取得:1 http://jp.archive.ubuntu.com/ubuntu focal/universe amd64 supervisor all 4.1.0-1ubuntu1 [281 kB]
281 kB を 0秒 で取得しました (2,165 kB/s)
以前に未選択のパッケージ supervisor を選択しています。
(データベースを読み込んでいます ... 現在 235680 個のファイルとディレクトリがインストールされています。)
.../supervisor_4.1.0-1ubuntu1_all.deb を展開する準備をしています ...
supervisor (4.1.0-1ubuntu1) を展開しています...
supervisor (4.1.0-1ubuntu1) を設定しています ...
Created symlink /etc/systemd/system/multi-user.target.wants/supervisor.service → /lib/systemd/system/supervisor.service.
man-db (2.9.1-1) のトリガを処理しています ...
systemd (245.4-4ubuntu3.2) のトリガを処理しています ...
```

インストール直後サービス起動している

CMD

```
$ systemctl status supervisor
```

OUT

```
● supervisor.service - Supervisor process control system for UNIX
     Loaded: loaded (/lib/systemd/system/supervisor.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2020-09-05 08:58:54 JST; 11min ago
       Docs: http://supervisord.org
   Main PID: 398225 (supervisord)
      Tasks: 1 (limit: 38313)
     Memory: 15.3M
     CGroup: /system.slice/supervisor.service
             └─398225 /usr/bin/python3 /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

 9月 05 08:58:54 aine-MS-7B98 systemd[1]: Started Supervisor process control system for UNIX.
 9月 05 08:58:54 aine-MS-7B98 supervisord[398225]: 2020-09-05 08:58:54,449 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file. >
 9月 05 08:58:54 aine-MS-7B98 supervisord[398225]: 2020-09-05 08:58:54,449 WARN No file matches via include "/etc/supervisor/conf.d/*.conf"
 9月 05 08:58:54 aine-MS-7B98 supervisord[398225]: 2020-09-05 08:58:54,452 INFO RPC interface 'supervisor' initialized
 9月 05 08:58:54 aine-MS-7B98 supervisord[398225]: 2020-09-05 08:58:54,452 CRIT Server 'unix_http_server' running without any HTTP authentication checking
 9月 05 08:58:54 aine-MS-7B98 supervisord[398225]: 2020-09-05 08:58:54,452 INFO supervisord started with pid 398225
```

設定ファイル等の確認

CMD

```
$ find / -type f |& grep supervisord 2>/dev/null
```

OUT

```
/etc/supervisor/supervisord.conf
/usr/lib/python3/dist-packages/supervisor/__pycache__/supervisord.cpython-38.pyc
/usr/lib/python3/dist-packages/supervisor/supervisord.py
/usr/lib/python3/dist-packages/supervisor/tests/test_supervisord.py
/usr/lib/python3/dist-packages/supervisor/tests/__pycache__/test_supervisord.cpython-38.pyc
/usr/share/man/man1/echo_supervisord_conf.1.gz
/usr/share/man/man1/supervisord.1.gz
/usr/bin/supervisord
/usr/bin/echo_supervisord_conf
/run/supervisord.pid
/var/log/supervisor/supervisord.log
```

設定ファイル

以下の内容を追加

```
[inet_http_server]
port=127.0.0.1:9001

[supervisorctl]
serverurl=unix:///var/tmp/supervisor.sock
serverurl=http://127.0.0.1:9001
```

修正前

```
$ cat /etc/supervisor/supervisord.conf
; supervisor config file

[unix_http_server]
file=/var/run/supervisor.sock   ; (the path to the socket file)
chmod=0700                       ; sockef file mode (default 0700)

[supervisord]
logfile=/var/log/supervisor/supervisord.log ; (main log file;default $CWD/supervisord.log)
pidfile=/var/run/supervisord.pid ; (supervisord pidfile;default supervisord.pid)
childlogdir=/var/log/supervisor            ; ('AUTO' child log dir, default $TEMP)

; the below section must remain in the config file for RPC
; (supervisorctl/web interface) to work, additional interfaces may be
; added by defining them in separate rpcinterface: sections
[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix:///var/run/supervisor.sock ; use a unix:// URL  for a unix socket

; The [include] section can just contain the "files" setting.  This
; setting can list multiple files (separated by whitespace or
; newlines).  It can also contain wildcards.  The filenames are
; interpreted as relative to this file.  Included files *cannot*
; include files themselves.

[include]
files = /etc/supervisor/conf.d/*.conf
```

修正後

```
$ cat /etc/supervisor/supervisord.conf
; supervisor config file

[inet_http_server]
port=127.0.0.1:9001

[supervisorctl]
serverurl=unix:///var/tmp/supervisor.sock
serverurl=http://127.0.0.1:9001

[unix_http_server]
file=/var/run/supervisor.sock   ; (the path to the socket file)
chmod=0700                       ; sockef file mode (default 0700)

[supervisord]
logfile=/var/log/supervisor/supervisord.log ; (main log file;default $CWD/supervisord.log)
pidfile=/var/run/supervisord.pid ; (supervisord pidfile;default supervisord.pid)
childlogdir=/var/log/supervisor            ; ('AUTO' child log dir, default $TEMP)

; the below section must remain in the config file for RPC
; (supervisorctl/web interface) to work, additional interfaces may be
; added by defining them in separate rpcinterface: sections
[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix:///var/run/supervisor.sock ; use a unix:// URL  for a unix socket

; The [include] section can just contain the "files" setting.  This
; setting can list multiple files (separated by whitespace or
; newlines).  It can also contain wildcards.  The filenames are
; interpreted as relative to this file.  Included files *cannot*
; include files themselves.

[include]
files = /etc/supervisor/conf.d/*.conf
```

個別設定ファイル

```
$ ll /etc/supervisor/conf.d/
合計 8.0K
drwxr-xr-x 2 root root 4.0K 11月  1  2019 .
drwxr-xr-x 3 root root 4.0K  9月  5 09:10 ..

$ sudo touch /etc/supervisor/conf.d/supervisor.conf


$ ll /etc/supervisor/conf.d/
合計 8.0K
drwxr-xr-x 2 root root 4.0K  9月  5 09:41 .
drwxr-xr-x 3 root root 4.0K  9月  5 09:10 ..
-rw-r--r-- 1 root root    0  9月  5 09:41 supervisor.conf

起動コマンドはフルパス指定
$ which jupyter
/home/aine/.local/bin/jupyter

$ cat <<EOS >/etc/supervisor/conf.d/supervisor-jupyter-notebook.conf
[program:jupyter-notebook]
command=/home/aine/.local/bin/jupyter notebook ; 起動コマンド
user=aine ; 起動ユーザ
autorestart=true ; プロセスダウン時に自動再起動
stdout_logfile=/var/log/supervisor/supervisord-jupyter-notebook.log ; 標準出力ログ
stdout_logfile_maxbytes=1MB
stdout_logfile_backups=5
stdout_capture_maxbytes=1MB
redirect_stderr=true ; エラー出力を標準出力にリダイレクト
EOS
```



ログローテーション設定

デフォルトで設定済みのファイルはたくさんあるので、真似る

```
$ ls -lh /etc/logrotate.d/*
-rw-r--r-- 1 root root 120  9月  6  2019 /etc/logrotate.d/alternatives
-rw-r--r-- 1 root root 126 12月  5  2019 /etc/logrotate.d/apport
-rw-r--r-- 1 root root 173  4月  9 19:21 /etc/logrotate.d/apt
-rw-r--r-- 1 root root  91  4月  1 18:49 /etc/logrotate.d/bootlog
-rw-r--r-- 1 root root 130  1月 21  2019 /etc/logrotate.d/btmp
-rw-r--r-- 1 root root 181  2月 17  2020 /etc/logrotate.d/cups-daemon
-rw-r--r-- 1 root root 112  9月  6  2019 /etc/logrotate.d/dpkg
-rw-r--r-- 1 root root  94  2月  9  2019 /etc/logrotate.d/ppp
-rw-r--r-- 1 root root 501  3月  7  2019 /etc/logrotate.d/rsyslog
-rw-r--r-- 1 root root 677 11月 29  2019 /etc/logrotate.d/speech-dispatcher
-rw-r--r-- 1 root root 119  3月 31 05:49 /etc/logrotate.d/ubuntu-advantage-tools
-rw-r--r-- 1 root root 178  1月 22  2020 /etc/logrotate.d/ufw
-rw-r--r-- 1 root root 235  4月 14 07:37 /etc/logrotate.d/unattended-upgrades
-rw-r--r-- 1 root root 145  2月 19  2018 /etc/logrotate.d/wtmp
```

ログローテーションのシステム共通設定ファイル

```
$ cat /etc/logrotate.conf
# see "man logrotate" for details
# rotate log files weekly
weekly

# use the adm group by default, since this is the owning group
# of /var/log/syslog.
su root adm

# keep 4 weeks worth of backlogs
rotate 4

# create new (empty) log files after rotating old ones
create

# use date as a suffix of the rotated file
#dateext

# uncomment this if you want your log files compressed
#compress

# packages drop log rotation information into this directory
include /etc/logrotate.d

# system-specific logs may be also be configured here.
```

設定対象のログファイル

supervisor

/var/log/supervisor/supervisord.log


設定ファイル
/etc/logrotate.d/supervisor

```
$ cat <<EOS >/etc/logrotate.d/supervisor
/var/log/supervisor/supervisord.log {
    notifempty
    dateformat .%Y%m%d
    missingok
    nocompress
    daily
    rotate 10
}
EOS

```

設定対象のログファイル

jupyter-notebook

/var/log/supervisor/supervisord-jupyter-notebook.log

設定ファイル
/etc/logrotate.d/supervisor-jupyter-notebook


```
$ cat <<EOS >/etc/logrotate.d/supervisor-jupyter-notebook
/var/log/supervisor/supervisord-jupyter-notebook.log {
    notifempty
    dateformat .%Y%m%d
    missingok
    nocompress
    daily
    rotate 10
}
EOS
```

supervisorとjupyter-notebookが設定されていることを確認

```
$ ls -ltr /etc/logrotate.d/*
-rw-r--r-- 1 root root 145  2月 19  2018 /etc/logrotate.d/wtmp
-rw-r--r-- 1 root root 130  1月 21  2019 /etc/logrotate.d/btmp
-rw-r--r-- 1 root root  94  2月  9  2019 /etc/logrotate.d/ppp
-rw-r--r-- 1 root root 501  3月  7  2019 /etc/logrotate.d/rsyslog
-rw-r--r-- 1 root root 112  9月  6  2019 /etc/logrotate.d/dpkg
-rw-r--r-- 1 root root 120  9月  6  2019 /etc/logrotate.d/alternatives
-rw-r--r-- 1 root root 677 11月 29  2019 /etc/logrotate.d/speech-dispatcher
-rw-r--r-- 1 root root 126 12月  5  2019 /etc/logrotate.d/apport
-rw-r--r-- 1 root root 178  1月 22  2020 /etc/logrotate.d/ufw
-rw-r--r-- 1 root root 181  2月 17  2020 /etc/logrotate.d/cups-daemon
-rw-r--r-- 1 root root 119  3月 31 05:49 /etc/logrotate.d/ubuntu-advantage-tools
-rw-r--r-- 1 root root  91  4月  1 18:49 /etc/logrotate.d/bootlog
-rw-r--r-- 1 root root 173  4月  9 19:21 /etc/logrotate.d/apt
-rw-r--r-- 1 root root 235  4月 14 07:37 /etc/logrotate.d/unattended-upgrades
-rw-r--r-- 1 root root 131  9月  5 09:19 /etc/logrotate.d/supervisor
-rw-r--r-- 1 root root 148  9月  5 10:20 /etc/logrotate.d/supervisor-jupyter-notebook
```


ローテート確認

ドライラン

追加したsupervisorを中心に確認

CMD
```
$ logrotate -dv /etc/logrotate.conf
```

OUT
```
rotating pattern: /var/log/supervisor/supervisord.log  after 1 days (10 rotations)
empty log files are not rotated, old logs are removed
switching euid to 0 and egid to 4
considering log /var/log/supervisor/supervisord.log
Creating new state
  Now: 2020-09-05 10:21
  Last rotated at 2020-09-05 10:00
  log does not need rotating (log has been already rotated)
switching euid to 0 and egid to 0

rotating pattern: /var/log/supervisor/supervisord-jupyter-notebook.log  after 1 days (10 rotations)
empty log files are not rotated, old logs are removed
switching euid to 0 and egid to 4
considering log /var/log/supervisor/supervisord-jupyter-notebook.log
Creating new state
  Now: 2020-09-05 10:21
  Last rotated at 2020-09-05 10:00
  log does not need rotating (log has been already rotated)
switching euid to 0 and egid to 0
```

サービスの再起動

```
systemctl stop supervisor
systemctl start supervisor
```

状態確認

CMD
```
systemctl status supervisor
```

OUT
```
● supervisor.service - Supervisor process control system for UNIX
     Loaded: loaded (/lib/systemd/system/supervisor.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2020-09-05 10:22:41 JST; 5s ago
       Docs: http://supervisord.org
   Main PID: 405230 (supervisord)
      Tasks: 2 (limit: 38313)
     Memory: 58.7M
     CGroup: /system.slice/supervisor.service
             ├─405230 /usr/bin/python3 /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
             └─405242 /usr/bin/python3 /home/aine/.local/bin/jupyter-notebook

 9月 05 10:22:41 aine-MS-7B98 systemd[1]: Started Supervisor process control system for UNIX.
 9月 05 10:22:41 aine-MS-7B98 supervisord[405230]: 2020-09-05 10:22:41,790 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file. >
 9月 05 10:22:41 aine-MS-7B98 supervisord[405230]: 2020-09-05 10:22:41,790 INFO Included extra file "/etc/supervisor/conf.d/supervisor-jupyter-notebook.conf" during parsing
 9月 05 10:22:41 aine-MS-7B98 supervisord[405230]: 2020-09-05 10:22:41,793 INFO RPC interface 'supervisor' initialized
 9月 05 10:22:41 aine-MS-7B98 supervisord[405230]: 2020-09-05 10:22:41,793 CRIT Server 'inet_http_server' running without any HTTP authentication checking
 9月 05 10:22:41 aine-MS-7B98 supervisord[405230]: 2020-09-05 10:22:41,793 INFO RPC interface 'supervisor' initialized
 9月 05 10:22:41 aine-MS-7B98 supervisord[405230]: 2020-09-05 10:22:41,793 CRIT Server 'unix_http_server' running without any HTTP authentication checking
 9月 05 10:22:41 aine-MS-7B98 supervisord[405230]: 2020-09-05 10:22:41,794 INFO supervisord started with pid 405230
 9月 05 10:22:42 aine-MS-7B98 supervisord[405230]: 2020-09-05 10:22:42,797 INFO spawned: 'jupyter-notebook' with pid 405242
 9月 05 10:22:44 aine-MS-7B98 supervisord[405230]: 2020-09-05 10:22:44,166 INFO success: jupyter-notebook entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
```

CMD

ポート単位で確認

```
$ lsof -i:9001 -i:8888 -P
jupyter-n 405242 aine    4u  IPv4 4587667      0t0  TCP localhost:8888 (LISTEN)
```

OUT

```
COMMAND      PID USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
superviso 405230 root    4u  IPv4 4583199      0t0  TCP localhost:9001 (LISTEN)
jupyter-n 405242 aine    4u  IPv4 4587667      0t0  TCP localhost:8888 (LISTEN)
```

ブラウザで確認

```
$ which brave-browser
/usr/bin/brave-browser

Web立ち上がるか確認

supervisorの方
$ brave-browser http://localhost:9001


jupyter notebookの方
$ brave-browser http://localhost:8888

```


起動ログ確認

```
$ ll /var/log/supervisor/*
-rw-r--r-- 1 root root 3.0K  9月  5 10:27 /var/log/supervisor/supervisord-jupyter-notebook.log
-rw-r--r-- 1 root root 3.4K  9月  5 10:22 /var/log/supervisor/supervisord.log


$ cat /var/log/supervisor/supervisord-jupyter-notebook.log
[I 09:46:57.264 NotebookApp] ノートブックサーバは cookie secret を /home/aine/.local/share/jupyter/runtime/notebook_cookie_secret に書き込みます
[I 09:46:57.388 NotebookApp] [jupyter_nbextensions_configurator] enabled 0.4.1
[I 09:46:57.388 NotebookApp] ローカルディレクトリからノートブックをサーブ: /
[I 09:46:57.388 NotebookApp] Jupyter Notebook 6.1.3 is running at:
[I 09:46:57.388 NotebookApp] http://localhost:8888/?token=ace1b3db37df0e9488ff60ad17bdb1105cd76dc84de3d1d7
[I 09:46:57.388 NotebookApp]  or http://127.0.0.1:8888/?token=ace1b3db37df0e9488ff60ad17bdb1105cd76dc84de3d1d7
[I 09:46:57.388 NotebookApp] サーバを停止し全てのカーネルをシャットダウンするには Control-C を使って下さい(確認をスキップするには2回)。
[W 09:46:57.390 NotebookApp] ウェブブラウザが見つかりません: could not locate runnable browser
[C 09:46:57.390 NotebookApp] 
    
    To access the notebook, open this file in a browser:
        file:///home/aine/.local/share/jupyter/runtime/nbserver-402258-open.html
    Or copy and paste one of these URLs:
        http://localhost:8888/?token=ace1b3db37df0e9488ff60ad17bdb1105cd76dc84de3d1d7
     or http://127.0.0.1:8888/?token=ace1b3db37df0e9488ff60ad17bdb1105cd76dc84de3d1d7
[I 09:53:24.265 NotebookApp] 302 GET / (127.0.0.1) 0.36ms
[I 09:53:24.266 NotebookApp] 302 GET /tree? (127.0.0.1) 0.43ms
```

自動起動設定

大丈夫そうやったら登録

```
systemctl enable supervisor.service
```


設定削除

supervisor自体は残す場合

```
systemctl stop supervisor.service

rm /etc/logrotate.d/supervisor-jupyter-notebook

rm /etc/supervisor/conf.d/supervisor-jupyter-notebook.conf

```


supervisor自体も削除する場合


```
systemctl stop supervisor.service

rm /etc/logrotate.d/supervisor-jupyter-notebook

rm /etc/supervisor/conf.d/supervisor-jupyter-notebook.conf

apt remove supervisor
```

