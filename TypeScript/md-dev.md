denoでプログラムを実行するとimport周りでこけるので、
スケッチする以外はあんまり使わない感じなのかな
いままでどおりnodeで実行することにするか

```
$ make clean PROJECT_DIR_NAME=00001-TypeScript-サンプルプロジェクト

$ make create PROJECT_NAME=サンプルプロジェクト APP_DIR_NAME=app

$ make build PROJECT_DIR_NAME=00001-TypeScript-サンプルプロジェクト APP_DIR_NAME=app

$ make deploy PROJECT_DIR_NAME=00001-TypeScript-サンプルプロジェクト APP_DIR_NAME=app CMD_NAME=mycmd

$ mycmd
うんこ
うんこもりもり
うんこもりもり森鴎外

$ make serve PROJECT_DIR_NAME=00001-TypeScript-サンプルプロジェクト APP_DIR_NAME=app
```
