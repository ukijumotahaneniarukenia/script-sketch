ビルド

```
time docker build --no-cache -t centos-7-6-18-10-ci --build-arg GIT_VERSION=2-24-1 --build-arg APACHE_HTTP_VERSION=X-X-X --build-arg REPO=script-repo --build-arg OS_VERSION=$(echo centos-7-6-18-10-ci | grep -Po '[a-z]{1,}(?:-[0-9]{1,}){1,}') . | tee log
```

ラン

```
docker run --privileged --shm-size=2gb --hostname=doc-centos-7-6-18-10-ci -v /home/aine/script-ci/centos-7-6-18-10-ci/mnt:/home/aine/mnt -v /home/aine/Downloads-for-docker-container/centos-7-6-18-10-ci:/home/aine/media -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /etc/localtime:/etc/localtime -v /run/udev:/run/udev -v /run/systemd:/run/systemd -v /tmp/.X11-unix:/tmp/.X11-unix -v /var/lib/dbus:/var/lib/dbus -v /var/run/dbus:/var/run/dbus -v /etc/machine-id:/etc/machine-id -p 8080:80 --name centos-7-6-18-10-ci -itd centos-7-6-18-10-ci
```

でばっぐ

```
time docker exec --user root -it centos-7-6-18-10-ci /etc/init/run-chrome.sh | tee log-debug-chrome
time docker exec --user root -it centos-7-6-18-10-ci /etc/init/run-firefox.sh | tee log-debug-firefox
```

りむ

```
docker ps -a | grep -P $(pwd | sed 's;.*/;;') | awk '{print $1}' | xargs -I@ bash -c 'docker stop @ && docker rm @'
```
