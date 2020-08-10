マルチプラットホーム向けのビルド手順

便利

```
export GOPATH=$HOME/.local/go-repo

go get github.com/mitchellh/gox

cd 00042-go-マップinマップ

( cd cd 00042-go-マップinマップ && export GOPATH=$(pwd) && cd src/main && gox )

find | grep main_ | ruby -F/ -anle 'a=$F[3].split(/_/);puts "mkdir","-p","./bin/"+a.slice(1..a.size).join("-"),"mv",$F.join("/"),"./bin/"+a.slice(1..a.size).join("-")+"/main"' | xargs -n3

$ file bin/windows-amd64.exe/main
bin/windows-amd64.exe/main: PE32+ executable (console) x86-64 (stripped to external PDB), for MS Windows

j
$ file bin/windows-386.exe/main
bin/windows-386.exe/main: PE32 executable (console) Intel 80386 (stripped to external PDB), for MS Windows

$ file bin/darwin-386/main
bin/darwin-386/main: Mach-O i386 executable

$ file bin/linux-amd64/main
bin/linux-amd64/main: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped

$ bin/linux-amd64/main
10
map[key:10 value:20]
map[key:30 value:40]
map[key:50 value:60]

$ bin/windows-amd64.exe/main
bash: bin/windows-amd64.exe/main: cannot execute binary file: Exec format error

$ cd 00042-go-マップinマップ

$ tree -a
.
├── .gitignore
├── bin
│   ├── darwin-386
│   │   └── main
│   ├── darwin-amd64
│   │   └── main
│   ├── freebsd-386
│   │   └── main
│   ├── freebsd-amd64
│   │   └── main
│   ├── freebsd-arm
│   │   └── main
│   ├── linux-386
│   │   └── main
│   ├── linux-amd64
│   │   └── main
│   ├── linux-arm
│   │   └── main
│   ├── linux-mips
│   │   └── main
│   ├── linux-mips64
│   │   └── main
│   ├── linux-mips64le
│   │   └── main
│   ├── linux-mipsle
│   │   └── main
│   ├── linux-s390x
│   │   └── main
│   ├── netbsd-386
│   │   └── main
│   ├── netbsd-amd64
│   │   └── main
│   ├── netbsd-arm
│   │   └── main
│   ├── openbsd-386
│   │   └── main
│   ├── openbsd-amd64
│   │   └── main
│   ├── windows-386.exe
│   │   └── main
│   └── windows-amd64.exe
│       └── main
└── src
    └── main
        └── main.go

23 directories, 22 files
```
