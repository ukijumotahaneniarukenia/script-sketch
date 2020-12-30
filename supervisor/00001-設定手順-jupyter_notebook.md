supervisorコマンドインストール

CMD

```
apt install -y supervisor
```

ログ出力先確認

```
$ ls -lh /var/log/supervisor
total 8.0K
-rw-r--r-- 1 root root 1.5K  9月 21 21:58 supervisord-jupyter_notebook.log
-rw-r--r-- 1 root root 1.3K  9月 21 21:57 supervisord.log
```

サービス状態確認

```
systemctl status supervisor.service
```

supervisorシステム共通設定ファイルの編集

PRE


```
$ cat <<EOS > add-config-content.txt 
[inet_http_server]
port=127.0.0.1:9001

[supervisorctl]
serverurl=unix:///var/tmp/supervisor.sock
serverurl=http://127.0.0.1:9001
EOS
```


CMD


```
$ sudo sed -i '/; supervisor config file/r add-config-content.txt' /etc/supervisor/supervisord.conf
```



POST

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

supervisor設定ファイルは以下のディレクトリ配下を読み込む


```
[include]
files = /etc/supervisor/conf.d/*.conf
```

プロセス個別設定ファイルの登録


起動コマンドはフルパス指定

```
$ which jupyter
/home/aine/.local/bin/jupyter
```

jupyter_notebookを登録する例

```
$ cat <<EOS >/etc/supervisor/conf.d/supervisor-jupyter_notebook.conf
[program:jupyter_notebook]
command=/home/aine/.local/bin/jupyter notebook ; 起動コマンド
user=aine ; 起動ユーザ
autorestart=true ; プロセスダウン時に自動再起動
stdout_logfile=/var/log/supervisor/supervisord-jupyter_notebook.log ; 標準出力ログ
stdout_logfile_maxbytes=1MB
stdout_logfile_backups=5
stdout_capture_maxbytes=1MB
redirect_stderr=true ; エラー出力を標準出力にリダイレクト
EOS
```

ログローテションシステム共通設定ファイル

```
$ ls -lh /etc/logrotate.conf
-rw-r--r-- 1 root root 703  8月 22  2017 /etc/logrotate.conf
```

```
$ cat /etc/logrotate.conf
# see "man logrotate" for details
# rotate log files weekly
weekly

# use the syslog group by default, since this is the owning group
# of /var/log/syslog.
su root syslog

# keep 4 weeks worth of backlogs
rotate 4

# create new (empty) log files after rotating old ones
create

# uncomment this if you want your log files compressed
#compress

# packages drop log rotation information into this directory
include /etc/logrotate.d

# no packages own wtmp, or btmp -- we'll rotate them here
/var/log/wtmp {
    missingok
    monthly
    create 0664 root utmp
    rotate 1
}

/var/log/btmp {
    missingok
    monthly
    create 0660 root utmp
    rotate 1
}

# system-specific logs may be configured here
```

supervisor設定ファイルは以下のディレクトリ配下を読み込む


```
# packages drop log rotation information into this directory
include /etc/logrotate.d
```

プロセス個別設定ファイルの登録


supervisorプロセスで常駐デーモンプロセス化させるので、supervisorプロセスのログ出力先に起動ログを出力する

```
$ cat <<EOS >/etc/logrotate.d/supervisor-jupyter_notebook
/var/log/supervisor/supervisord-jupyter_notebook.log {
    notifempty
    dateformat .%Y%m%d
    missingok
    nocompress
    daily
    rotate 10
}
EOS
```


設定ファイル確認

CMD

```
$ sudo logrotate -dv /etc/logrotate.conf |& grep 'reading config file'
```

OUT

```
reading config file /etc/logrotate.conf
reading config file alternatives
reading config file apt
reading config file dpkg
reading config file rsyslog
reading config file supervisor
reading config file supervisor-jupyter_notebook
```


サービス停止

```
systemctl stop supervisor.service
```

サービス開始

```
systemctl start supervisor.service
```

サービス自動起動設定

```
systemctl enable supervisor.service
```

サービス状態確認

CMD

```
$ systemctl status supervisor
```

OUT


```
● supervisor.service - Supervisor process control system for UNIX
   Loaded: loaded (/lib/systemd/system/supervisor.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2020-09-22 08:00:52 JST; 7s ago
     Docs: http://supervisord.org
  Process: 21916 ExecStop=/usr/bin/supervisorctl $OPTIONS shutdown (code=exited, status=0/SUCCESS)
 Main PID: 21920 (supervisord)
   CGroup: /system.slice/supervisor.service
           ├─21920 /usr/bin/python /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
           └─21923 /usr/local/bin/python3.7 /home/aine/.local/bin/jupyter_notebook
```

CMD

```
$ sudo lsof -i:9001 -i:8888 -P
```

OUT

```
COMMAND     PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
superviso 21920 root    4u  IPv4 429452      0t0  TCP localhost:9001 (LISTEN)
jupyter-n 21923 aine    6u  IPv4 418714      0t0  TCP localhost:8888 (LISTEN)
jupyter-n 21923 aine    7u  IPv6 418715      0t0  TCP localhost:8888 (LISTEN)
```


ブラウザで確認

```
$ which brave-browser
/usr/bin/brave-browser

Web立ち上がるか確認

#supervisorの方
$ brave-browser http://localhost:9001


#jupyter notebookの方
$ brave-browser http://localhost:8888
```

サービス一括状態確認

CMD

```
$ service --status-all
```

OUT

```
 [ - ]  console-setup.sh
 [ + ]  cron
 [ + ]  dbus
 [ - ]  hwclock.sh
 [ - ]  keyboard-setup.sh
 [ - ]  kmod
 [ - ]  procps
 [ + ]  rsyslog
 [ + ]  supervisor
 [ - ]  udev
 [ - ]  x11-common
```


アンインストール

```
#サービスの停止
systemctl stop supervisor.service

#サービスの自動起動停止
systemctl disable supervisor.service

#設定ファイル削除
rm /etc/logrotate.d/supervisor-jupyter_notebook

#設定ファイル削除
rm /etc/supervisor/conf.d/supervisor.conf

#設定ファイル削除
rm /etc/supervisor/conf.d/supervisor-jupyter_notebook.conf

#コマンド削除
apt remove supervisor
```

