```

$ cd $HOME/script-sketch/React

$ mkdir -p 00010-React-ウェブパッキングからのデプロイ

$ cd 00010-React-ウェブパッキングからのデプロイ/

$ npx create-react-app my-app --use-npm --template typescript

$ cd my-app/

資産梱包
$ npm run build

成果物

$ tree build/
build/
├── asset-manifest.json
├── favicon.ico
├── index.html
├── logo192.png
├── logo512.png
├── manifest.json
├── precache-manifest.1882e5de63eee6d93916eebc349cbbc9.js
├── robots.txt
├── service-worker.js
└── static
    ├── css
    │   ├── main.5f361e03.chunk.css
    │   └── main.5f361e03.chunk.css.map
    ├── js
    │   ├── 2.763b34e5.chunk.js
    │   ├── 2.763b34e5.chunk.js.LICENSE.txt
    │   ├── 2.763b34e5.chunk.js.map
    │   ├── main.a09e0342.chunk.js
    │   ├── main.a09e0342.chunk.js.map
    │   ├── runtime-main.83c3e0c4.js
    │   └── runtime-main.83c3e0c4.js.map
    └── media
        └── logo.5d5d9eef.svg

4 directories, 19 files

固める

$ tar -zcvf app-with-dependencies.tar.gz build/
build/
build/robots.txt
build/static/
build/static/css/
build/static/css/main.5f361e03.chunk.css
build/static/css/main.5f361e03.chunk.css.map
build/static/js/
build/static/js/main.a09e0342.chunk.js
build/static/js/2.763b34e5.chunk.js.map
build/static/js/runtime-main.83c3e0c4.js
build/static/js/2.763b34e5.chunk.js.LICENSE.txt
build/static/js/runtime-main.83c3e0c4.js.map
build/static/js/2.763b34e5.chunk.js
build/static/js/main.a09e0342.chunk.js.map
build/static/media/
build/static/media/logo.5d5d9eef.svg
build/index.html
build/logo192.png
build/service-worker.js
build/logo512.png
build/precache-manifest.1882e5de63eee6d93916eebc349cbbc9.js
build/manifest.json
build/favicon.ico
build/asset-manifest.json

$ tar -jcvf app-with-dependencies.tar.bz2 build/
build/
build/robots.txt
build/static/
build/static/css/
build/static/css/main.5f361e03.chunk.css
build/static/css/main.5f361e03.chunk.css.map
build/static/js/
build/static/js/main.a09e0342.chunk.js
build/static/js/2.763b34e5.chunk.js.map
build/static/js/runtime-main.83c3e0c4.js
build/static/js/2.763b34e5.chunk.js.LICENSE.txt
build/static/js/runtime-main.83c3e0c4.js.map
build/static/js/2.763b34e5.chunk.js
build/static/js/main.a09e0342.chunk.js.map
build/static/media/
build/static/media/logo.5d5d9eef.svg
build/index.html
build/logo192.png
build/service-worker.js
build/logo512.png
build/precache-manifest.1882e5de63eee6d93916eebc349cbbc9.js
build/manifest.json
build/favicon.ico
build/asset-manifest.json


$ tar -Jcvf app-with-dependencies.tar.xz build/
build/
build/robots.txt
build/static/
build/static/css/
build/static/css/main.5f361e03.chunk.css
build/static/css/main.5f361e03.chunk.css.map
build/static/js/
build/static/js/main.a09e0342.chunk.js
build/static/js/2.763b34e5.chunk.js.map
build/static/js/runtime-main.83c3e0c4.js
build/static/js/2.763b34e5.chunk.js.LICENSE.txt
build/static/js/runtime-main.83c3e0c4.js.map
build/static/js/2.763b34e5.chunk.js
build/static/js/main.a09e0342.chunk.js.map
build/static/media/
build/static/media/logo.5d5d9eef.svg
build/index.html
build/logo192.png
build/service-worker.js
build/logo512.png
build/precache-manifest.1882e5de63eee6d93916eebc349cbbc9.js
build/manifest.json
build/favicon.ico
build/asset-manifest.json

$ tar -cvf app-with-dependencies.tar build/
build/
build/robots.txt
build/static/
build/static/css/
build/static/css/main.5f361e03.chunk.css
build/static/css/main.5f361e03.chunk.css.map
build/static/js/
build/static/js/main.a09e0342.chunk.js
build/static/js/2.763b34e5.chunk.js.map
build/static/js/runtime-main.83c3e0c4.js
build/static/js/2.763b34e5.chunk.js.LICENSE.txt
build/static/js/runtime-main.83c3e0c4.js.map
build/static/js/2.763b34e5.chunk.js
build/static/js/main.a09e0342.chunk.js.map
build/static/media/
build/static/media/logo.5d5d9eef.svg
build/index.html
build/logo192.png
build/service-worker.js
build/logo512.png
build/precache-manifest.1882e5de63eee6d93916eebc349cbbc9.js
build/manifest.json
build/favicon.ico
build/asset-manifest.json

$ zip -r app-with-dependencies.zip build/
  adding: build/ (stored 0%)
  adding: build/robots.txt (deflated 10%)
  adding: build/static/ (stored 0%)
  adding: build/static/css/ (stored 0%)
  adding: build/static/css/main.5f361e03.chunk.css (deflated 44%)
  adding: build/static/css/main.5f361e03.chunk.css.map (deflated 47%)
  adding: build/static/js/ (stored 0%)
  adding: build/static/js/main.a09e0342.chunk.js (deflated 48%)
  adding: build/static/js/2.763b34e5.chunk.js.map (deflated 70%)
  adding: build/static/js/runtime-main.83c3e0c4.js (deflated 52%)
  adding: build/static/js/2.763b34e5.chunk.js.LICENSE.txt (deflated 71%)
  adding: build/static/js/runtime-main.83c3e0c4.js.map (deflated 65%)
  adding: build/static/js/2.763b34e5.chunk.js (deflated 69%)
  adding: build/static/js/main.a09e0342.chunk.js.map (deflated 62%)
  adding: build/static/media/ (stored 0%)
  adding: build/static/media/logo.5d5d9eef.svg (deflated 52%)
  adding: build/index.html (deflated 52%)
  adding: build/logo192.png (deflated 1%)
  adding: build/service-worker.js (deflated 44%)
  adding: build/logo512.png (deflated 0%)
  adding: build/precache-manifest.1882e5de63eee6d93916eebc349cbbc9.js (deflated 57%)
  adding: build/manifest.json (deflated 53%)
  adding: build/favicon.ico (deflated 6%)
  adding: build/asset-manifest.json (deflated 72%)


$ ll app-with-dependencies*
-rw-r--r-- 1 aine aine 500K  8月 23 23:40 app-with-dependencies.tar
-rw-r--r-- 1 aine aine 146K  8月 23 23:39 app-with-dependencies.tar.bz2
-rw-r--r-- 1 aine aine 163K  8月 23 23:38 app-with-dependencies.tar.gz
-rw-r--r-- 1 aine aine 135K  8月 23 23:40 app-with-dependencies.tar.xz
-rw-r--r-- 1 aine aine 167K  8月 23 23:41 app-with-dependencies.zip


$ sudo cp app-with-dependencies.zip /var/www/html/

$ cd /var/www/html

$ sudo unzip app-with-dependencies.zip 
Archive:  app-with-dependencies.zip
   creating: build/
  inflating: build/robots.txt        
   creating: build/static/
   creating: build/static/css/
  inflating: build/static/css/main.5f361e03.chunk.css  
  inflating: build/static/css/main.5f361e03.chunk.css.map  
   creating: build/static/js/
  inflating: build/static/js/main.a09e0342.chunk.js  
  inflating: build/static/js/2.763b34e5.chunk.js.map  
  inflating: build/static/js/runtime-main.83c3e0c4.js  
  inflating: build/static/js/2.763b34e5.chunk.js.LICENSE.txt  
  inflating: build/static/js/runtime-main.83c3e0c4.js.map  
  inflating: build/static/js/2.763b34e5.chunk.js  
  inflating: build/static/js/main.a09e0342.chunk.js.map  
   creating: build/static/media/
  inflating: build/static/media/logo.5d5d9eef.svg  
  inflating: build/index.html        
  inflating: build/logo192.png       
  inflating: build/service-worker.js  
  inflating: build/logo512.png       
  inflating: build/precache-manifest.1882e5de63eee6d93916eebc349cbbc9.js  
  inflating: build/manifest.json     
  inflating: build/favicon.ico       
  inflating: build/asset-manifest.json  

$ sudo mv build/* .

$ sudo rm -rf build/ app-with-dependencies.zip

$ tree /var/www/html
/var/www/html
├── asset-manifest.json
├── favicon.ico
├── index.html
├── logo192.png
├── logo512.png
├── manifest.json
├── precache-manifest.1882e5de63eee6d93916eebc349cbbc9.js
├── robots.txt
├── service-worker.js
└── static
    ├── css
    │   ├── main.5f361e03.chunk.css
    │   └── main.5f361e03.chunk.css.map
    ├── js
    │   ├── 2.763b34e5.chunk.js
    │   ├── 2.763b34e5.chunk.js.LICENSE.txt
    │   ├── 2.763b34e5.chunk.js.map
    │   ├── main.a09e0342.chunk.js
    │   ├── main.a09e0342.chunk.js.map
    │   ├── runtime-main.83c3e0c4.js
    │   └── runtime-main.83c3e0c4.js.map
    └── media
        └── logo.5d5d9eef.svg

4 directories, 19 files

$ sudo apache2ctl stop

$ sudo apache2ctl start

$ sudo lsof -i:80 -P
COMMAND    PID     USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
apache2 121940     root    3u  IPv4 1650833      0t0  TCP *:80 (LISTEN)
apache2 121941 www-data    3u  IPv4 1650833      0t0  TCP *:80 (LISTEN)
apache2 121942 www-data    3u  IPv4 1650833      0t0  TCP *:80 (LISTEN)



アイコン出ればおｋ
$ firefox http://localhost:80/


```
