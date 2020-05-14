```
$rm -rf build/
$mkdir build
$cd build
```

```
$cmake -DGREETINGS_BUILD_SHARED_LIBS=ON ..
-- The CXX compiler identification is GNU 9.2.1
-- Check for working CXX compiler: /bin/c++
-- Check for working CXX compiler: /bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/kuraine/script-sketch/cpp/00011-cpp-cmakeコマンドのオプションでライブラリファイル生成/build
$ll
total 36
drwxr-xr-x. 3 kuraine kuraine  4096  5月 14 22:07 ./
drwxr-xr-x. 3 kuraine kuraine  4096  5月 14 22:07 ../
-rw-r--r--. 1 kuraine kuraine 12147  5月 14 22:07 CMakeCache.txt
drwxr-xr-x. 6 kuraine kuraine  4096  5月 14 22:07 CMakeFiles/
-rw-r--r--. 1 kuraine kuraine  7037  5月 14 22:07 Makefile
-rw-r--r--. 1 kuraine kuraine  1678  5月 14 22:07 cmake_install.cmake
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
drwxr-xr-x. 3 kuraine kuraine  4096  5月 14 22:07 ./
drwxr-xr-x. 3 kuraine kuraine  4096  5月 14 22:07 ../
-rw-r--r--. 1 kuraine kuraine 12147  5月 14 22:07 CMakeCache.txt
drwxr-xr-x. 6 kuraine kuraine  4096  5月 14 22:07 CMakeFiles/
-rw-r--r--. 1 kuraine kuraine  7037  5月 14 22:07 Makefile
-rwxr-xr-x. 1 kuraine kuraine 16696  5月 14 22:07 a.out*
-rw-r--r--. 1 kuraine kuraine  1678  5月 14 22:07 cmake_install.cmake
-rwxr-xr-x. 1 kuraine kuraine 17064  5月 14 22:07 libgreetings.so*
```


```
$./a.out
Good Morning
```
