- 事象

```
一般ユーザーで実行すると

[apache@doc-centos-7-6-18-10-ci ~]$ Xvfb :99 -screen 0 1024x768x24
(EE)
Fatal server error:
(EE) Could not create server lock file: /tmp/.X99-lock
(EE)

/tmp配下はrootユーザーの持ち物
[apache@doc-centos-7-6-18-10-ci ~]$ ll /tmp
total 20
drwx------. 2 root root 4096 May 23 15:02 Temp-0f2b1a07-a654-4c1f-8e91-7f2f06642fc5
drwx------. 2 root root 4096 May 23 15:02 Temp-40e76c49-3c52-4279-9a29-8951229fe575
-rwx------. 1 root root  836 Dec  4  2018 ks-script-6pKh_p
-rw-------. 1 root root    0 Dec  4  2018 yum.log
```
