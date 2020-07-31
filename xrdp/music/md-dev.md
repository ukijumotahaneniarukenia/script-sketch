うまく行っているときのログ

```
aine@98f424159175:/$ sudo cat /var/log/xrdp.log
[20200731-22:00:07] [INFO ] starting xrdp with pid 41
[20200731-22:00:07] [INFO ] listening to port 3389 on 0.0.0.0


aine@98f424159175:/$ sudo cat /var/log/xrdp-sesman.log
[20200731-22:00:07] [DEBUG] libscp initialized
[20200731-22:00:07] [INFO ] starting xrdp-sesman with pid 39
[20200731-22:00:07] [INFO ] listening to port 3350 on 127.0.0.1
[20200731-22:01:01] [INFO ] A connection received from ::ffff:127.0.0.1 port 55266
[20200731-22:01:02] [INFO ] ++ created session (access granted): username aine, ip ::ffff:172.17.0.1:57118 - socket: 11
[20200731-22:01:02] [INFO ] starting Xorg session...
[20200731-22:01:02] [DEBUG] Closed socket 8 (AF_INET6 :: port 5910)
[20200731-22:01:02] [DEBUG] Closed socket 8 (AF_INET6 :: port 6010)
[20200731-22:01:02] [DEBUG] Closed socket 8 (AF_INET6 :: port 6210)
[20200731-22:01:02] [DEBUG] Closed socket 7 (AF_INET6 ::ffff:127.0.0.1 port 3350)
[20200731-22:01:02] [INFO ] calling auth_start_session from pid 56
[20200731-22:01:02] [DEBUG] Closed socket 6 (AF_INET6 ::ffff:127.0.0.1 port 3350)
[20200731-22:01:02] [DEBUG] Closed socket 7 (AF_INET6 ::ffff:127.0.0.1 port 3350)
[20200731-22:01:02] [INFO ] /usr/lib/xorg/Xorg :10 -auth .Xauthority -config xrdp/xorg.conf -noreset -nolisten tcp -logfile .xorgxrdp.%s.log
[20200731-22:01:02] [CORE ] waiting for window manager (pid 70) to exit
aine@98f424159175:/$ id xrdp
uid=109(xrdp) gid=114(xrdp) groups=114(xrdp)
```
