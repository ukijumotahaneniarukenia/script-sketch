ビルド前

```
$ll
total 36
drwxr-xr-x.  2 kuraine kuraine 4096  5月 14 21:50 ./
drwxr-xr-x. 12 kuraine kuraine 4096  5月 14 20:05 ../
-rw-r--r--.  1 kuraine kuraine    9  5月 14 21:43 .gitignore
-rw-r--r--.  1 kuraine kuraine  116  5月 14 21:37 good-morning.cpp
-rw-r--r--.  1 kuraine kuraine   78  5月 14 21:37 good-morning.hpp
-rw-r--r--.  1 kuraine kuraine   97  5月 14 21:37 hello.cpp
-rw-r--r--.  1 kuraine kuraine   56  5月 14 21:37 hello.hpp
-rw-r--r--.  1 kuraine kuraine   84  5月 14 21:37 main.cpp
-rw-r--r--.  1 kuraine kuraine 2312  5月 14 21:46 md-dev.md
```

オブジェクトファイル(hello.o, good_morning.o)の作成

```
$g++ -fPIC -c hello.cpp good-morning.cpp
```


```
$ll
total 40
drwxr-xr-x.  2 kuraine kuraine 4096  5月 14 21:51 ./
drwxr-xr-x. 12 kuraine kuraine 4096  5月 14 20:05 ../
-rw-r--r--.  1 kuraine kuraine    9  5月 14 21:43 .gitignore
-rw-r--r--.  1 kuraine kuraine  116  5月 14 21:37 good-morning.cpp
-rw-r--r--.  1 kuraine kuraine   78  5月 14 21:37 good-morning.hpp
-rw-r--r--.  1 kuraine kuraine 2968  5月 14 21:51 good-morning.o
-rw-r--r--.  1 kuraine kuraine   97  5月 14 21:37 hello.cpp
-rw-r--r--.  1 kuraine kuraine   56  5月 14 21:37 hello.hpp
-rw-r--r--.  1 kuraine kuraine 2928  5月 14 21:51 hello.o
-rw-r--r--.  1 kuraine kuraine   84  5月 14 21:37 main.cpp
-rw-r--r--.  1 kuraine kuraine    0  5月 14 21:50 md-dev.md
```

共有ライブラリ（libgreetings.so）の作成

```
$g++ -shared hello.o good-morning.o -o libgreetings.so
```


```
$ll
total 60
drwxr-xr-x.  2 kuraine kuraine  4096  5月 14 21:51 ./
drwxr-xr-x. 12 kuraine kuraine  4096  5月 14 20:05 ../
-rw-r--r--.  1 kuraine kuraine     9  5月 14 21:43 .gitignore
-rw-r--r--.  1 kuraine kuraine   116  5月 14 21:37 good-morning.cpp
-rw-r--r--.  1 kuraine kuraine    78  5月 14 21:37 good-morning.hpp
-rw-r--r--.  1 kuraine kuraine  2968  5月 14 21:51 good-morning.o
-rw-r--r--.  1 kuraine kuraine    97  5月 14 21:37 hello.cpp
-rw-r--r--.  1 kuraine kuraine    56  5月 14 21:37 hello.hpp
-rw-r--r--.  1 kuraine kuraine  2928  5月 14 21:51 hello.o
-rwxr-xr-x.  1 kuraine kuraine 17064  5月 14 21:51 libgreetings.so*
-rw-r--r--.  1 kuraine kuraine    84  5月 14 21:37 main.cpp
-rw-r--r--.  1 kuraine kuraine     0  5月 14 21:50 md-dev.md
```


main.cppをコンパイルしてlibgreetings.soとリンクし実行ファイルa.outを作成

```
$g++ main.cpp -L . -lgreetings -Xlinker -rpath -Xlinker .
```


```
$ll
total 80
drwxr-xr-x.  2 kuraine kuraine  4096  5月 14 21:52 ./
drwxr-xr-x. 12 kuraine kuraine  4096  5月 14 20:05 ../
-rw-r--r--.  1 kuraine kuraine     9  5月 14 21:43 .gitignore
-rwxr-xr-x.  1 kuraine kuraine 16696  5月 14 21:52 a.out*
-rw-r--r--.  1 kuraine kuraine   116  5月 14 21:37 good-morning.cpp
-rw-r--r--.  1 kuraine kuraine    78  5月 14 21:37 good-morning.hpp
-rw-r--r--.  1 kuraine kuraine  2968  5月 14 21:51 good-morning.o
-rw-r--r--.  1 kuraine kuraine    97  5月 14 21:37 hello.cpp
-rw-r--r--.  1 kuraine kuraine    56  5月 14 21:37 hello.hpp
-rw-r--r--.  1 kuraine kuraine  2928  5月 14 21:51 hello.o
-rwxr-xr-x.  1 kuraine kuraine 17064  5月 14 21:51 libgreetings.so*
-rw-r--r--.  1 kuraine kuraine    84  5月 14 21:37 main.cpp
-rw-r--r--.  1 kuraine kuraine     0  5月 14 21:50 md-dev.md
```

実行

```
$./a.out
Good Morning
```
