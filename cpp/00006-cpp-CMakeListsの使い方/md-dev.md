このコンパクト例をトレース
- https://qiita.com/shohirose/items/45fb49c6b429e8b204ac


```
$tree
.
├── CMakeLists.txt
├── hello.cpp
├── hello.hpp
├── main.cpp
└── md-dev.md

0 directories, 5 files
```


```
$vi CMakeLists.txt
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
```


```
$make
Scanning dependencies of target a.out
[ 33%] Building CXX object CMakeFiles/a.out.dir/main.cpp.o
[ 66%] Building CXX object CMakeFiles/a.out.dir/hello.cpp.o
[100%] Linking CXX executable a.out
[100%] Built target a.out
$ll
total 56
drwxr-xr-x. 3 kuraine kuraine  4096  5月 14 19:57 ./
drwxr-xr-x. 4 kuraine kuraine  4096  5月 14 19:57 ../
-rw-r--r--. 1 kuraine kuraine 11827  5月 14 19:57 CMakeCache.txt
drwxr-xr-x. 5 kuraine kuraine  4096  5月 14 19:57 CMakeFiles/
-rw-r--r--. 1 kuraine kuraine  5547  5月 14 19:57 Makefile
-rwxr-xr-x. 1 kuraine kuraine 17384  5月 14 19:57 a.out*
-rw-r--r--. 1 kuraine kuraine  1580  5月 14 19:57 cmake_install.cmake

```

```
$tree
.
├── CMakeCache.txt
├── CMakeFiles
│   ├── 3.13.4
│   │   ├── CMakeCXXCompiler.cmake
│   │   ├── CMakeDetermineCompilerABI_CXX.bin
│   │   ├── CMakeSystem.cmake
│   │   └── CompilerIdCXX
│   │       ├── CMakeCXXCompilerId.cpp
│   │       ├── a.out
│   │       └── tmp
│   ├── CMakeDirectoryInformation.cmake
│   ├── CMakeOutput.log
│   ├── CMakeTmp
│   ├── Makefile.cmake
│   ├── Makefile2
│   ├── TargetDirectories.txt
│   ├── a.out.dir
│   │   ├── CXX.includecache
│   │   ├── DependInfo.cmake
│   │   ├── build.make
│   │   ├── cmake_clean.cmake
│   │   ├── depend.internal
│   │   ├── depend.make
│   │   ├── flags.make
│   │   ├── hello.cpp.o
│   │   ├── link.txt
│   │   ├── main.cpp.o
│   │   └── progress.make
│   ├── cmake.check_cache
│   ├── feature_tests.bin
│   ├── feature_tests.cxx
│   └── progress.marks
├── Makefile
├── a.out
└── cmake_install.cmake

6 directories, 29 files
```


```
$./a.out
Hello!
```
