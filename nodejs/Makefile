PROJECT_NUMBER=$(shell find -maxdepth 1 -type d | grep -P '[0-9]{5}' | grep -Pv '\.git' | sort | awk -F'-' '$$0=$$1' | cut -c 3- | tail -n1 | xargs -I@ echo @ + 1 | bc | xargs -I@ printf "%05d\n" @)

LANG_NAME=nodejs

LANG_VERSION=$(shell node -v | grep -Po '(\.?[0-9]+){3}' | tr '.' '-')

PROJECT_NAME=テンプレートプロジェクト

PROJECT_DIR_PREFIX=$(PROJECT_NUMBER)-$(LANG_NAME)

PROJECT_DIR_NAME=$(PROJECT_DIR_PREFIX)-$(PROJECT_NAME)

APP_DIR_NAME=app

APP_NAME=$(APP_DIR_NAME)

CMD_NAME=$(APP_NAME)

TEMPLATE_MAIN_FILE_NAME=index.js

TEMPLATE_LIB_FILE_NAME=mylib.js

clean :
	rm -rf ${PROJECT_DIR_NAME}

# build :

# 	rm -f ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/bin/*

# 	#なにがしかのビルド

# 	mv ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/src/main/main_* ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/bin

create :
	mkdir -p $(PROJECT_DIR_NAME)

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)

	echo '/node_modules/*' | xargs -n1 >$(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/.gitignore

	echo '{"type":"module"}' | jq '' >$(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/package.json

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/dist

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/lib

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/tests

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/src

	cp $(TEMPLATE_MAIN_FILE_NAME) $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/src/index.js

	cp $(TEMPLATE_LIB_FILE_NAME) $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/lib/mylib.js

# deploy :
# 	#パス登録
# 	find ${PROJECT_DIR_NAME} -type f | grep bin | grep ${MY_ARCH} | grep ${MY_OS}| xargs -I@ echo cp @ ${HOME}/.local/script-cmd/bin/${APP_NAME}-${LANG_NAME}-${LANG_VERSION} | bash

# 	mv ${HOME}/.local/script-cmd/bin/${APP_NAME}-${LANG_NAME}-${LANG_VERSION} ${HOME}/.local/script-cmd/bin/${CMD_NAME}

# 	which ${CMD_NAME}

run :
	echo $(HOME)

	echo $(UNAME)

	echo $(LANG_VERSION)
