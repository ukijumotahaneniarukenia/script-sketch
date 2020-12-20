```
$ make clean PROJECT_DIR_NAME=00064-nodejs-ESMODULEシステム整理整頓

$ make create PROJECT_NAME=ESMODULEシステム整理整頓 APP_DIR_NAME=app

$ make run PROJECT_DIR_NAME=00064-nodejs-ESMODULEシステム整理整頓 APP_DIR_NAME=app

$ make build PROJECT_DIR_NAME=00064-nodejs-ESMODULEシステム整理整頓 APP_DIR_NAME=app

$ make deploy PROJECT_DIR_NAME=00064-nodejs-ESMODULEシステム整理整頓 APP_DIR_NAME=app CMD_NAME=mycmd

WEBでサーブするファイルに関しては以下の手順が別に必要

$ python3 -m http.server 8000 --directory 00067-nodejs-クラス単位でライブラリ化/app

index.htmlを右クリックでLIVE SERVERでWEBサーブ

実配備はWEBサーバ立ててワンファイルdist/main.jsを資産配備

```
