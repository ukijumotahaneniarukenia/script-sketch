```
$ make create PROJECT_NAME=ファンクション単位でライブラリ化 APP_DIR_NAME=app

$ make run PROJECT_DIR_NAME=00066-nodejs-ファンクション単位でライブラリ化 APP_DIR_NAME=app
node 00066-nodejs-ファンクション単位でライブラリ化/app/src/index.js
file:///home/aine/script-sketch/nodejs/00066-nodejs-%E3%83%95%E3%82%A1%E3%83%B3%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3%E5%8D%98%E4%BD%8D%E3%81%A7%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA%E5%8C%96/app/src/index.js:5
let myCanvas = create("myCanvas", document.body, 480, 320);
                                  ^

ReferenceError: document is not defined
    at file:///home/aine/script-sketch/nodejs/00066-nodejs-%E3%83%95%E3%82%A1%E3%83%B3%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3%E5%8D%98%E4%BD%8D%E3%81%A7%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA%E5%8C%96/app/src/index.js:5:35
    at ModuleJob.run (internal/modules/esm/module_job.js:152:23)
    at async Loader.import (internal/modules/esm/loader.js:166:24)
    at async Object.loadESM (internal/process/esm_loader.js:68:5)
make: *** [Makefile:81: run] エラー 1

$ make build PROJECT_DIR_NAME=00066-nodejs-ファンクション単位でライブラリ化 APP_DIR_NAME=app

index.htmlを右クリックでLIVE SERVERでWEBサーブ

実配備はWEBサーバ立ててワンファイルdist/main.jsを資産配備
```
