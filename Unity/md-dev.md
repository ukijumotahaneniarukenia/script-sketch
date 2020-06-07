- https://ugcj.com/linux%E3%81%ABunity-editor%E3%82%92%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95/

- https://www.virment.com/how-to-setup-unity-ubuntu/


Unityをdocker内で起動する際は--gpus allなどをdocker run時に指定する（）

```
docker run --privileged --gpus デバイス名 --shm-size=16gb --hostname=doc-ubuntu-18-04-vim -v /home/aine/script-env/ubuntu-18-04-vim/mnt:/home/aine/mnt -v /home/aine/Downloads-for-docker-container/ubuntu-18-04-vim:/home/aine/media -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /etc/localtime:/etc/localtime -v /run/udev:/run/udev -v /run/systemd:/run/systemd -v /tmp/.X11-unix:/tmp/.X11-unix -v /var/lib/dbus:/var/lib/dbus -v /var/run/dbus:/var/run/dbus -v /etc/machine-id:/etc/machine-id  --name ubuntu-18-04-vim -itd ubuntu-18-04-vim
```

単一gpuをそういえば自作マシンに組み込んでなかったので、財布と相談しながら、Unity挑戦

- https://qiita.com/sabaku20XX/items/97db2c0bf7298e3a645c

```
mv /home/aine/media/UnityHub.AppImage /usr/local/src
cd /usr/local/src
chown -R root:root UnityHub.AppImage
chmod +x UnityHub.AppImage



apt install -y fuse
modprobe fuse
groupadd fuse
export user=kuraine #kuraineは実行ユーザー
usermod -a -G fuse $user
```

起動

```
/usr/local/src/UnityHub.AppImage 1>$HOME/launch-UnityHub.log 2>&1 &
```

ホームディレクトリ配下にUnityフォルダができている

```
$ ls
IdeaProjects  Unity  asyncomplete.log  dotfile  launch-UnityHub.log  launch-android-studio.log  launch-fcitx.log  launch-idea.log  stale_outputs_checked  vim-lsp.log
```
