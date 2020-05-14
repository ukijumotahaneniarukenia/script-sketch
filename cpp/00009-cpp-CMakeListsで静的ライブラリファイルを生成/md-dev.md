```
$cmake --version
cmake version 3.13.4

CMake suite maintained and supported by Kitware (kitware.com/cmake).
```


```
$ll
total 36
drwxr-xr-x.  2 kuraine kuraine 4096  5月 14 21:42 ./
drwxr-xr-x. 12 kuraine kuraine 4096  5月 14 20:05 ../
-rw-r--r--.  1 kuraine kuraine  198  5月 14 21:42 CMakeLists.txt
-rw-r--r--.  1 kuraine kuraine  116  5月 14 21:37 good-morning.cpp
-rw-r--r--.  1 kuraine kuraine   78  5月 14 21:37 good-morning.hpp
-rw-r--r--.  1 kuraine kuraine   97  5月 14 21:37 hello.cpp
-rw-r--r--.  1 kuraine kuraine   56  5月 14 21:37 hello.hpp
-rw-r--r--.  1 kuraine kuraine   84  5月 14 21:37 main.cpp
-rw-r--r--.  1 kuraine kuraine  116  5月 14 21:39 md-dev.md
```

ビルドディレクトリの作成

```
$mkdir build
$cd build/
```

CMakeLists.txtファイルがあるディレクトリを指定

```
$cmake ..
-- The CXX compiler identification is GNU 9.2.1
-- Check for working CXX compiler: /bin/c++
-- Check for working CXX compiler: /bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/kuraine/script-sketch/cpp/00008-cpp-共有ライブラリファイル-ダイナミックリンクファイルを生成/build
```

```
$make
Scanning dependencies of target greetings
[ 20%] Building CXX object CMakeFiles/greetings.dir/hello.cpp.o
[ 40%] Building CXX object CMakeFiles/greetings.dir/good-morning.cpp.o
[ 60%] Linking CXX static library libgreetings.a
[ 60%] Built target greetings
Scanning dependencies of target a.out
[ 80%] Building CXX object CMakeFiles/a.out.dir/main.cpp.o
[100%] Linking CXX executable a.out
[100%] Built target a.out

$ll
total 64
drwxr-xr-x. 3 kuraine kuraine  4096  5月 14 21:42 ./
drwxr-xr-x. 3 kuraine kuraine  4096  5月 14 21:42 ../
-rw-r--r--. 1 kuraine kuraine 12127  5月 14 21:42 CMakeCache.txt
drwxr-xr-x. 6 kuraine kuraine  4096  5月 14 21:42 CMakeFiles/
-rw-r--r--. 1 kuraine kuraine  7092  5月 14 21:42 Makefile
-rwxr-xr-x. 1 kuraine kuraine 17400  5月 14 21:42 a.out*
-rw-r--r--. 1 kuraine kuraine  1700  5月 14 21:42 cmake_install.cmake
-rw-r--r--. 1 kuraine kuraine  6180  5月 14 21:42 libgreetings.a


$./a.out
Good Morning
```
