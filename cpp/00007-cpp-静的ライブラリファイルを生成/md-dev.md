- オブジェクトファイルの作成

オブジェクトファイル名はgood-morning.o hello.o

```
$g++ -c hello.cpp good-morning.cpp
```


```
$ll
total 36
drwxr-xr-x.  2 kuraine kuraine 4096  5月 14 21:28 ./
drwxr-xr-x. 12 kuraine kuraine 4096  5月 14 20:05 ../
-rw-r--r--.  1 kuraine kuraine  116  5月 14 21:20 good-morning.cpp
-rw-r--r--.  1 kuraine kuraine   78  5月 14 21:18 good-morning.hpp
-rw-r--r--.  1 kuraine kuraine 2944  5月 14 21:28 good-morning.o
-rw-r--r--.  1 kuraine kuraine   97  5月 14 21:28 hello.cpp
-rw-r--r--.  1 kuraine kuraine   56  5月 14 21:22 hello.hpp
-rw-r--r--.  1 kuraine kuraine 2928  5月 14 21:28 hello.o
-rw-r--r--.  1 kuraine kuraine   84  5月 14 21:21 main.cpp
```



- 静的ライブラリの作成

静的ライブラリファイル名はlibgreetings.a

```
$ar rvs libgreetings.a hello.o good-morning.o
ar: creating libgreetings.a
a - hello.o
a - good-morning.o
```


```
$ll
total 44
drwxr-xr-x.  2 kuraine kuraine 4096  5月 14 21:30 ./
drwxr-xr-x. 12 kuraine kuraine 4096  5月 14 20:05 ../
-rw-r--r--.  1 kuraine kuraine  116  5月 14 21:20 good-morning.cpp
-rw-r--r--.  1 kuraine kuraine   78  5月 14 21:18 good-morning.hpp
-rw-r--r--.  1 kuraine kuraine 2944  5月 14 21:28 good-morning.o
-rw-r--r--.  1 kuraine kuraine   97  5月 14 21:28 hello.cpp
-rw-r--r--.  1 kuraine kuraine   56  5月 14 21:22 hello.hpp
-rw-r--r--.  1 kuraine kuraine 2928  5月 14 21:28 hello.o
-rw-r--r--.  1 kuraine kuraine 6100  5月 14 21:30 libgreetings.a
-rw-r--r--.  1 kuraine kuraine   84  5月 14 21:21 main.cpp
```

インクルードしているけどリンクファイルを指定しないとエラー

```
$g++ main.cpp
/bin/ld: /tmp/ccIHZaDm.o: in function `main':
main.cpp:(.text+0x9): undefined reference to `good_morning()'
collect2: error: ld returned 1 exit status
```



そこでmain.cppをコンパイルしてlibgreetings.aとリンクし実行ファイルa.outを作成


```
$g++ main.cpp libgreetings.a
```


```
$ll
total 64
drwxr-xr-x.  2 kuraine kuraine  4096  5月 14 21:33 ./
drwxr-xr-x. 12 kuraine kuraine  4096  5月 14 20:05 ../
-rwxr-xr-x.  1 kuraine kuraine 17400  5月 14 21:33 a.out*
-rw-r--r--.  1 kuraine kuraine   116  5月 14 21:20 good-morning.cpp
-rw-r--r--.  1 kuraine kuraine    78  5月 14 21:18 good-morning.hpp
-rw-r--r--.  1 kuraine kuraine  2944  5月 14 21:28 good-morning.o
-rw-r--r--.  1 kuraine kuraine    97  5月 14 21:28 hello.cpp
-rw-r--r--.  1 kuraine kuraine    56  5月 14 21:22 hello.hpp
-rw-r--r--.  1 kuraine kuraine  2928  5月 14 21:28 hello.o
-rw-r--r--.  1 kuraine kuraine  6100  5月 14 21:30 libgreetings.a
-rw-r--r--.  1 kuraine kuraine    84  5月 14 21:32 main.cpp
```


実行


```
$./a.out
Good Morning

```
