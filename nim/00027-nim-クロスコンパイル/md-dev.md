- http://nim-lang-081.osdn.jp/docs/nimc.html

windows用にライブラリインストール

```
apt install -y mingw-w64
```

ビルド

cfgファイルがシステム単位、プロジェクト単位、ソースフォルダ単位の順で読み込まれている

```
$  ( cd ./nnn/src/ && nim --os:windows c nnn.nim )
Hint: used config file '/etc/nim/nim.cfg' [Conf]
Hint: used config file '/home/kuraine/projects/nnn/nim.cfg' [Conf]
Hint: used config file '/home/kuraine/projects/nnn/src/nnn.nim.cfg' [Conf]
Hint: system [Processing]
Hint: widestrs [Processing]
Hint: io [Processing]
Hint: nnn [Processing]
CC: stdlib_io.nim
CC: stdlib_system.nim
CC: nnn.nim
Hint:  [Link]
Hint: 14249 LOC; 1.165 sec; 15.984MiB peakmem; Debug build; proj: /home/kuraine/projects/nnn/src/nnn.nim; out: /home/kuraine/projects/nnn/src/nnn.exe [SuccessX]



$  ( cd ./nnn/src/ && nim --os:linux c nnn.nim )
Hint: used config file '/etc/nim/nim.cfg' [Conf]
Hint: used config file '/home/kuraine/projects/nnn/nim.cfg' [Conf]
Hint: used config file '/home/kuraine/projects/nnn/src/nnn.nim.cfg' [Conf]
Hint: system [Processing]
Hint: widestrs [Processing]
Hint: io [Processing]
Hint: nnn [Processing]
CC: stdlib_io.nim
CC: stdlib_system.nim
CC: nnn.nim
Hint:  [Link]
Hint: 14248 LOC; 0.715 sec; 15.984MiB peakmem; Debug build; proj: /home/kuraine/projects/nnn/src/nnn.nim; out: /home/kuraine/projects/nnn/src/nnn [SuccessX]
doc-ubuntu-18-04-vim (kuraine)  22:11:17  projects   file /home/kuraine/projects/nnn/src/nnn
/home/kuraine/projects/nnn/src/nnn: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=a859a9926017127d069c68f89fab90301427c860, with debug_info, not stripped
```


src配下できるので、bin配下に移動

```
$ find -type f | grep src | xargs file | grep -v text | cut -d ':' -f 1 | xargs -I@ mv @ ./nnn/bin/


$ find
.
./nnn
./nnn/nnn.kdev4
./nnn/.nim.cfg.kate-swp
./nnn/bin
./nnn/bin/nnn
./nnn/bin/nnn.exe
./nnn/_gitignore
./nnn/src
./nnn/src/nnn.nim.cfg
./nnn/src/nnn.nim
./nnn/docs
./nnn/docs/Docs
./nnn/nimble_nim.desktop
./nnn/.kdev4
./nnn/.kdev4/nnn.kdev4
./nnn/nim.cfg
./nnn/tests
./nnn/tests/runTests.nim
./nnn/nnn.nimble
```
