このコンパクト例をトレース
- https://qiita.com/shohirose/items/45fb49c6b429e8b204ac

- コンパイル前

```
$tree
.
├── hello.cpp
├── hello.hpp
├── main.cpp
└── md-dev.md

0 directories, 4 files
```

- ソースファイルをコンパイルしてオブジェクトファイル（main.o, hello.o）を生成

```
$g++ -c main.cpp hello.cpp
$tree
.
├── hello.cpp
├── hello.hpp
├── hello.o
├── main.cpp
├── main.o
└── md-dev.md

0 directories, 6 files
```

- オブジェクトファイルをリンクしてa.outという実行ファイルを生成

```
$g++ -o a.out main.o hello.o
$tree
.
├── a.out
├── hello.cpp
├── hello.hpp
├── hello.o
├── main.cpp
├── main.o
└── md-dev.md

0 directories, 7 files
```

- 実行

```
$./a.out
Hello!
```

- オブジェクトファイルのリンク付け操作込みでa.outという実行ファイルを生成

```
$g++ main.cpp hello.cpp
$tree
.
├── a.out
├── hello.cpp
├── hello.hpp
├── hello.o
├── main.cpp
├── main.o
└── md-dev.md

0 directories, 7 files
```


- オブジェクトファイルのリンク付け操作込みでb.outという実行ファイルを生成

```
$g++ main.cpp hello.cpp -o b.out
$tree
.
├── a.out
├── b.out
├── hello.cpp
├── hello.hpp
├── hello.o
├── main.cpp
├── main.o
└── md-dev.md

0 directories, 8 files
```

- 実行

```
$./b.out
Hello!
```



中間生成物のオブジェクトファイルを削除してからb.out実行ファイルを生成


```
$rm *o
$ll
total 64
drwxr-xr-x. 2 kuraine kuraine  4096  5月 14 19:50 ./
drwxr-xr-x. 7 kuraine kuraine  4096  5月 14 19:39 ../
-rwxr-xr-x. 1 kuraine kuraine 17384  5月 14 19:45 a.out*
-rwxr-xr-x. 1 kuraine kuraine 17384  5月 14 19:45 b.out*
-rw-r--r--. 1 kuraine kuraine    98  5月 14 19:43 hello.cpp
-rw-r--r--. 1 kuraine kuraine    54  5月 14 19:43 hello.hpp
-rw-r--r--. 1 kuraine kuraine    49  5月 14 19:43 main.cpp
-rw-r--r--. 1 kuraine kuraine  1506  5月 14 19:50 md-dev.md

$rm *out
$ll
total 24
drwxr-xr-x. 2 kuraine kuraine 4096  5月 14 19:51 ./
drwxr-xr-x. 7 kuraine kuraine 4096  5月 14 19:39 ../
-rw-r--r--. 1 kuraine kuraine   98  5月 14 19:43 hello.cpp
-rw-r--r--. 1 kuraine kuraine   54  5月 14 19:43 hello.hpp
-rw-r--r--. 1 kuraine kuraine   49  5月 14 19:43 main.cpp
-rw-r--r--. 1 kuraine kuraine 1506  5月 14 19:50 md-dev.md

$g++ main.cpp hello.cpp -o b.out
$ll
total 44
drwxr-xr-x. 2 kuraine kuraine  4096  5月 14 19:51 ./
drwxr-xr-x. 7 kuraine kuraine  4096  5月 14 19:39 ../
-rwxr-xr-x. 1 kuraine kuraine 17384  5月 14 19:51 b.out*
-rw-r--r--. 1 kuraine kuraine    98  5月 14 19:43 hello.cpp
-rw-r--r--. 1 kuraine kuraine    54  5月 14 19:43 hello.hpp
-rw-r--r--. 1 kuraine kuraine    49  5月 14 19:43 main.cpp
-rw-r--r--. 1 kuraine kuraine  1506  5月 14 19:50 md-dev.md

$./b.out
Hello!
```
