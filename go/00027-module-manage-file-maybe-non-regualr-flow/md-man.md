
共通レポジトリを作成したほうがいい

```
$ env | grep GO
GOPATH=/home/kuraine/.local/go-repo
$ ( cd src/main && go install )
main.go:6:5: cannot find package "rsc.io/quote" in any of:
	/usr/local/src/go/src/rsc.io/quote (from $GOROOT)
	/home/kuraine/.local/go-repo/src/rsc.io/quote (from $GOPATH)

$ ( cd src/main && go mod init main )
go: creating new go.mod: module main

$ tree
.
├── bin
│   └── main
├── md-dev.md
├── pkg
└── src
    └── main
        ├── go.mod
        └── main.go

4 directories, 4 files

$ cat ./src/main/go.mod
module main

go 1.13

$ ( cd src/main && go install ) | tee log
go: finding rsc.io/quote v1.5.2
go: downloading rsc.io/quote v1.5.2
go: extracting rsc.io/quote v1.5.2
go: downloading rsc.io/sampler v1.3.0
go: extracting rsc.io/sampler v1.3.0
go: downloading golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c
go: extracting golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c
go: finding rsc.io/sampler v1.3.0
go: finding golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c

$ tree
.
├── bin
│   └── main
├── log
├── md-dev.md
├── pkg
└── src
    └── main
        ├── go.mod
        ├── go.sum
        └── main.go

4 directories, 6 files

$ ( cd src/main && go install )
$ ./bin/main
Now On Air

$ $GOPATH/bin/main
こんにちは世界。
$ cat ./src/main/go.mod
module main

go 1.13

require rsc.io/quote v1.5.2

```
