PROJECT_DIR_NAME=00099-golang-テンプレートプロジェクトの作成

APP_DIR_NAME=app

APP_NAME=$(APP_DIR_NAME)

TEMPLATE_FILE_NAME=main.go

LANG_NAME=golang

LANG_VERSION=$(shell go version | grep -i version | grep -Po '(\.?[0-9]+){3}' | tr '.' '-')

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

	which ${APP_NAME}-${LANG_NAME}-${LANG_VERSION}

run :
	echo $(HOME)

	echo $(UNAME)

	echo $(LANG_VERSION)

# clean :
# 	rm -rf $(PROJECT_DIR_NAME)

