
環境

```

$ cat /etc/os-release
NAME="Ubuntu"
VERSION="18.04.4 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.4 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic


$ uname -r
3.10.0-1062.el7.x86_64


```


herokuのコマンドラインツールインストール

```


$ curl https://cli-assets.heroku.com/install.sh | sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1892  100  1892    0     0   4814      0 --:--:-- --:--:-- --:--:--  4814
Installing CLI from https://cli-assets.heroku.com/heroku-linux-x64.tar.xz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 18.2M  100 18.2M    0     0   257k      0  0:01:12  0:01:12 --:--:--  457k
v12.16.2
heroku installed to /usr/local/bin/heroku
heroku/7.41.1 linux-x64 node-v12.16.2



$ which heroku
/usr/local/bin/heroku

$ heroku --version
heroku/7.41.1 linux-x64 node-v12.16.2


```
