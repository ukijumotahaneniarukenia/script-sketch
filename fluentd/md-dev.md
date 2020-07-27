- https://docs.fluentd.org/installation/before-install
- https://docs.fluentd.org/input
- http://pppurple.hatenablog.com/entry/2018/02/17/035403
- https://blog.idcf.jp/entry/elasticsearch1

 サービス起動
```
[root@c043a1da5978 /]# systemctl start td-agent.service
[root@c043a1da5978 /]# systemctl status td-agent.service
● td-agent.service - td-agent: Fluentd based data collector for Treasure Data
   Loaded: loaded (/usr/lib/systemd/system/td-agent.service; disabled; vendor preset: disabled)
   Active: active (running) since Sun 2019-09-08 12:54:36 UTC; 4s ago
     Docs: https://docs.treasuredata.com/articles/td-agent
  Process: 632 ExecStart=/opt/td-agent/embedded/bin/fluentd --log /var/log/td-agent/td-agent.log --daemon /var/run/td-agent/td-agent.pid $TD_AGENT_OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 637 (fluentd)
   CGroup: /docker/c043a1da5978e4330de2076e27c326e03a953f8b79922db60837442bff893b25/system.slice/td-agent.service
           ├─637 /opt/td-agent/embedded/bin/ruby /opt/td-agent/embedded/bin/fluentd --log /var/log/td-agent/td-agent.log --daemon /var/run/td-agent/td-agent.pid
           └─642 /opt/td-agent/embedded/bin/ruby -Eascii-8bit:ascii-8bit /opt/td-agent/embedded/bin/fluentd --log /var/log/td-agent/td-agent.log --daemon /var/run/td-agent/td-agent.pid --...
           ‣ 637 /opt/td-agent/embedded/bin/ruby /opt/td-agent/embedded/bin/fluentd --log /var/log/td-agent/td-agent.log --daemon /var/run/td-agent/td-agent.pid

Sep 08 12:54:36 c043a1da5978 systemd[1]: Starting td-agent: Fluentd based data collector for Treasure Data...
Sep 08 12:54:36 c043a1da5978 systemd[1]: Started td-agent: Fluentd based data collector for Treasure Data.
```

 動作確認
```
[root@c043a1da5978 /]# lsof -i:80 -P
COMMAND PID  USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
nginx   676  root    6u  IPv4 40516334      0t0  TCP *:80 (LISTEN)
nginx   677 nginx    6u  IPv4 40516334      0t0  TCP *:80 (LISTEN)
[root@c043a1da5978 /]# lsof -i:8888 -P
COMMAND PID     USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
fluentd 862 td-agent   15u  IPv4 42204951      0t0  TCP *:8888 (LISTEN)
ruby    867 td-agent   15u  IPv4 42204951      0t0  TCP *:8888 (LISTEN)
[root@c043a1da5978 /]# curl -X POST -d 'json={"json":"message"}' http://localhost:8888/debug.test
[root@c043a1da5978 /]# tail /var/log/td-agent/td-agent.log
2019-09-08 13:25:10 +0000 [warn]: #0 [output_td] secondary type should be same with primary one primary="Fluent::Plugin::TreasureDataLogOutput" secondary="Fluent::Plugin::FileOutput"
2019-09-08 13:25:10 +0000 [info]: adding match pattern="debug.**" type="stdout"
2019-09-08 13:25:10 +0000 [info]: adding source type="forward"
2019-09-08 13:25:10 +0000 [info]: adding source type="http"
2019-09-08 13:25:10 +0000 [info]: adding source type="debug_agent"
2019-09-08 13:25:10 +0000 [info]: #0 starting fluentd worker pid=867 ppid=862 worker=0
2019-09-08 13:25:10 +0000 [info]: #0 [input_debug_agent] listening dRuby uri="druby://127.0.0.1:24230" object="Fluent::Engine" worker=0
2019-09-08 13:25:10 +0000 [info]: #0 [input_forward] listening port port=24224 bind="0.0.0.0"
2019-09-08 13:25:10 +0000 [info]: #0 fluentd worker is now running worker=0
2019-09-08 13:26:02.560792810 +0000 debug.test: {"json":"message"}
```

 fluentdコマンド
```
[root@c043a1da5978 /]# ll /usr/sbin/td-agent*
-rwxr-xr-x. 1 root root 348 Sep  8 12:22 /usr/sbin/td-agent
-rwxr-xr-x. 1 root root 177 Sep  8 12:22 /usr/sbin/td-agent-gem
```

```
[root@c043a1da5978 /]# /usr/sbin/td-agent-gem -h
RubyGems is a sophisticated package manager for Ruby.  This is a
basic help message containing pointers to more information.

  Usage:
    gem -h/--help
    gem -v/--version
    gem command [arguments...] [options...]

  Examples:
    gem install rake
    gem list --local
    gem build package.gemspec
    gem help install

  Further help:
    gem help commands            list all 'gem' commands
    gem help examples            show some examples of usage
    gem help gem_dependencies    gem dependencies file guide
    gem help platforms           gem platforms guide
    gem help <COMMAND>           show help on COMMAND
                                   (e.g. 'gem help install')
    gem server                   present a web page at
                                 http://localhost:8808/
                                 with info about installed gems
  Further information:
    http://guides.rubygems.org
```

