スクラッチ

```
$ mkdir -p wrksp

$ cd wrksp/

$ mkdir -p app

$ echo '/node_modules/*' | xargs -n1 > .gitignore

$ npm init -y
Wrote to /home/aine/script-sketch/electron/wrksp/app/package.json:

{
  "name": "app",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}

$ npm install electron --save-dev

$ ls -lh node_modules/.bin/electron
lrwxrwxrwx 1 aine aine 18  9月 12 14:10 node_modules/.bin/electron -> ../electron/cli.js


$ cat <<EOS >index.html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>ElectronApp</title>
  </head>
  <body>
    <p>Hello World</p>
  </body>
</html>
EOS

$ cd ~/script-sketch/electron/wrksp
$ ./app/node_modules/.bin/electron app/
Gtk-Message: 14:17:21.740: Failed to load module "canberra-gtk-module"
Gtk-Message: 14:17:21.740: Failed to load module "canberra-gtk-module"
```


パッケージング

```
$ npm install electron-packager --save-dev
```

Mac向けのビルド

```
$ cd ~/script-sketch/electron/wrksp

$ npx electron-packager app App --platform=darwin --arch=x64 --overwrite
Packaging app for platform darwin x64 using electron v10.1.1
Wrote new app to /home/aine/script-sketch/electron/wrksp/App-darwin-x64

$ ls -lh /home/aine/script-sketch/electron/wrksp/App-darwin-x64
total 4.3M
drwxr-xr-x 3 aine aine 4.0K  9月 12 14:29 App.app
-rw-r--r-- 1 aine aine 1.1K  9月 12 14:29 LICENSE
-rw-r--r-- 1 aine aine 4.3M  9月 12 14:29 LICENSES.chromium.html
-rw-r--r-- 1 aine aine    6  9月 12 14:29 version

フォルダ配下を圧縮

$ zip -r App-darwin-x64.zip App-darwin-x64

$ tar -zcvf App-darwin-x64.tar.gz App-darwin-x64

$ tar -jcvf App-darwin-x64.tar.bz2 App-darwin-x64

$ tar -Jcvf App-darwin-x64.tar.xz App-darwin-x64

$ tar -cvf App-darwin-x64.tar App-darwin-x64

$ ls -lh | awk '$9 ~ /\./ && $9 !~ /.md$/ {print $0}' | grep darwin
-rw-r--r-- 1 aine aine 173M  9月 12 14:58 App-darwin-x64.tar
-rw-r--r-- 1 aine aine  66M  9月 12 14:57 App-darwin-x64.tar.bz2
-rw-r--r-- 1 aine aine  73M  9月 12 14:57 App-darwin-x64.tar.gz
-rw-r--r-- 1 aine aine  53M  9月 12 14:58 App-darwin-x64.tar.xz
-rw-r--r-- 1 aine aine 217M  9月 12 14:56 App-darwin-x64.zip
```


linux向けのビルド

```
$ npx electron-packager app App --platform=linux --arch=x64 --overwrite
Packaging app for platform linux x64 using electron v10.1.1
Wrote new app to /home/aine/script-sketch/electron/wrksp/App-linux-x64


$ bash packaging.sh wrksp App-linux-x64


$ ls -lh | awk '$9 ~ /\./ && $9 !~ /.md$/ {print $0}' | grep linux
-rw-r--r-- 1 aine aine 184M  9月 12 15:34 App-linux-x64.tar
-rw-r--r-- 1 aine aine  65M  9月 12 15:33 App-linux-x64.tar.bz2
-rw-r--r-- 1 aine aine  72M  9月 12 15:33 App-linux-x64.tar.gz
-rw-r--r-- 1 aine aine  53M  9月 12 15:34 App-linux-x64.tar.xz
-rw-r--r-- 1 aine aine  72M  9月 12 15:33 App-linux-x64.zip


ポータブルか

$ cp App-linux-x64.tar.gz $HOME/

$ cd $HOME

$ tar xvf App-linux-x64.tar.gz

$ ls -lh App-linux-x64/App
-rwxr-xr-x 1 aine aine 127M  9月 12 16:02 App-linux-x64/App

$ file App-linux-x64/App
App-linux-x64/App: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=a4cce967843200c3c13f253afeabe941837e59b9, not stripped

$ App-linux-x64/App
Gtk-Message: 16:05:55.684: Failed to load module "canberra-gtk-module"
Gtk-Message: 16:05:55.684: Failed to load module "canberra-gtk-module"

```

Win向けのビルド

wineを事前にインストールしておく必要がある

wineはsystemdが動く環境が必要

```
$ sudo apt install -y winetricks

Failed to connect to bus: No data available
Failed to connect to bus: No data available
Failed to connect to bus: No data available
Failed to connect to bus: No data available
cp: cannot create regular file '/run/systemd/resolve/stub-resolv.conf': Read-only file system
dpkg: error processing package systemd (--configure):
 installed systemd package post-installation script subprocess returned error exit status 1
Errors were encountered while processing:
 systemd
E: Sub-process /usr/bin/dpkg returned an error code (1)

```


```
$ npx electron-packager app App --platform=win32 --arch=x64 --overwrite



```
