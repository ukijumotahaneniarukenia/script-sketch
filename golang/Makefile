PROJECT_NUMBER=$(shell find -maxdepth 1 -type d | grep -P '[0-9]{5}' | grep -Pv '\.git' | sort | awk -F'-' '$$0=$$1' | cut -c 3- | tail -n1 | xargs -I@ echo @ + 1 | bc | xargs -I@ printf "%05d\n" @)

LANG_NAME=golang

LANG_VERSION=$(shell go version | grep -i version | grep -Po '(\.?[0-9]+){3}' | tr '.' '-')

PROJECT_NAME=テンプレートプロジェクト

PROJECT_DIR_PREFIX=$(PROJECT_NUMBER)-$(LANG_NAME)

PROJECT_DIR_NAME=$(PROJECT_DIR_PREFIX)-$(PROJECT_NAME)

APP_DIR_NAME=app

APP_NAME=$(APP_DIR_NAME)

CMD_NAME=$(APP_NAME)

TEMPLATE_FILE_NAME=main.go

BUILD_TARGET_OSARCH_LIST="darwin/amd64 linux/386 linux/amd64 linux/arm freebsd/386 freebsd/amd64 openbsd/386 openbsd/amd64 windows/386 windows/amd64 freebsd/arm netbsd/386 netbsd/amd64 netbsd/arm linux/s390x linux/mips64 linux/mips64le linux/mips linux/mipsle"

MY_ARCH=$(shell dpkg --print-architecture)

MY_OS=$(shell uname -s | tr '[:upper:]' '[:lower:]')

clean :
	rm -rf ${PROJECT_DIR_NAME}

build :
	export GOPATH=$(HOME)/.local/go-repo

	go get github.com/mitchellh/gox

	rm -f ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/bin/*

	( cd ${PROJECT_DIR_NAME}/${APP_DIR_NAME} && export GOPATH=$(pwd) && cd src/main && gox --osarch ${BUILD_TARGET_OSARCH_LIST} )

	mv ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/src/main/main_* ${PROJECT_DIR_NAME}/${APP_DIR_NAME}/bin

create :
	mkdir -p $(PROJECT_DIR_NAME)

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)

	echo '/bin/* /pkg/* /src/github.com/* /src/golang.org/* ' | xargs -n1 >$(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/.gitignore

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/bin

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/pkg

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/test

	mkdir -p $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/src/main

	cp $(TEMPLATE_FILE_NAME) $(PROJECT_DIR_NAME)/$(APP_DIR_NAME)/src/main/main.go

deploy :
	#パス登録
	find ${PROJECT_DIR_NAME} -type f | grep bin | grep ${MY_ARCH} | grep ${MY_OS}| xargs -I@ echo cp @ ${HOME}/.local/script-cmd/bin/${APP_NAME}-${LANG_NAME}-${LANG_VERSION} | bash

	mv ${HOME}/.local/script-cmd/bin/${APP_NAME}-${LANG_NAME}-${LANG_VERSION} ${HOME}/.local/script-cmd/bin/${CMD_NAME}

	which ${CMD_NAME}

run :
	echo $(HOME)

	echo $(UNAME)

	echo $(LANG_VERSION)

# clean :
# 	rm -rf $(PROJECT_DIR_NAME)

