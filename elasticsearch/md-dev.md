過去分はここから

https://www.elastic.co/jp/downloads/past-releases

dbeaverのドライバのサポートバージョンが7.4.0なので、これに合わせる形

jdk

```
$java -version
openjdk version "11" 2018-09-25
OpenJDK Runtime Environment 18.9 (build 11+28)
OpenJDK 64-Bit Server VM 18.9 (build 11+28, mixed mode)
```

elasticsearch


```
cd /usr/local/src

tar xvf elasticsearch-oss-7.4.0-linux-x86_64.tar.gz

chown -R elasticsearch:elasticsearch elasticsearch-7.4.0/
```

パス設定

elasticsearchユーザーに設定

```
echo 'export ES_HOME=/usr/local/src/elasticsearch-7.4.0' >>$HOME/.bashrc
echo 'export PATH=$ES_HOME/bin:$PATH' >>$HOME/.bashrc
```


バージョン

```
$elasticsearch --version
OpenJDK 64-Bit Server VM warning: Option UseConcMarkSweepGC was deprecated in version 9.0 and will likely be removed in a future release.
Version: 7.4.0, Build: oss/tar/22e1767283e61a198cb4db791ea66e3f11ab9910/2019-09-27T08:36:48.569419Z, JVM: 11
```

ヘルプ

```
$elasticsearch --help
OpenJDK 64-Bit Server VM warning: Option UseConcMarkSweepGC was deprecated in version 9.0 and will likely be removed in a future release.
starts elasticsearch

Option                Description
------                -----------
-E <KeyValuePair>     Configure a setting
-V, --version         Prints elasticsearch version information and exits
-d, --daemonize       Starts Elasticsearch in the background
-h, --help            show help
-p, --pidfile <Path>  Creates a pid file in the specified path on start
-q, --quiet           Turns off standard output/error streams logging in console
-s, --silent          show minimal output
-v, --verbose         show verbose output

```

kibana

kibanaユーザーに設定

```
cd /usr/local/src

tar xvf kibana-oss-7.4.0-linux-x86_64.tar.gz

chown -R kibana:kibana kibana-7.4.0-linux-x86_64/
```

パス設定

```
echo 'export KIBANA_HOME=/usr/local/src/kibana-7.4.0-linux-x86_64' >>$HOME/.bashrc
echo 'export PATH=$KIBANA_HOME/bin:$PATH' >>$HOME/.bashrc
```

バージョン

```
$kibana --version
7.4.0
```

ヘルプ

```
$kibana --help

  Usage: bin/kibana [command=serve] [options]

  Kibana is an open source (Apache Licensed), browser based analytics and search dashboard for Elasticsearch.

  Commands:
    serve  [options]  Run the kibana server
    help  <command>   Get the help for a specific command

  "serve" Options:

    -e, --elasticsearch <uri1,uri2>  Elasticsearch instances
    -c, --config <path>              Path to the config file, use multiple --config args to include multiple config files (default: ["/usr/local/src/kibana-7.4.0-linux-x86_64/config/kibana.yml"])
    -p, --port <port>                The port to bind to
    -q, --quiet                      Prevent all logging except errors
    -Q, --silent                     Prevent all logging
    --verbose                        Turns on verbose logging
    -H, --host <host>                The host to bind to
    -l, --log-file <path>            The file to log to
    --plugin-dir <path>              A path to scan for plugins, this can be specified multiple times to specify multiple directories (default: ["/usr/local/src/kibana-7.4.0-linux-x86_64/plugins","/usr/local/src/kibana-7.4.0-linux-x86_64/src/legacy/core_plugins"])
    --plugin-path <path>             A path to a plugin which should be included by the server, this can be specified multiple times to specify multiple paths (default: [])
    --plugins <path>                 an alias for --plugin-dir
    --optimize                       Optimize and then stop the server
    -h, --help                       output usage information


```



elasticsearchプロセス起動

```
$elasticsearch -d --verbose 1>$HOME/launch-elasticsearch.log 2>&1
```


```
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kibana       1  0.0  0.0  14240  1248 pts/0    Ss   14:02   0:00 bash /etc/init/run.sh
kibana       8  0.0  0.0 237388 18380 ?        S    14:02   0:05 fcitx
kibana       9  0.0  0.0  14380  2016 pts/0    S+   14:02   0:00 bash
kibana      22  0.0  0.0  58908   884 ?        S    14:02   0:00 dbus-launch --autolaunch bc74deaa9e044c079ed6fc963d084157 --binary-syntax --close-stderr
kibana      29  0.0  0.0  58004  1364 ?        Ss   14:02   0:00 /usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --session
kibana      34  0.0  0.0  58284  1732 ?        Ss   14:02   0:01 /usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --config-file /usr/share/fcitx/dbus/daemon.conf
kibana      38  0.0  0.0  51300   784 ?        SN   14:02   0:00 /usr/bin/fcitx-dbus-watcher unix:abstract=/tmp/dbus-qqr563ropB,guid=2f0971c0a039b3e0a6cb87355ebf73ef 34
kibana    2428  0.0  0.0  14380  2076 pts/1    Ss   18:32   0:00 /bin/bash
kibana    2534  0.0  0.0 187424  2912 ?        Sl   18:33   0:00 /usr/libexec/dconf-service
kibana    2547  0.0  0.0 192900 12300 pts/1    S    18:35   0:00 dbeaver
kibana    2571  3.4  1.1 5843012 367424 pts/1  Sl   18:35   0:34 /bin/java -XX:+IgnoreUnrecognizedVMOptions -Xms64m -Xmx1024m -jar /usr/share/dbeaver//plugins/org.eclipse.equinox.launcher_1.5.700.v20200207-2156.
root      2671  0.0  0.0  87268  2632 pts/1    S    18:51   0:00 su elasticsearch
elastic+  2674  0.0  0.0  14380  2056 pts/1    S    18:51   0:00 bash
elastic+  2771  323  3.9 6131996 1290104 pts/1 Sl   18:51   0:12 /usr/local/src/jdk-11/bin/java -Xms1g -Xmx1g -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -Des
elastic+  2828  0.0  0.0  54312  1872 pts/1    R+   18:51   0:00 ps axu
```


```
$lsof -i:9200
COMMAND  PID          USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
java    2771 elasticsearch  248u  IPv4 27262732      0t0  TCP localhost:wap-wsp (LISTEN)
```

ヘルスチェック


```
$curl http://localhost:9200
{
  "name" : "doc-centos-7-6-18-10-elasticsearch-kibana-java-dbeaver",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "xGV_LjzOTiW_QMFu-_Xvjw",
  "version" : {
    "number" : "7.4.0",
    "build_flavor" : "oss",
    "build_type" : "tar",
    "build_hash" : "22e1767283e61a198cb4db791ea66e3f11ab9910",
    "build_date" : "2019-09-27T08:36:48.569419Z",
    "build_snapshot" : false,
    "lucene_version" : "8.2.0",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}
```


kibanaプロセス起動


設定ファイル修正

コマンドライン引数から指定できるぽいから臨機応変に

インスタントに必要やったら、コマンドライン引数に指定したほうがいいか

修正前

```
$grep -P 'server\.(name|port)' /usr/local/src/kibana-7.4.0-linux-x86_64/config/kibana.yml
#server.port: 5601
#server.name: "your-hostname"
```

修正内容確認

```
$sed -r "s/\#(.*)/\1/g" /usr/local/src/kibana-7.4.0-linux-x86_64/config/kibana.yml | grep -P 'server\.(port)'
server.port: 5601
```

```
$sed -r "s/\#server.name: \"your-hostname\"/server.name: $(ip a show | grep -Po '(\.?[0-9]{1,}){4}(?=/)' | grep -vP '^127')/g" /usr/local/src/kibana-7.4.0-linux-x86_64/config/kibana.yml | grep -P 'server\.(name)'
server.name: 172.17.0.4
```

```
$kibana -p 5601 -H $(ip a show | grep -Po '(\.?[0-9]{1,}){4}(?=/)' | grep -vP '^127') 1>$HOME/launch-kibana.log 2>&1 &
[2] 3087
$ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kibana       1  0.0  0.0  14240  1248 pts/0    Ss   14:02   0:00 bash /etc/init/run.sh
kibana       8  0.0  0.0 237388 18380 ?        S    14:02   0:05 fcitx
kibana       9  0.0  0.0  14380  2016 pts/0    S+   14:02   0:00 bash
kibana      22  0.0  0.0  58908   884 ?        S    14:02   0:00 dbus-launch --autolaunch bc74deaa9e044c079ed6fc963d084157 --binary-syntax --close-stderr
kibana      29  0.0  0.0  58004  1364 ?        Ss   14:02   0:00 /usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --session
kibana      34  0.0  0.0  58284  1732 ?        Ss   14:02   0:01 /usr/bin/dbus-daemon --fork --print-pid 5 --print-address 7 --config-file /usr/share/fcitx/dbus/daemon.conf
kibana      38  0.0  0.0  51300   784 ?        SN   14:02   0:00 /usr/bin/fcitx-dbus-watcher unix:abstract=/tmp/dbus-qqr563ropB,guid=2f0971c0a039b3e0a6cb87355ebf73ef 34
kibana    2428  0.0  0.0  14380  2076 pts/1    Ss   18:32   0:00 /bin/bash
kibana    2534  0.0  0.0 187424  2912 ?        Sl   18:33   0:00 /usr/libexec/dconf-service
kibana    2547  0.0  0.0 192900 12300 pts/1    S    18:35   0:00 dbeaver
kibana    2571  2.6  1.1 5843012 367544 pts/1  Sl   18:35   0:36 /bin/java -XX:+IgnoreUnrecognizedVMOptions -Xms64m -Xmx1024m -jar /usr/share/dbeaver//plugins/org.eclipse.equinox.launcher_1.5.700.v20200207-2156.
elastic+  2771  4.6  4.0 7203164 1310516 pts/1 Sl   18:51   0:19 /usr/local/src/jdk-11/bin/java -Xms1g -Xmx1g -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -Des
kibana    3087 57.5  0.4 1219148 132184 pts/1  Sl   18:58   0:02 /usr/local/src/kibana-7.4.0-linux-x86_64/bin/../node/bin/node /usr/local/src/kibana-7.4.0-linux-x86_64/bin/../src/cli -p 5601 -H 172.17.0.4
kibana    3106  0.0  0.0  54308  1868 pts/1    R+   18:58   0:00 ps uax
```


```
$lsof -i:5601
COMMAND  PID   USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
node    3087 kibana   18u  IPv4 27390766      0t0  TCP doc-centos-7-6-18-10-elasticsearch-kibana-java-dbeaver:esmagent (LISTEN)
```


dbeaverなどでelasticsearchのデータをいじる

```
$dbeaver 1>$HOME/launch-dbeaver.log  2>&1 &
```

