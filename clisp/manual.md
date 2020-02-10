# インストール手順

```
$curl -LO http://prdownloads.sourceforge.net/sbcl/sbcl-1.5.9-x86-64-linux-binary.tar.bz2
$tar xvf sbcl-1.5.9-x86-64-linux-binary.tar.bz2
$cd sbcl-1.5.9-x86-64-linux
$sh run-sbcl.sh

```

これで以下のようになったときの解決
```
$sbcl
sbcl: /lib64/libc.so.6: version `GLIBC_2.28' not found (required by sbcl)
```

現状
```
$sbcl
sbcl: /lib64/libc.so.6: version `GLIBC_2.28' not found (required by sbcl)
$ldconfig -p | grep "/lib64/libc.so.6"
	libc.so.6 (libc6,x86-64, OS ABI: Linux 2.6.32) => /lib64/libc.so.6
$ll /lib64/libc.so.6
lrwxrwxrwx. 1 root root 12 10月 22 22:33 /lib64/libc.so.6 -> libc-2.17.so
$ll /lib64/libc-2.17.so
-rwxr-xr-x. 1 root root 2156160  8月  7 08:23 /lib64/libc-2.17.so

$ldconfig -p | grep "glib"
	libmm-glib.so.0 (libc6,x86-64) => /lib64/libmm-glib.so.0
	libjson-glib-1.0.so.0 (libc6,x86-64) => /lib64/libjson-glib-1.0.so.0
	libglib-2.0.so.0 (libc6,x86-64) => /lib64/libglib-2.0.so.0
	libglib-2.0.so (libc6,x86-64) => /lib64/libglib-2.0.so
	libdbus-glib-1.so.2 (libc6,x86-64) => /lib64/libdbus-glib-1.so.2
	libavahi-glib.so.1 (libc6,x86-64) => /lib64/libavahi-glib.so.1
```


上記の手順だとglibc周りで詰むので、roswellでいんすこ。

https://blog.8arrow.org/entry/2015/06/11/101511

```
$git clone https://github.com/roswell/roswell
$cd roswell
$sudo yum install -y automake libcurl-devel zlib-devel libcurl
$./bootstrap && ./configure && make -j12
$sudo make install
$which ros
/usr/local/bin/ros
$ros --version
roswell 19.09.12.102(0b630b9)
$ros setup
Installing sbcl-bin...
No SBCL version specified. Downloading platform-table.html to see the available versions...
[##########################################################################]100%
Installing sbcl-bin/1.5.9...
Downloading https://github.com/roswell/sbcl_bin/releases/download/1.5.9/sbcl-1.5.9-x86-64-linux-binary.tar.bz2
[##########################################################################]100%
Extracting sbcl-bin-1.5.9-x86-64-linux.tar.bz2 to /home/sqlite/.roswell/src/sbcl-1.5.9-x86-64-linux/
Building sbcl-bin/1.5.9... Done.
Install Script for sbcl-bin...
Installing Quicklisp... Done 9061
Making core for Roswell...
$ros help
Common Lisp environment setup Utility.
Usage:
   ros [options] Command [arguments...]
or
   ros [options] [[--] script-path arguments...]
commands:
   run       Run repl
   install   Install a given implementation or a system for roswell environment
   update    Update installed systems.
   build     Make executable from script.
   use       Change default implementation.
   init      Creates a new ros script, optionally based on a template.
   fmt       Indent lisp source.
   list      List Information
   template  Manage templates
   delete    Delete installed implementations
   config    Get and set options
   version   Show the roswell version information
Use "ros help [command]" for more information about a command.
Additional help topics:
   options
Use "ros help [topic]" for more information about the topic.
$ros run
* (format t "Hello World!~%")
Hello World!
NIL
```

# プロンプト変更

init.lispファイルに以下を記載。

```
$cat /home/sqlite/.roswell/init.lisp
(in-package :cl-user)

(if (string= "SBCL" (lisp-implementation-type))
  (setf sb-int:*repl-prompt-fun*
        (lambda (stream) (format stream "~%~A $" (package-name *package*)))))
```

# いんすこ内容確認

```
$ros run -- --version
SBCL 1.5.9
$ros list installed
Installed implementations:

Installed versions of sbcl-bin:
sbcl-bin/1.5.9
```

# シェルから起動

```
$cat helloworld.lsp 
(format t "Hello, World.~1%")
$ros -l helloworld.lsp 
Hello, World.
```

# 参考文献

https://qiita.com/oieioi/items/e4eaa78a4894ef549a23#_reference-6bd71752ad323923ec90

https://qiita.com/t-sin/items/054c2ff315ec3b9d3bdc

https://keens.github.io/blog/2014/12/08/ge-tochu-li-xi-potaburunacommon-lispshi-xing-ke-neng-huairuwozuo-ru/


http://bach.istc.kobe-u.ac.jp/lect/ProLang/org/lisp-cell.html


なんかかっこいい
http://blog.livedoor.jp/s-koide/archives/2335605.html
