```
$ll
total 28
drwxr-xr-x.  2 kuraine kuraine 4096  5月 14 22:11 ./
drwxr-xr-x. 14 kuraine kuraine 4096  5月 14 22:10 ../
-rw-r--r--.  1 kuraine kuraine  116  5月 14 22:11 good-morning.cpp
-rw-r--r--.  1 kuraine kuraine   78  5月 14 22:11 good-morning.hpp
-rw-r--r--.  1 kuraine kuraine   97  5月 14 22:11 hello.cpp
-rw-r--r--.  1 kuraine kuraine   56  5月 14 22:11 hello.hpp
-rw-r--r--.  1 kuraine kuraine   84  5月 14 22:11 main.cpp
-rw-r--r--.  1 kuraine kuraine    0  5月 14 22:11 md-dev.md
```


```
$mkdir include
$mv *hpp include/
$tree
.
├── good-morning.cpp
├── hello.cpp
├── include
│   ├── good-morning.hpp
│   └── hello.hpp
├── main.cpp
└── md-dev.md

1 directory, 6 files
$ls | grep cpp | grep -v main
good-morning.cpp
hello.cpp
$mkdir src
$ls | grep cpp | grep -v main | xargs -I@ mv @ src/
$tree
.
├── include
│   ├── good-morning.hpp
│   └── hello.hpp
├── main.cpp
├── md-dev.md
└── src
    ├── good-morning.cpp
    └── hello.cpp

2 directories, 6 files
$mkdir test
$mv main.cpp test/
```


ディレクトリ構成を整える

```
$tree
.
├── include
│   ├── good-morning.hpp
│   └── hello.hpp
├── md-dev.md
├── src
│   ├── good-morning.cpp
│   └── hello.cpp
└── test
    └── main.cpp

3 directories, 6 files
```


```
$ls
good-morning.cpp  hello.cpp
$g++ -fPIC -c hello.cpp good-morning.cpp -I../include
$ll
total 24
drwxr-xr-x. 2 kuraine kuraine 4096  5月 14 22:23 ./
drwxr-xr-x. 5 kuraine kuraine 4096  5月 14 22:21 ../
-rw-r--r--. 1 kuraine kuraine  116  5月 14 22:11 good-morning.cpp
-rw-r--r--. 1 kuraine kuraine 2968  5月 14 22:23 good-morning.o
-rw-r--r--. 1 kuraine kuraine   97  5月 14 22:11 hello.cpp
-rw-r--r--. 1 kuraine kuraine 2928  5月 14 22:23 hello.o
$g++ -shared *.o -o libgreetings.so
$ll
total 44
drwxr-xr-x. 2 kuraine kuraine  4096  5月 14 22:23 ./
drwxr-xr-x. 5 kuraine kuraine  4096  5月 14 22:21 ../
-rw-r--r--. 1 kuraine kuraine   116  5月 14 22:11 good-morning.cpp
-rw-r--r--. 1 kuraine kuraine  2968  5月 14 22:23 good-morning.o
-rw-r--r--. 1 kuraine kuraine    97  5月 14 22:11 hello.cpp
-rw-r--r--. 1 kuraine kuraine  2928  5月 14 22:23 hello.o
-rwxr-xr-x. 1 kuraine kuraine 17064  5月 14 22:23 libgreetings.so*
$cd ../test/
$ll
total 12
drwxr-xr-x. 2 kuraine kuraine 4096  5月 14 22:17 ./
drwxr-xr-x. 5 kuraine kuraine 4096  5月 14 22:21 ../
-rw-r--r--. 1 kuraine kuraine   84  5月 14 22:11 main.cpp
$ll
total 32
drwxr-xr-x. 2 kuraine kuraine  4096  5月 14 22:24 ./
drwxr-xr-x. 5 kuraine kuraine  4096  5月 14 22:21 ../
-rwxr-xr-x. 1 kuraine kuraine 16696  5月 14 22:24 a.out*
-rw-r--r--. 1 kuraine kuraine    84  5月 14 22:11 main.cpp
$./a.out
Good Morning
```



```
$tree
.
├── include
│   ├── good-morning.hpp
│   └── hello.hpp
├── md-dev.md
├── src
│   ├── good-morning.cpp
│   ├── good-morning.o
│   ├── hello.cpp
│   ├── hello.o
│   └── libgreetings.so
└── test
    ├── a.out
    └── main.cpp

3 directories, 10 files
```
