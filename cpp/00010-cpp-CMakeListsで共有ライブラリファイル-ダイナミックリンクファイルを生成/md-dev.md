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


```
$mkdir build
$cd build/
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
-- Build files have been written to: /home/kuraine/script-sketch/cpp/00010-cpp-CMakeListsで共有ライブラリファイル-ダイナミックリンクファイルを生成/build
```


```
$make
Scanning dependencies of target greetings
[ 20%] Building CXX object CMakeFiles/greetings.dir/hello.cpp.o
[ 40%] Building CXX object CMakeFiles/greetings.dir/good-morning.cpp.o
[ 60%] Linking CXX shared library libgreetings.so
[ 60%] Built target greetings
Scanning dependencies of target a.out
[ 80%] Building CXX object CMakeFiles/a.out.dir/main.cpp.o
[100%] Linking CXX executable a.out
[100%] Built target a.out
```

```
$ll
total 76
drwxr-xr-x. 3 kuraine kuraine  4096  5月 14 21:59 ./
drwxr-xr-x. 3 kuraine kuraine  4096  5月 14 21:58 ../
-rw-r--r--. 1 kuraine kuraine 12192  5月 14 21:59 CMakeCache.txt
drwxr-xr-x. 6 kuraine kuraine  4096  5月 14 21:59 CMakeFiles/
-rw-r--r--. 1 kuraine kuraine  7157  5月 14 21:59 Makefile
-rwxr-xr-x. 1 kuraine kuraine 16696  5月 14 21:59 a.out*
-rw-r--r--. 1 kuraine kuraine  1726  5月 14 21:59 cmake_install.cmake
-rwxr-xr-x. 1 kuraine kuraine 17064  5月 14 21:59 libgreetings.so*
```


```
$./a.out
Good Morning
```
