- cmakeインストール

```
apt install cmake -y
```

[通し手順](https://qiita.com/shohirose/items/45fb49c6b429e8b204ac)


- ビルド手順

```
$cd ~/script-sketch/cpp

$mkdir -p 00003-cpp-テスト/app/build

$cd app

$cat <<EOS >main.cpp
#include <iostream>

int main(int argc, char **argv) {
    std::cout << "Hello, world!" << std::endl;
    return 0;
}
EOS

$ll main.cpp
-rw-r--r--. 1 kuraine kuraine 118  5月  4 11:58 app/main.cpp

$cat <<EOS >CMakeLists.txt
cmake_minimum_required(VERSION 3.0)

project(app)

add_executable(app main.cpp)

install(TARGETS app RUNTIME DESTINATION bin)
EOS

$cd build/

$cmake ..

-- The C compiler identification is GNU 9.2.1
-- The CXX compiler identification is GNU 9.2.1
-- Check for working C compiler: /bin/cc
-- Check for working C compiler: /bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /bin/c++
-- Check for working CXX compiler: /bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/kuraine/script-sketch/cpp/00003-cpp-テスト/app/build

$make
Scanning dependencies of target app
[ 50%] Building CXX object CMakeFiles/app.dir/main.cpp.o
[100%] Linking CXX executable app
[100%] Built target app

$tree app
app
├── CMakeLists.txt
├── app.kdev4
├── build
│   ├── CMakeCache.txt
│   ├── CMakeFiles
│   │   ├── 3.13.4
│   │   │   ├── CMakeCCompiler.cmake
│   │   │   ├── CMakeCXXCompiler.cmake
│   │   │   ├── CMakeDetermineCompilerABI_C.bin
│   │   │   ├── CMakeDetermineCompilerABI_CXX.bin
│   │   │   ├── CMakeSystem.cmake
│   │   │   ├── CompilerIdC
│   │   │   │   ├── CMakeCCompilerId.c
│   │   │   │   ├── a.out
│   │   │   │   └── tmp
│   │   │   └── CompilerIdCXX
│   │   │       ├── CMakeCXXCompilerId.cpp
│   │   │       ├── a.out
│   │   │       └── tmp
│   │   ├── CMakeDirectoryInformation.cmake
│   │   ├── CMakeOutput.log
│   │   ├── CMakeTmp
│   │   ├── Makefile.cmake
│   │   ├── Makefile2
│   │   ├── TargetDirectories.txt
│   │   ├── app.dir
│   │   │   ├── CXX.includecache
│   │   │   ├── DependInfo.cmake
│   │   │   ├── build.make
│   │   │   ├── cmake_clean.cmake
│   │   │   ├── depend.internal
│   │   │   ├── depend.make
│   │   │   ├── flags.make
│   │   │   ├── link.txt
│   │   │   ├── main.cpp.o
│   │   │   └── progress.make
│   │   ├── cmake.check_cache
│   │   ├── feature_tests.bin
│   │   ├── feature_tests.c
│   │   ├── feature_tests.cxx
│   │   └── progress.marks
│   ├── Makefile
│   ├── app
│   └── cmake_install.cmake
└── main.cpp

9 directories, 36 files


$cd ~/script-sketch/cpp/00003-cpp-テスト
$ll ./app/build/app
-rwxr-xr-x. 1 kuraine kuraine 17320  5月  4 12:20 ./app/build/app*
$./app/build/app
Hello, world!
```
