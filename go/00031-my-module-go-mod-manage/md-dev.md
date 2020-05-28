```
doc-ubuntu-18-04-vim (kuraine)  02:55:31  00031-my-module-go-mod-manage  (master)  ls
bin  pkg  src
doc-ubuntu-18-04-vim (kuraine)  02:55:32  00031-my-module-go-mod-manage  (master)  tree
.
├── bin
│   └── main
├── pkg
└── src
    └── main
        └── main.go

4 directories, 2 files
doc-ubuntu-18-04-vim (kuraine)  02:55:34  00031-my-module-go-mod-manage  (master)  vi src/main/main.go 
doc-ubuntu-18-04-vim (kuraine)  02:56:13  00031-my-module-go-mod-manage  (master)  
doc-ubuntu-18-04-vim (kuraine)  02:56:13  00031-my-module-go-mod-manage  (master)  
doc-ubuntu-18-04-vim (kuraine)  02:56:13  00031-my-module-go-mod-manage  (master)  
doc-ubuntu-18-04-vim (kuraine)  02:56:14  00031-my-module-go-mod-manage  (master)   ( export GOPATH=$(pwd) && cd src/main && go install )
main.go:6:5: cannot find package "github.com/ukijumotahaneniarukenia/go-repo/go_script" in any of:
	/usr/local/src/go/src/github.com/ukijumotahaneniarukenia/go-repo/go_script (from $GOROOT)
	/home/kuraine/script-sketch/go/00031-my-module-go-mod-manage/src/github.com/ukijumotahaneniarukenia/go-repo/go_script (from $GOPATH)
doc-ubuntu-18-04-vim (kuraine)  02:56:28  00031-my-module-go-mod-manage  (master)   ( cd src/main && go mod init main )
go: creating new go.mod: module main
doc-ubuntu-18-04-vim (kuraine)  02:56:34  00031-my-module-go-mod-manage  (master)  find | grep mod$
./src/main/go.mod
doc-ubuntu-18-04-vim (kuraine)  02:56:38  00031-my-module-go-mod-manage  (master)   cat ./src/main/go.mod
module main

go 1.13
doc-ubuntu-18-04-vim (kuraine)  02:56:42  00031-my-module-go-mod-manage  (master)   ( export GOPATH=$(pwd) && cd src/main && go install ) | tee log
go: finding github.com/ukijumotahaneniarukenia/go-repo latest
go: downloading github.com/ukijumotahaneniarukenia/go-repo v0.0.0-20200528172303-ebd6b7d39c0b
go: extracting github.com/ukijumotahaneniarukenia/go-repo v0.0.0-20200528172303-ebd6b7d39c0b
doc-ubuntu-18-04-vim (kuraine)  02:56:58  00031-my-module-go-mod-manage  (master)  
doc-ubuntu-18-04-vim (kuraine)  02:57:00  00031-my-module-go-mod-manage  (master)  
doc-ubuntu-18-04-vim (kuraine)  02:57:00  00031-my-module-go-mod-manage  (master)  
doc-ubuntu-18-04-vim (kuraine)  02:57:00  00031-my-module-go-mod-manage  (master)  tree
.
├── bin
│   └── main
├── log
├── pkg
│   ├── mod
│   │   ├── cache
│   │   │   ├── download
│   │   │   │   ├── github.com
│   │   │   │   │   └── ukijumotahaneniarukenia
│   │   │   │   │       └── go-repo
│   │   │   │   │           └── @v
│   │   │   │   │               ├── list
│   │   │   │   │               ├── list.lock
│   │   │   │   │               ├── v0.0.0-20200528172303-ebd6b7d39c0b.info
│   │   │   │   │               ├── v0.0.0-20200528172303-ebd6b7d39c0b.lock
│   │   │   │   │               ├── v0.0.0-20200528172303-ebd6b7d39c0b.mod
│   │   │   │   │               ├── v0.0.0-20200528172303-ebd6b7d39c0b.zip
│   │   │   │   │               └── v0.0.0-20200528172303-ebd6b7d39c0b.ziphash
│   │   │   │   └── sumdb
│   │   │   │       └── sum.golang.org
│   │   │   │           ├── lookup
│   │   │   │           │   └── github.com
│   │   │   │           │       └── ukijumotahaneniarukenia
│   │   │   │           │           └── go-repo@v0.0.0-20200528172303-ebd6b7d39c0b
│   │   │   │           └── tile
│   │   │   │               └── 8
│   │   │   │                   ├── 0
│   │   │   │                   │   └── x004
│   │   │   │                   │       └── 892.p
│   │   │   │                   │           └── 83
│   │   │   │                   ├── 1
│   │   │   │                   │   └── 019.p
│   │   │   │                   │       └── 28
│   │   │   │                   └── 2
│   │   │   │                       └── 000.p
│   │   │   │                           └── 19
│   │   │   └── lock
│   │   └── github.com
│   │       └── ukijumotahaneniarukenia
│   │           └── go-repo@v0.0.0-20200528172303-ebd6b7d39c0b
│   │               ├── README.md
│   │               ├── a.go
│   │               └── go_script
│   │                   ├── D00001-OPEN-xxxxx-yyyyy-zzzzz.go
│   │                   ├── F00001-OPEN-xxxxx-yyyyy-zzzzz.go
│   │                   └── F00002-NON-OPEN-xxxxx-yyyyy-zzzzz.go
│   └── sumdb
│       └── sum.golang.org
│           └── latest
└── src
    └── main
        ├── go.mod
        ├── go.sum
        └── main.go

31 directories, 23 files
doc-ubuntu-18-04-vim (kuraine)  02:57:08  00031-my-module-go-mod-manage  (master)  ./bin/main
e.num=100,e.str=kkk
hello world
HELLO world
3
doc-ubuntu-18-04-vim (kuraine)  02:57:15  00031-my-module-go-mod-manage  (master)  mv ./bin/main $HOME/.local/go-script/bin/testcmd
mv: cannot move './bin/main' to '/home/kuraine/.local/go-script/bin/testcmd': No such file or directory
doc-ubuntu-18-04-vim (kuraine)  02:57:36  00031-my-module-go-mod-manage  (master)  mkdir -p $HOME/.local/go-script/bin
doc-ubuntu-18-04-vim (kuraine)  02:57:45  00031-my-module-go-mod-manage  (master)  mv ./bin/main $HOME/.local/go-script/bin/testcmd
doc-ubuntu-18-04-vim (kuraine)  02:57:46  00031-my-module-go-mod-manage  (master)  export PATH=$HOME/.local/go-script/bin:$PATH
doc-ubuntu-18-04-vim (kuraine)  02:57:57  00031-my-module-go-mod-manage  (master)  testcmd 
e.num=100,e.str=kkk
hello world
HELLO world
3
doc-ubuntu-18-04-vim (kuraine)  02:58:03  00031-my-module-go-mod-manage  (master)  cat ./src/main/go.mod
module main

go 1.13

require github.com/ukijumotahaneniarukenia/go-repo v0.0.0-20200528172303-ebd6b7d39c0b
doc-ubuntu-18-04-vim (kuraine)  02:58:09  00031-my-module-go-mod-manage  (master)  ( cd src/main && go mod graph )
main github.com/ukijumotahaneniarukenia/go-repo@v0.0.0-20200528172303-ebd6b7d39c0b
doc-ubuntu-18-04-vim (kuraine)  02:58:21  00031-my-module-go-mod-manage  (master)  cat ./src/main/go.sum
github.com/ukijumotahaneniarukenia/go-repo v0.0.0-20200528172303-ebd6b7d39c0b h1:yh5kDj6kD8pExR+OcreZLBhJ3KAeFMDQgXhGptStEm4=
github.com/ukijumotahaneniarukenia/go-repo v0.0.0-20200528172303-ebd6b7d39c0b/go.mod h1:7iYcYaX/6zd2bk0T1qjk6reGkD4bkivSRWQw9TBhHQ0=
```
