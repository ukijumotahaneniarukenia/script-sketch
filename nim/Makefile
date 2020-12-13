PROJECT_NUMBER=$(shell find -maxdepth 1 -type d | grep -P '[0-9]{5}' | grep -Pv '\.git' | sort | awk -F'-' '$$0=$$1' | cut -c 3- | tail -n1 | xargs -I@ echo @ + 1 | bc | xargs -I@ printf "%05d\n" @)

LANG_NAME=nim

LANG_VERSION=$(shell nim --version | grep -i Version | grep -Po '(\.?[0-9]+){3}' | tr '.' '-')

PROJECT_NAME=テンプレートプロジェクト

PROJECT_DIR_PREFIX=$(PROJECT_NUMBER)-$(LANG_NAME)

PROJECT_DIR_NAME=$(PROJECT_DIR_PREFIX)-$(PROJECT_NAME)

APP_DIR_NAME=app

APP_NAME=$(APP_DIR_NAME)

TEMPLATE_FILE_NAME=main.nim

clean :
	rm -rf ${PROJECT_DIR_NAME}

build :

	rm -f ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/bin/*

	( cd ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/src/main && nim c main.nim )

	mv ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/src/main/main ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/bin

create :
	mkdir -p $(PROJECT_DIR_NAME)

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)

	echo '/bin/* /pkg/*' | xargs -n1 >$(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/.gitignore

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/bin

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/pkg

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/test

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/src/main

	cp $(TEMPLATE_FILE_NAME) $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/src/main/main.nim

deploy :
	#パス登録
	find ${PROJECT_DIR_NAME} -type f | grep bin | xargs -I@ echo cp @ ${HOME}/.local/script-cmd/bin/${APP_NAME}-${LANG_NAME}-${LANG_VERSION} | bash

	which ${APP_NAME}-${LANG_NAME}-${LANG_VERSION}

run :
	echo $(HOME)
