PROJECT_NUMBER=$(shell find -maxdepth 1 -type d | grep -P '[0-9]{5}' | grep -Pv '\.git' | sort | awk -F'-' '$$0=$$1' | cut -c 3- | tail -n1 | xargs -I@ echo @ + 1 | bc | xargs -I@ printf "%05d\n" @)

LANG_NAME=rust

LANG_VERSION=$(shell cargo --version | awk '$$0=$$2' | tr '.' '-')

PROJECT_NAME=テンプレートプロジェクト

PROJECT_DIR_PREFIX=$(PROJECT_NUMBER)-$(LANG_NAME)

PROJECT_DIR_NAME=$(PROJECT_DIR_PREFIX)-$(PROJECT_NAME)

APP_DIR_NAME=app

APP_NAME=$(APP_DIR_NAME)

CMD_NAME=$(APP_NAME)

TEMPLATE_FILE_NAME=main.rs

MY_ARCH=$(shell dpkg --print-architecture)

MY_OS=$(shell uname -s | tr '[:upper:]' '[:lower:]')

clean :
	rm -rf ${PROJECT_DIR_NAME}

build :

	rm -rf ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/target/*

	( cd $(PROJECT_DIR_NAME)/${APP_DIR_NAME} && cargo build )

	cp $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/target/debug/$(APP_DIR_NAME) $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/bin/

create :
	mkdir -p $(PROJECT_DIR_NAME)

	( cd $(PROJECT_DIR_NAME) && cargo new $(APP_DIR_NAME) )

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/bin

	echo '/target/* /bin/*' | xargs -n1 >$(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/.gitignore

deploy :
	#パス登録
	find $(PROJECT_DIR_NAME) -type f | grep bin | xargs file | grep -P 'shared object'|awk -F ':' '$$0=$$1' | xargs -I@ echo cp @ ${HOME}/.local/script-cmd/bin/${APP_NAME}-${LANG_NAME}-${LANG_VERSION} | bash

	mv ${HOME}/.local/script-cmd/bin/${APP_NAME}-${LANG_NAME}-${LANG_VERSION} ${HOME}/.local/script-cmd/bin/${CMD_NAME}

	which ${CMD_NAME}

run :
	$(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/bin/$(APP_DIR_NAME)
