dockerコンテナでsnapコマンドを使用する

- https://snapcraft.io/blog/canonical%e3%81%8cflutter%e3%81%ablinux%e3%83%87%e3%82%b9%e3%82%af%e3%83%88%e3%83%83%e3%83%97%e3%82%a2%e3%83%97%e3%83%aa%e3%81%ae%e3%82%b5%e3%83%9d%e3%83%bc%e3%83%88%e3%82%92%e6%8f%90%e4%be%9b

dockerホストとdockerコンテナでOSのバージョンが異なる場合

vscodeが２つdockerホストで入っていたことから、dockerコンテナ内での操作はdockerホスト内に影響を及ぼしていた。


ただ、snap管理だけのコンテナと位置づけ、snap経由の操作だけすれば、元に戻せるので、お試しなら使い勝手はよさげ。

-v /run/snapd.socket:/run/snapd.socketを共有して起動

```
$ docker run --privileged --pid=host --shm-size=2gb --hostname=doc-ubuntu-19-10-vim -v /home/aine/script-env/ubuntu-19-10-vim/mnt:/home/aine/mnt -v /home/aine/Downloads-for-docker-container/ubuntu-19-10-vim:/home/aine/media -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /etc/localtime:/etc/localtime -v /run/udev:/run/udev -v /run/systemd:/run/systemd -v /tmp/.X11-unix:/tmp/.X11-unix -v /var/lib/dbus:/var/lib/dbus -v /var/run/dbus:/var/run/dbus -v /etc/machine-id:/etc/machine-id -v /run/snapd.socket:/run/snapd.socket --name ubuntu-19-10-vim -itd ubuntu-19-10-vim


$ docker exec -it ubuntu-19-10-vim /bin/bash

$ sudo apt update

$ sudo apt install -y snapd

削除前
$ snap list
Name               Version                     Rev   Tracking         Publisher      Notes
code               17299e41                    38    latest/stable    vscode✓        classic
core               16-2.45.2                   9665  latest/stable    canonical✓     core
core18             20200707                    1880  latest/stable    canonical✓     base
flutter            0+git.aca15f8               21    latest/stable    flutter-team✓  classic
gnome-3-28-1804    3.28.0-17-gde3d74c.de3d74c  128   latest/stable    canonical✓     -
gnome-3-34-1804    0+git.3009fc7               36    latest/stable/…  canonical✓     -
gtk-common-themes  0.1-36-gc75f853             1506  latest/stable/…  canonical✓     -
hello-world        6.4                         29    latest/stable    canonical✓     -
snap-store         3.36.0-80-g208fd61          467   latest/stable/…  canonical✓     -
snapd              2.45.2                      8542  latest/stable    canonical✓     snapd


$ sudo snap remove code
$ sudo snap remove hello-world
$ sudo snap remove flutter

削除後
$ snap list
Name               Version                     Rev   Tracking         Publisher   Notes
core               16-2.45.2                   9665  latest/stable    canonical✓  core
core18             20200707                    1880  latest/stable    canonical✓  base
gnome-3-28-1804    3.28.0-17-gde3d74c.de3d74c  128   latest/stable    canonical✓  -
gnome-3-34-1804    0+git.3009fc7               36    latest/stable/…  canonical✓  -
gtk-common-themes  0.1-36-gc75f853             1506  latest/stable/…  canonical✓  -
snap-store         3.36.0-80-g208fd61          467   latest/stable/…  canonical✓  -
snapd              2.45.2                      8542  latest/stable    canonical✓  snapd


dockerホスト側から見えるvscodeが１つになった。


インストール
$ sudo snap install --classic flutter
$ sudo snap install --classic code
$ sudo snap install --classic hello-world

インストールの操作で以下のエラーをよく見るようになった。
Warning: /snap/bin was not found in your $PATH. If you've not restarted your session since you
         installed snapd, try doing that. Please see https://forum.snapcraft.io/t/9469 for more
         details.

問題にもなっていた
- https://dev.getsol.us/T7745

- https://forum.snapcraft.io/t/how-to-fix-snap-binaries-not-found/9469


dockerコンテナでホストのプロセス借用したような環境で実施しているので、systemcltうごかないし、一旦やめ。

実際パスも自動で設定されていなかった

$ echo $PATH|tr ':' '\n'|sort
/bin
/home/kuraine/.cargo/bin
/home/kuraine/.local/bin
/home/kuraine/.local/go-repo/bin
/home/kuraine/.local/script-cmd/bin
/home/kuraine/.sdkman/candidates/gradle/6.1/bin
/sbin
/usr/bin
/usr/local/bin
/usr/local/bin
/usr/local/sbin
/usr/local/src/android-studio/bin
/usr/local/src/apache-maven-3.6.3/bin
/usr/local/src/chrome-linux
/usr/local/src/chromedriver_linux64
/usr/local/src/flutter/bin
/usr/local/src/go/bin
/usr/local/src/graalvm-ce-java11-20.1.0/bin
/usr/local/src/gradle-6.1/bin
/usr/local/src/jdk-11/bin
/usr/local/src/jdk-11/bin
/usr/local/src/liteide/bin
/usr/local/src/osxcross/target/bin
/usr/local/src/solr-8.5.1/bin
/usr/local/src/spark-3-0-0-preview2-bin-hadoop3-2/bin
/usr/local/src/spark-3-0-0-preview2-bin-hadoop3-2/sbin
/usr/local/src/swift-5.2.4-RELEASE-ubuntu20.04/usr/bin
/usr/sbin
/usr/share/elasticsearch/bin

バージョン

dockerホストのバージョンを見てしまっている

$ snap version
snap    2.45.1+19.10.2
snapd   2.45.2
series  16
ubuntu  20.04
kernel  5.4.0-42-generic

$ cat /etc/os-release
NAME="Ubuntu"
VERSION="19.10 (Eoan Ermine)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 19.10"
VERSION_ID="19.10"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=eoan
UBUNTU_CODENAME=eoan

$ uname -a
Linux doc-ubuntu-19-10-vim 5.4.0-42-generic #46-Ubuntu SMP Fri Jul 10 00:24:02 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux


こちらはdockerホスト側

$ snap version
snap    2.45.2
snapd   2.45.2
series  16
ubuntu  20.04
kernel  5.4.0-42-generic

$ cat /etc/os-release
NAME="Ubuntu"
VERSION="20.04 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal

$ uname -a
Linux aine-MS-7B98 5.4.0-42-generic #46-Ubuntu SMP Fri Jul 10 00:24:02 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

```

