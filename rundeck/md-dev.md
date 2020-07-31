- ENV

```

```

- PRE

```
cd /usr/local/src

apt install -y openjdk-11-jdk-headless

apt install -y curl

apt install -y lsof

apt install -y firefox

cp /home/aine/Downloads/rundeck_3.3.1.20200727-1_all.deb vir-ubuntu-20-04/usr/local/src/

apt install -y libedit2 libfido2-1 libcbor0.6 xauth libxmuu1 openssh-client uuid-runtime

dpkg -i rundeck_3.3.1.20200727-1_all.deb

```

- LAUNCH

```
root@aine-MS-7B98:~# systemctl status rundeckd.service
● rundeckd.service - LSB: rundeck job automation console
     Loaded: loaded (/etc/init.d/rundeckd; generated)
     Active: inactive (dead)
       Docs: man:systemd-sysv-generator(8)

 8月 01 01:39:42 aine-MS-7B98 systemd[1]: /run/systemd/generator.late/rundeckd.service:17: PIDFile= references a path below legacy directory /var/run/, updating /var/run/rundeckd.pid → /run>
 8月 01 01:39:42 aine-MS-7B98 systemd[1]: /run/systemd/generator.late/rundeckd.service:17: PIDFile= references a path below legacy directory /var/run/, updating /var/run/rundeckd.pid → /run>
 8月 01 01:39:42 aine-MS-7B98 systemd[1]: /run/systemd/generator.late/rundeckd.service:17: PIDFile= references a path below legacy directory /var/run/, updating /var/run/rundeckd.pid → /run>
 8月 01 01:42:18 aine-MS-7B98 systemd[1]: /run/systemd/generator.late/rundeckd.service:17: PIDFile= references a path below legacy directory /var/run/, updating /var/run/rundeckd.pid → /run>

root@aine-MS-7B98:~# systemctl start rundeckd.service

root@aine-MS-7B98:~# systemctl status rundeckd.service
● rundeckd.service - LSB: rundeck job automation console
     Loaded: loaded (/etc/init.d/rundeckd; generated)
     Active: active (running) since Sat 2020-08-01 01:42:47 JST; 15s ago
       Docs: man:systemd-sysv-generator(8)
    Process: 579 ExecStart=/etc/init.d/rundeckd start (code=exited, status=0/SUCCESS)
   Main PID: 588 (java)
     CGroup: /system.slice/rundeckd.service
             └─588 java -Drundeck.jaaslogin=true -Djava.security.auth.login.config=/etc/rundeck/jaas-loginmodule.conf -Dloginmodule.name=RDpropertyfilelogin -Drdeck.config=/etc/rundeck -Dru>

 8月 01 01:42:47 aine-MS-7B98 systemd[1]: Starting LSB: rundeck job automation console...
 8月 01 01:42:47 aine-MS-7B98 rundeckd[579]:  * Starting rundeckd
 8月 01 01:42:47 aine-MS-7B98 rundeckd[579]:    ...done.
 8月 01 01:42:47 aine-MS-7B98 systemd[1]: Started LSB: rundeck job automation console.


root@aine-MS-7B98:~# ps uaxwwf
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.2  0.0  22508 11972 ?        Ss   01:37   0:00 /usr/lib/systemd/systemd
root          17  0.0  0.0  35168 11492 ?        S<s  01:37   0:00 /lib/systemd/systemd-journald
systemd+      52  0.0  0.0  24112 12968 ?        Ss   01:37   0:00 /lib/systemd/systemd-resolved
root          54  0.0  0.0   4980  2892 ?        Ss   01:37   0:00 /usr/sbin/cron -f
message+      55  0.0  0.0   7376  4060 ?        Ss   01:37   0:00 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root          57  0.0  0.0  27128 18388 ?        Ss   01:37   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
syslog        58  0.0  0.0 224476  4424 ?        Ssl  01:37   0:00 /usr/sbin/rsyslogd -n -iNONE
root          59  0.0  0.0  16952  7732 ?        Ss   01:37   0:00 /lib/systemd/systemd-logind
root          64  0.0  0.0   7352  4624 pts/0    Ss   01:37   0:00 /bin/login -p --
root          92  0.0  0.0   5404  4008 pts/0    S    01:37   0:00  \_ -bash
root         666  0.0  0.0   7044  3224 pts/0    R+   01:43   0:00      \_ ps uaxwwf
root          85  0.0  0.0  18292  9476 ?        Ss   01:37   0:00 /lib/systemd/systemd --user
root          86  0.0  0.0  22356  2584 ?        S    01:37   0:00  \_ (sd-pam)
uuidd        297  0.0  0.0   6148  1088 ?        Ss   01:39   0:00 /usr/sbin/uuidd --socket-activation
rundeck      588  188  2.1 6069180 710236 ?      Sl   01:42   1:36 java -Drundeck.jaaslogin=true -Djava.security.auth.login.config=/etc/rundeck/jaas-loginmodule.conf -Dloginmodule.name=RDpropertyfilelogin -Drdeck.config=/etc/rundeck -Drundeck.server.configDir=/etc/rundeck -Dserver.datastore.path=/var/lib/rundeck/data/rundeck -Drundeck.server.serverDir=/var/lib/rundeck -Drdeck.projects=/var/lib/rundeck/projects -Dlog4j.configurationFile=/etc/rundeck/log4j2.properties -Dlogging.config=file:/etc/rundeck/log4j2.properties -Drdeck.runlogs=/var/lib/rundeck/logs -Drundeck.server.logDir=/var/lib/rundeck/logs -Drundeck.config.location=/etc/rundeck/rundeck-config.properties -Djava.io.tmpdir=/tmp/rundeck -Drundeck.server.workDir=/tmp/rundeck -Dserver.http.port=4440 -Drdeck.base=/var/lib/rundeck -Xmx1024m -Xms256m -XX:MaxMetaspaceSize=256m -server -jar /var/lib/rundeck/bootstrap/rundeck-3.3.1-20200727.war --skipinstall


root@aine-MS-7B98:~# lsof -i:4440 -P
COMMAND PID    USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
java    588 rundeck   75u  IPv6 166919      0t0  TCP *:4440 (LISTEN)

```


- CONFIRM

コンテナホストのブラウザから以下のアドレスを入力し、Enter

- http://localhost:4440

デフォルトユーザ名:admin
デフォルトパスワード:admin

ハローワールド

```

```


使いやすい
