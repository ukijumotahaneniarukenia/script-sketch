PROJECT_NUMBER=$(shell find -maxdepth 1 -type d | grep -P '[0-9]{5}' | grep -Pv '\.git' | sort | awk -F'-' '$$0=$$1' | cut -c 3- | tail -n1 | xargs -I@ echo @ + 1 | bc | xargs -I@ printf "%05d\n" @)

LANG_NAME=TypeScript

LANG_VERSION=$(shell node -v | grep -Po '(\.?[0-9]+){3}' | tr '.' '-')

PROJECT_NAME=テンプレートプロジェクト

PROJECT_DIR_PREFIX=$(PROJECT_NUMBER)-$(LANG_NAME)

PROJECT_DIR_NAME=$(PROJECT_DIR_PREFIX)-$(PROJECT_NAME)

APP_DIR_NAME=app

APP_NAME=$(APP_DIR_NAME)

CMD_NAME=$(APP_NAME)

TEMPLATE_MAIN_FILE_NAME=index.ts

TEMPLATE_LIB_FILE_NAME=mylib.ts

clean :
	rm -rf ${PROJECT_DIR_NAME}

build :

	rm -rf ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/dist/*

	rm -rf ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/types/*

	# 型定義の作成
	# https://www.typescriptlang.org/docs/handbook/declaration-files/dts-from-js.html
	find ${PROJECT_DIR_NAME}/${APP_DIR_NAME} -type f | grep -P 'ts$$' | grep -vP 'node_modules|types' | xargs -I@ tsc @ --declaration --allowJs --emitDeclarationOnly --outDir ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/types

	# webpackビルド時のエラーハンドリングのため、ESMODULE扱いを無効にする
	cat $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/package.json | jq 'del(.type)' | sponge $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/package.json

	( cd ${PROJECT_DIR_NAME}/${APP_DIR_NAME} && tsc )

	( cd ${PROJECT_DIR_NAME}/${APP_DIR_NAME} && node_modules/webpack/bin/webpack.js )

	chmod 755 $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/dist/main.js

	sed -i '1i#!/usr/bin/env node' $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/dist/main.js

	# webpackビルド完了後、ESMODULE扱いを有効にする
	cat $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/package.json | jq '.+{"type":"module"}' | sponge $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/package.json

create :
	mkdir -p $(PROJECT_DIR_NAME)

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)

	( cd $(PROJECT_DIR_NAME)/$(APP_DIR_NAME) && npm init -y )

	( cd $(PROJECT_DIR_NAME)/$(APP_DIR_NAME) && npm install typescript --save )

	( cd $(PROJECT_DIR_NAME)/$(APP_DIR_NAME) && npm install webpack webpack-cli --save-dev )

	cat $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/package.json | jq '.+{"type":"module"}' | sponge $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/package.json

	echo '/node_modules/* /dist/* /types/*' | xargs -n1 >$(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/.gitignore

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/dist

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/lib

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/tests

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/src

	cp $(TEMPLATE_MAIN_FILE_NAME) $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/src/index.ts

	cp $(TEMPLATE_LIB_FILE_NAME) $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/lib/mylib.ts

	cp webpack.config.js $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/webpack.config.js

	cp tsconfig.json $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/tsconfig.json

	cp index.html $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/index.html

	cp favicon.ico $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/favicon.ico

deploy :

	./${PROJECT_DIR_NAME}/${APP_DIR_NAME}/dist/main.js

	#パス登録
	find ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/dist -type f | grep main.js | xargs -I@ echo cp @ ${HOME}/.local/script-cmd/bin/${APP_NAME}-${LANG_NAME}-${LANG_VERSION} | bash

	mv ${HOME}/.local/script-cmd/bin/${APP_NAME}-${LANG_NAME}-${LANG_VERSION} ${HOME}/.local/script-cmd/bin/${CMD_NAME}

	which ${CMD_NAME}

run :
	node ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/dist/main.js

serve :
	python3 -m http.server 8000 --directory ${PROJECT_DIR_NAME}/${APP_DIR_NAME}
