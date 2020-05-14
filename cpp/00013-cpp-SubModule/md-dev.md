```
$tree
.
├── CMakeLists.txt
├── include
│   ├── good-morning.hpp
│   └── hello.hpp
├── md-dev.md
├── src
│   ├── CMakeLists.txt
│   ├── good-morning.cpp
│   └── hello.cpp
└── test
    ├── CMakeLists.txt
    └── main.cpp

3 directories, 9 files
$find
.
./include
./include/hello.hpp
./include/good-morning.hpp
./.gitignore
./CMakeLists.txt
./test
./test/CMakeLists.txt
./test/main.cpp
./md-dev.md
./src
./src/hello.cpp
./src/CMakeLists.txt
./src/good-morning.cpp
```

```
$rm -rf build/
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
-- Build files have been written to: /home/kuraine/script-sketch/cpp/00013-cpp-SubModule/build
$make
Scanning dependencies of target greetings
[ 20%] Building CXX object src/CMakeFiles/greetings.dir/hello.cpp.o
[ 40%] Building CXX object src/CMakeFiles/greetings.dir/good-morning.cpp.o
[ 60%] Linking CXX shared library libgreetings.so
[ 60%] Built target greetings
Scanning dependencies of target a.out
[ 80%] Building CXX object test/CMakeFiles/a.out.dir/main.cpp.o
[100%] Linking CXX executable a.out
[100%] Built target a.out
$ll
total 44
drwxr-xr-x. 5 kuraine kuraine  4096  5月 14 22:57 ./
drwxr-xr-x. 6 kuraine kuraine  4096  5月 14 22:56 ../
-rw-r--r--. 1 kuraine kuraine 11762  5月 14 22:57 CMakeCache.txt
drwxr-xr-x. 4 kuraine kuraine  4096  5月 14 22:57 CMakeFiles/
-rw-r--r--. 1 kuraine kuraine  4681  5月 14 22:57 Makefile
-rw-r--r--. 1 kuraine kuraine  1842  5月 14 22:57 cmake_install.cmake
drwxr-xr-x. 3 kuraine kuraine  4096  5月 14 22:57 src/
drwxr-xr-x. 3 kuraine kuraine  4096  5月 14 22:57 test/
$find
.
./CMakeFiles
./CMakeFiles/progress.marks
./CMakeFiles/TargetDirectories.txt
./CMakeFiles/CMakeOutput.log
./CMakeFiles/feature_tests.cxx
./CMakeFiles/3.13.4
./CMakeFiles/3.13.4/CompilerIdCXX
./CMakeFiles/3.13.4/CompilerIdCXX/CMakeCXXCompilerId.cpp
./CMakeFiles/3.13.4/CompilerIdCXX/a.out
./CMakeFiles/3.13.4/CompilerIdCXX/tmp
./CMakeFiles/3.13.4/CMakeCXXCompiler.cmake
./CMakeFiles/3.13.4/CMakeSystem.cmake
./CMakeFiles/3.13.4/CMakeDetermineCompilerABI_CXX.bin
./CMakeFiles/Makefile.cmake
./CMakeFiles/CMakeTmp
./CMakeFiles/Makefile2
./CMakeFiles/cmake.check_cache
./CMakeFiles/feature_tests.bin
./CMakeFiles/CMakeDirectoryInformation.cmake
./Makefile
./cmake_install.cmake
./CMakeCache.txt
./test
./test/CMakeFiles
./test/CMakeFiles/progress.marks
./test/CMakeFiles/a.out.dir
./test/CMakeFiles/a.out.dir/cmake_clean.cmake
./test/CMakeFiles/a.out.dir/depend.internal
./test/CMakeFiles/a.out.dir/build.make
./test/CMakeFiles/a.out.dir/progress.make
./test/CMakeFiles/a.out.dir/CXX.includecache
./test/CMakeFiles/a.out.dir/flags.make
./test/CMakeFiles/a.out.dir/depend.make
./test/CMakeFiles/a.out.dir/main.cpp.o
./test/CMakeFiles/a.out.dir/DependInfo.cmake
./test/CMakeFiles/a.out.dir/link.txt
./test/CMakeFiles/CMakeDirectoryInformation.cmake
./test/Makefile
./test/cmake_install.cmake
./test/a.out
./src
./src/CMakeFiles
./src/CMakeFiles/progress.marks
./src/CMakeFiles/greetings.dir
./src/CMakeFiles/greetings.dir/cmake_clean.cmake
./src/CMakeFiles/greetings.dir/depend.internal
./src/CMakeFiles/greetings.dir/build.make
./src/CMakeFiles/greetings.dir/progress.make
./src/CMakeFiles/greetings.dir/hello.cpp.o
./src/CMakeFiles/greetings.dir/CXX.includecache
./src/CMakeFiles/greetings.dir/good-morning.cpp.o
./src/CMakeFiles/greetings.dir/flags.make
./src/CMakeFiles/greetings.dir/depend.make
./src/CMakeFiles/greetings.dir/DependInfo.cmake
./src/CMakeFiles/greetings.dir/link.txt
./src/CMakeFiles/CMakeDirectoryInformation.cmake
./src/Makefile
./src/libgreetings.so
./src/cmake_install.cmake

$find -name "*out"
./CMakeFiles/3.13.4/CompilerIdCXX/a.out
./test/a.out

$ll ./test/a.out
-rwxr-xr-x. 1 kuraine kuraine 16696  5月 14 22:57 ./test/a.out*

$./test/a.out
Good Morning
```
