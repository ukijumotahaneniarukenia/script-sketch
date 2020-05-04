- Kdevelop用のテンプレートプロジェクトを用意

```
cd /usr/local/src
git clone https://github.com/xyz32/KDevelop-template.git
cp KDevelop-template/nimble_project/nimble_nim.kdevtemplate KDevelop-template/nimble_project/nimble_nim.desktop
```

- makeinfoコマンド用意

- gdbコマンド用意


- エディタ起動

```
$KDevelop.AppImage 1>launch-kdevelop.log 2>&1 </dev/null &
```

- プロジェクト作成


```
$cd ~/script-sketch/nim/00026-nim-kdevelopによるサンプルプロジェクト

```

```
kuraine docker-container-ubuntu-19-10-nim-kdevelop ~$tree projects/
projects/
└── app
    ├── _gitignore
    ├── app.kdev4
    ├── app.nimble
    ├── bin
    │   └── app
    ├── docs
    │   └── Docs
    ├── nim.cfg
    ├── nimble_nim.desktop
    ├── src
    │   ├── app.nim
    │   └── app.nim.cfg
    └── tests
        └── runTests.nim

5 directories, 10 files
kuraine docker-container-ubuntu-19-10-nim-kdevelop ~$find projects/
projects/
projects/app
projects/app/nimble_nim.desktop
projects/app/app.kdev4
projects/app/tests
projects/app/tests/runTests.nim
projects/app/bin
projects/app/bin/app
projects/app/nim.cfg
projects/app/docs
projects/app/docs/Docs
projects/app/app.nimble
projects/app/_gitignore
projects/app/.kdev4
projects/app/.kdev4/app.kdev4
projects/app/src
projects/app/src/app.nim
projects/app/src/app.nim.cfg
kuraine docker-container-ubuntu-19-10-nim-kdevelop ~$cat projects/app/src/app.nim

proc hello() =
  var unko="just another unko world"
  echo unko
  
when isMainModule:
  hello()



kuraine docker-container-ubuntu-19-10-nim-kdevelop ~$cat projects/app/nim.cfg
## gdb debugging
## uncomment this and use the GDB debugger in kdevelop
debugger:native

## Project wide nim cfg file
#cpu:arm
#os:linux

## Do not compile, generate a build script
#compile_only 
#gen_script

## setup compiler
#arm.linux.gcc.path = "/usr/bin/"
#arm.linux.gcc.exe = "arm-linux-gnu-gcc"
#arm.linux.gcc.linkerexe = "arm-linux-gnu-gcc"
```
