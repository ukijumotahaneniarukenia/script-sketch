スナップショットの作成と復元

- http://www.tohoho-web.com/docker/docker_export.html

- https://uxmilk.jp/55512


# save

イメージを配布するだけならつかえそう

イメージIDを指定して圧縮する
```

$ docker images
REPOSITORY                           TAG                    IMAGE ID            CREATED             SIZE
ubuntu-19-10-vim                     latest                 5cc30adb9965        15 hours ago        3.85GB
ubuntu-16-04-vim                     latest                 08aa414b4372        15 hours ago        3.73GB
ubuntu-18-04-vim                     latest                 f16bd78bd001        15 hours ago        3.21GB
centos-7-6-18-10-vim                 latest                 ac49f672b6b9        16 hours ago        4.71GB
ubuntu-18-04-aws_workspaces-vscode   latest                 cb4b020ae79e        5 days ago          3.61GB
ubuntu                               19.10                  dcbcfdcd50bb        4 months ago        72.9MB
ubuntu                               18.04                  ccc6e87d482b        4 months ago        64.2MB
ubuntu                               16.04                  c6a43cd4801e        5 months ago        123MB
mcr.microsoft.com/mssql/server       2019-GA-ubuntu-16.04   76c7c66bff02        7 months ago        1.57GB
ibmcom/db2                           latest                 66a976f94954        10 months ago       2.96GB
centos                               7.6.1810               f1cb7c7d58b7        14 months ago       202MB



$ time docker save cb4b020ae79e | gzip -c > $HOME/ubuntu-18-04-aws_workspaces-vscode-image.tar.gz

real	2m26.172s
user	1m56.116s
sys	0m3.621s


OSイメージだと思っていれば、このくらいならハンディでは。


Xアプリ転送許可さえしとけば、ローカルレポ作ってハンディに使えそう。


$ ls -lh $HOME/ubuntu-18-04-aws_workspaces-vscode-image.tar.gz
-rw-rw-r--. 1 aine aine 1.5G  5月 31 19:20 /home/aine/ubuntu-18-04-aws_workspaces-vscode-image.tar.gz

```


# export

稼働中のコンテナIDを指定してその時点でのファイルシステムをまるごとコピー


コンテナ内で起動していたGUI等もそのままでうまく圧縮ファイルに吐き出すことができた

ランタイム環境をイメージファイルをしてスナッピングするのに便利そう

```

$ docker ps -a
CONTAINER ID        IMAGE                                COMMAND                  CREATED             STATUS              PORTS               NAMES
24f2ed0cd73d        ubuntu-18-04-aws_workspaces-vscode   "/etc/init/run.sh ub…"   2 days ago          Up 5 hours                              ubuntu-18-04-aws_workspaces-vscode



$ time docker export 24f2ed0cd73d | gzip -c > $HOME/ubuntu-18-04-aws_workspaces-vscode.tar.gz

real	9m59.963s
user	9m27.178s
sys	0m21.987s



$ ls -lh $HOME/ubuntu-18-04-aws_workspaces-vscode.tar.gz
-rw-rw-r--. 1 aine aine 9.5G  5月 31 19:22 /home/aine/ubuntu-18-04-aws_workspaces-vscode.tar.gz


```


# import

export --> import

ビッグビッグイメージができた

開始時刻でスナッピングできた

```

$ time cat /home/aine/ubuntu-18-04-aws_workspaces-vscode.tar.gz | gzip -d | docker import - ubuntu-18-04-aws_workspaces-vscode:snap-$(date "+%Y-%m-%dT%H-%M-%S")
sha256:76488cafcbaa857eb9e5c1b670d22407b75ecf8eb4bca15116aec80cf65fd2e4

real	3m24.975s
user	1m51.299s
sys	0m19.099s


$ docker images
REPOSITORY                           TAG                        IMAGE ID            CREATED             SIZE
ubuntu-18-04-aws_workspaces-vscode   snap-2020-05-31T19-44-56   76488cafcbaa        18 seconds ago      19.7GB
ubuntu-19-10-vim                     latest                     5cc30adb9965        16 hours ago        3.85GB
ubuntu-16-04-vim                     latest                     08aa414b4372        16 hours ago        3.73GB
ubuntu-18-04-vim                     latest                     f16bd78bd001        16 hours ago        3.21GB
centos-7-6-18-10-vim                 latest                     ac49f672b6b9        16 hours ago        4.71GB
ubuntu-18-04-aws_workspaces-vscode   latest                     cb4b020ae79e        5 days ago          3.61GB
ubuntu                               19.10                      dcbcfdcd50bb        4 months ago        72.9MB
ubuntu                               18.04                      ccc6e87d482b        4 months ago        64.2MB
ubuntu                               16.04                      c6a43cd4801e        5 months ago        123MB
mcr.microsoft.com/mssql/server       2019-GA-ubuntu-16.04       76c7c66bff02        7 months ago        1.57GB
ibmcom/db2                           latest                     66a976f94954        10 months ago       2.96GB
centos                               7.6.1810                   f1cb7c7d58b7        14 months ago       202MB

```



# リストア


```

$ docker run -itd ubuntu-18-04-aws_workspaces-vscode:snap-2020-05-31T19-44-56 /bin/bash
be54943449d6d57619777f030331ca7ece73c8cfd5d31742c2f194fdc937a183


ベースにしたコンテナのスナップのうち最新ないしは最新からN件前みたいな選択ができる。便利？？


$ docker ps -a
CONTAINER ID        IMAGE                                                         COMMAND                  CREATED             STATUS              PORTS               NAMES
be54943449d6        ubuntu-18-04-aws_workspaces-vscode:snap-2020-05-31T19-44-56   "/bin/bash"              4 seconds ago       Up 3 seconds                            mystifying_babbage
24f2ed0cd73d        ubuntu-18-04-aws_workspaces-vscode                            "/etc/init/run.sh ub…"   2 days ago          Up 6 hours                              ubuntu-18-04-aws_worksp


コンテナ作成


systemdうんたらかんたらあって**--privileged**つけてたけど、dbus死んでるからどのみちいらないオプションになった

$ docker run --user kuraine --workdir=/home/kuraine --hostname=ubuntu-18-04-aws_workspaces-vscode:snap-2020-05-31T19-44-56 --name=ubuntu-18-04-aws_workspaces-vscode-snap-2020-05-31T19-44-56 --env DISPLAY=:0.0 --shm-size=2gb -v /tmp/.X11-unix:/tmp/.X11-unix -itd ubuntu-18-04-aws_workspaces-vscode:snap-2020-05-31T19-44-56 /bin/bash


$ docker ps -a
CONTAINER ID        IMAGE                                                         COMMAND                  CREATED             STATUS              PORTS               NAMES
9368f461ec05        ubuntu-18-04-aws_workspaces-vscode:snap-2020-05-31T19-44-56   "/bin/bash"              3 minutes ago       Up 3 minutes                            ubuntu-18-04-aws_workspaces-vscode-snap-2020-05-31T19-44-56
24f2ed0cd73d        ubuntu-18-04-aws_workspaces-vscode                            "/etc/init/run.sh ub…"   2 days ago          Up 7 hours                              ubuntu-18-04-aws_workspaces-vscode


X転送もできた。便利。



イメージの削除

$ docker rmi ubuntu-18-04-aws_workspaces-vscode:snap-2020-05-31T19-44-56

```
