ビルド
```
time docker build -t ubuntu-18-04-xrdp-original .
```


フォアグランド起動
```
docker run --rm -it --shm-size=4gb -p 3389:3389 -u $(id -u):$(id -g) -e USER=aine -e PASSWD=aine_pwd -v $HOME/script-sketch/xrdp/original/container:/home/aine ubuntu-18-04-xrdp-original
```
バックグランド起動

```
docker run --rm -itd --name ubuntu-18-04-xrdp-original --shm-size=4gb -p 3389:3389 -u $(id -u):$(id -g) -e USER=aine -e PASSWD=aine_pwd -v $HOME/script-sketch/xrdp/original/container:/home/aine ubuntu-18-04-xrdp-original
```

```
docker exec -it ubuntu-18-04-xrdp-original /bin/bash
```
