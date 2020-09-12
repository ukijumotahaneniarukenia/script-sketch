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
