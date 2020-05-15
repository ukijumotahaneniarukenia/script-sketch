```

$cmake --version
cmake version 3.13.4

CMake suite maintained and supported by Kitware (kitware.com/cmake).


$gcc --version
gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



```


```
$cd /tmp

$git clone https://github.com/SRombauts/SQLiteCpp_Example.git

$ls
 SQLiteCpp_Example  'VSCode Crashes'   net-export   pulse-Jn85tgnxBFvK   vscode-typescript9999

$cd SQLiteCpp_Example/

$ls
CMakeLists.txt  LICENSE.txt  README.md  SQLiteCpp  build.bat  build.sh  src

$git submodule init
Submodule 'SQLiteCpp' (https://github.com/SRombauts/SQLiteCpp.git) registered for path 'SQLiteCpp'

$git submodule update
Cloning into '/tmp/SQLiteCpp_Example/SQLiteCpp'...
Submodule path 'SQLiteCpp': checked out '801ed9106d63c49bd8aa0941937431a9a45c04e9'

$ls -l
total 60
drwxr-xr-x.  6 kuraine kuraine 4096  5月 14 23:16 ./
drwxrwxrwt.  1 root    root    4096  5月 14 23:16 ../
drwxr-xr-x.  9 kuraine kuraine 4096  5月 14 23:16 .git/
drwxr-xr-x.  3 kuraine kuraine 4096  5月 14 23:16 .github/
-rw-r--r--.  1 kuraine kuraine  266  5月 14 23:16 .gitignore
-rw-r--r--.  1 kuraine kuraine   92  5月 14 23:16 .gitmodules
-rw-r--r--.  1 kuraine kuraine 1141  5月 14 23:16 CMakeLists.txt
-rw-r--r--.  1 kuraine kuraine 1141  5月 14 23:16 LICENSE.txt
-rw-r--r--.  1 kuraine kuraine 2261  5月 14 23:16 README.md
drwxr-xr-x. 10 kuraine kuraine 4096  5月 14 23:17 SQLiteCpp/
-rw-r--r--.  1 kuraine kuraine  522  5月 14 23:16 build.bat
-rwxr-xr-x.  1 kuraine kuraine  412  5月 14 23:16 build.sh*
drwxr-xr-x.  2 kuraine kuraine 4096  5月 14 23:16 src/

$mkdir build
$cd build
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
-- CMake version: 3.13.4
-- Project version: 2.99
-- CMAKE_CXX_COMPILER '/bin/c++' 'GNU' '9.2.1'
-- CMAKE_CXX_FLAGS                ' -Wall -Wextra -Wpedantic -Wswitch-enum -Wshadow -Wno-long-long'
-- CMAKE_CXX_FLAGS_RELEASE        '-O3 -DNDEBUG'
-- Compile sqlite3 from source in subdirectory
-- Looking for pthread.h
-- Looking for pthread.h - found
-- Looking for pthread_create
-- Looking for pthread_create - not found
-- Check if compiler accepts -pthread
-- Check if compiler accepts -pthread - yes
-- Found Threads: TRUE
-- SQLITECPP_RUN_CPPLINT OFF
-- SQLITECPP_RUN_CPPCHECK OFF
-- SQLITECPP_RUN_DOXYGEN OFF
-- SQLITECPP_BUILD_EXAMPLES OFF
-- SQLITECPP_BUILD_TESTS OFF
-- Configuring done
-- Generating done
-- Build files have been written to: /tmp/SQLiteCpp_Example/build

$make
Scanning dependencies of target sqlite3
[  9%] Building C object SQLiteCpp/sqlite3/CMakeFiles/sqlite3.dir/sqlite3.c.o
[ 18%] Linking C static library libsqlite3.a
[ 18%] Built target sqlite3
Scanning dependencies of target SQLiteCpp
[ 27%] Building CXX object SQLiteCpp/CMakeFiles/SQLiteCpp.dir/src/Backup.cpp.o
[ 36%] Building CXX object SQLiteCpp/CMakeFiles/SQLiteCpp.dir/src/Column.cpp.o
[ 45%] Building CXX object SQLiteCpp/CMakeFiles/SQLiteCpp.dir/src/Database.cpp.o
[ 54%] Building CXX object SQLiteCpp/CMakeFiles/SQLiteCpp.dir/src/Exception.cpp.o
[ 63%] Building CXX object SQLiteCpp/CMakeFiles/SQLiteCpp.dir/src/Statement.cpp.o
[ 72%] Building CXX object SQLiteCpp/CMakeFiles/SQLiteCpp.dir/src/Transaction.cpp.o
[ 81%] Linking CXX static library libSQLiteCpp.a
[ 81%] Built target SQLiteCpp
Scanning dependencies of target SQLiteCpp_Example
[ 90%] Building CXX object CMakeFiles/SQLiteCpp_Example.dir/src/main.cpp.o
[100%] Linking CXX executable SQLiteCpp_Example
[100%] Built target SQLiteCpp_Example

$ls -l
total 1208
drwxr-xr-x. 4 kuraine kuraine    4096  5月 14 23:18 ./
drwxr-xr-x. 7 kuraine kuraine    4096  5月 14 23:17 ../
-rw-r--r--. 1 kuraine kuraine   17985  5月 14 23:17 CMakeCache.txt
drwxr-xr-x. 5 kuraine kuraine    4096  5月 14 23:18 CMakeFiles/
-rw-r--r--. 1 kuraine kuraine    7873  5月 14 23:17 Makefile
drwxr-xr-x. 5 kuraine kuraine    4096  5月 14 23:18 SQLiteCpp/
-rwxr-xr-x. 1 kuraine kuraine 1180912  5月 14 23:18 SQLiteCpp_Example*
-rw-r--r--. 1 kuraine kuraine    1665  5月 14 23:17 cmake_install.cmake

$./SQLiteCpp_Example
SQlite3 version 3.30.1 (3.30.1)
SQliteC++ version 3.00.00
SQLite database file 'test.db3' opened successfully
INSERT INTO test VALUES (NULL, "test")", returned 1
INSERT INTO test VALUES (NULL, "second")", returned 1
UPDATE test SET value="second-updated" WHERE id='2', returned 1
SELECT * FROM test :
row (1, "test")
row (2, "second-updated")
everything ok, quitting
```

この静的ライブラリ(.a)とヘッダファイル(.h)があれば独自のプロジェクトに組み込める


```
$find /tmp/SQLiteCpp_Example | grep -vP '\.git' | grep -P '.*a$'
/tmp/SQLiteCpp_Example/build/SQLiteCpp/sqlite3/libsqlite3.a
/tmp/SQLiteCpp_Example/build/SQLiteCpp/libSQLiteCpp.a


$find /tmp/SQLiteCpp_Example | grep -P '.*\.h$'
/tmp/SQLiteCpp_Example/SQLiteCpp/sqlite3/sqlite3.h
/tmp/SQLiteCpp_Example/SQLiteCpp/include/SQLiteCpp/Transaction.h
/tmp/SQLiteCpp_Example/SQLiteCpp/include/SQLiteCpp/Column.h
/tmp/SQLiteCpp_Example/SQLiteCpp/include/SQLiteCpp/VariadicBind.h
/tmp/SQLiteCpp_Example/SQLiteCpp/include/SQLiteCpp/Database.h
/tmp/SQLiteCpp_Example/SQLiteCpp/include/SQLiteCpp/ExecuteMany.h
/tmp/SQLiteCpp_Example/SQLiteCpp/include/SQLiteCpp/Utils.h
/tmp/SQLiteCpp_Example/SQLiteCpp/include/SQLiteCpp/SQLiteCpp.h
/tmp/SQLiteCpp_Example/SQLiteCpp/include/SQLiteCpp/Exception.h
/tmp/SQLiteCpp_Example/SQLiteCpp/include/SQLiteCpp/Backup.h
/tmp/SQLiteCpp_Example/SQLiteCpp/include/SQLiteCpp/Assertion.h
/tmp/SQLiteCpp_Example/SQLiteCpp/include/SQLiteCpp/Statement.h
```


プロジェクト作成

```
$mkdir wrksp


$mkdir -p wrksp/{src,lib,bin,include}


$touch wrksp/src/main.cpp


$find /tmp/SQLiteCpp_Example | grep -vP '\.git' | grep -P '.*a$' | xargs -I@ bash -c 'mkdir -p ~/wrksp/lib && cp @ ~/wrksp/lib/'


$find /tmp/SQLiteCpp_Example | grep -P '.*\.h$' | grep sqlite3 | xargs -I@ bash -c 'mkdir -p ~/wrksp/include/sqlite3 && cp @ ~/wrksp/include/sqlite3/'


$find /tmp/SQLiteCpp_Example | grep -P '.*\.h$' | grep -v sqlite3 | xargs -I@ bash -c 'mkdir -p ~/wrksp/include/SQLiteCpp && cp @ ~/wrksp/include/SQLiteCpp/'


$tree wrksp/
wrksp/
├── bin
├── include
│   ├── SQLiteCpp
│   │   ├── Assertion.h
│   │   ├── Backup.h
│   │   ├── Column.h
│   │   ├── Database.h
│   │   ├── Exception.h
│   │   ├── ExecuteMany.h
│   │   ├── SQLiteCpp.h
│   │   ├── Statement.h
│   │   ├── Transaction.h
│   │   ├── Utils.h
│   │   └── VariadicBind.h
│   └── sqlite3
│       └── sqlite3.h
├── lib
│   ├── libSQLiteCpp.a
│   └── libsqlite3.a
└── src
    └── main.cpp

6 directories, 15 files



```


```
$g++ src/main.cpp -I/home/kuraine/wrksp/include -L/home/kuraine/wrksp/lib -lSQLiteCpp -lsqlite3 -lpthread -ldl -o bin/main

$tree
.
├── bin
│   └── main
├── include
│   ├── SQLiteCpp
│   │   ├── Assertion.h
│   │   ├── Backup.h
│   │   ├── Column.h
│   │   ├── Database.h
│   │   ├── Exception.h
│   │   ├── ExecuteMany.h
│   │   ├── SQLiteCpp.h
│   │   ├── Statement.h
│   │   ├── Transaction.h
│   │   ├── Utils.h
│   │   └── VariadicBind.h
│   └── sqlite3
│       └── sqlite3.h
├── lib
│   ├── libSQLiteCpp.a
│   └── libsqlite3.a
└── src
    └── main.cpp

7 directories, 17 files


$./bin/main
SQlite3 version 3.30.1 (3.30.1)
SQliteC++ version 3.00.00
SQLite database file 'test.db' opened successfully
INSERT INTO test_tbl VALUES (1, "test")", returned 1
INSERT INTO test_tbl VALUES (2, "second")", returned 1
UPDATE test_tbl SET value="second-updated" WHERE id='2', returned 1
SELECT * FROM test_tbl :
row (1, "test")
row (2, "second-updated")
everything ok, quitting
```


CPUアーキテクチャ

```

$arch
x86_64



```


システム単位のsqlite3ヘッダファイルないしコマンド


```
$sqlite3 --version
bash: sqlite3: command not found


$find / -name "sqlite3.h" 2>/dev/null
/usr/include/sqlite3.h
/home/kuraine/wrksp/include/sqlite3/sqlite3.h
/tmp/SQLiteCpp_Example/SQLiteCpp/sqlite3/sqlite3.h
```


```
$grep VERSION /home/kuraine/wrksp/include/sqlite3/sqlite3.h
#ifdef SQLITE_VERSION
# undef SQLITE_VERSION
#ifdef SQLITE_VERSION_NUMBER
# undef SQLITE_VERSION_NUMBER
** ^(The [SQLITE_VERSION] C preprocessor macro in the sqlite3.h header
** ^(The [SQLITE_VERSION_NUMBER] C preprocessor macro resolves to an integer
** numbers used in [SQLITE_VERSION].)^
** The SQLITE_VERSION_NUMBER for any given release of SQLite will also
#define SQLITE_VERSION        "3.30.1"
#define SQLITE_VERSION_NUMBER 3030001
** These interfaces provide the same information as the [SQLITE_VERSION],
** [SQLITE_VERSION_NUMBER], and [SQLITE_SOURCE_ID] C preprocessor macros
** assert( sqlite3_libversion_number()==SQLITE_VERSION_NUMBER );
** assert( strcmp(sqlite3_libversion(),SQLITE_VERSION)==0 );
** ^The sqlite3_version[] string constant contains the text of [SQLITE_VERSION]
** [SQLITE_VERSION_NUMBER].  ^(The sqlite3_sourceid() function returns 
** <li>[[SQLITE_FCNTL_DATA_VERSION]]
** The [SQLITE_FCNTL_DATA_VERSION] opcode is used to detect changes to
#define SQLITE_FCNTL_DATA_VERSION           35
** [SQLITE_FCNTL_DATA_VERSION] [file control].
** <li> the [SQLITE_FCNTL_DATA_VERSION] [file control]
** The [SQLITE_FCNTL_DATA_VERSION] returns the data version counter
```

静的リンクライブラリないし動的リンクライブラリ

```
$find / -name "*sqlite3*" 2>/dev/null | grep -P '(a|so)(\.[0-9])*$' | grep sqlite
/usr/lib/x86_64-linux-gnu/libsqlite3.so
/usr/lib/x86_64-linux-gnu/libsqlite3.la
/usr/lib/x86_64-linux-gnu/libsqlite3.a
/usr/lib/x86_64-linux-gnu/libsqlite3.so.0
/usr/lib/x86_64-linux-gnu/libsqlite3.so.0.8.6
/usr/lib/python2.7/lib-dynload/_sqlite3.x86_64-linux-gnu.so
/usr/lib/python3.7/lib-dynload/_sqlite3.cpython-37m-x86_64-linux-gnu.so
/usr/local/lib/python3.7/lib-dynload/_sqlite3.cpython-37m-x86_64-linux-gnu.so
/usr/local/src/Python-3.7.4/build/lib.linux-x86_64-3.7/_sqlite3.cpython-37m-x86_64-linux-gnu.so
/home/kuraine/wrksp/lib/libsqlite3.a
/tmp/SQLiteCpp_Example/build/SQLiteCpp/sqlite3/libsqlite3.a
```


g++のライブラリ検索フォルダパス一覧

```
$g++ -print-search-dirs | tr ':' '\n'
install
 /usr/lib/gcc/x86_64-linux-gnu/9/
programs
 =/usr/lib/gcc/x86_64-linux-gnu/9/
/usr/lib/gcc/x86_64-linux-gnu/9/
/usr/lib/gcc/x86_64-linux-gnu/
/usr/lib/gcc/x86_64-linux-gnu/9/
/usr/lib/gcc/x86_64-linux-gnu/
/usr/lib/gcc/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/bin/x86_64-linux-gnu/9/
/usr/lib/gcc/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/bin/x86_64-linux-gnu/
/usr/lib/gcc/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/bin/
libraries
 =/usr/lib/gcc/x86_64-linux-gnu/9/
/usr/lib/gcc/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/lib/x86_64-linux-gnu/9/
/usr/lib/gcc/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/lib/x86_64-linux-gnu/
/usr/lib/gcc/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/lib/../lib/
/usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/9/
/usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/
/usr/lib/gcc/x86_64-linux-gnu/9/../../../../lib/
/lib/x86_64-linux-gnu/9/
/lib/x86_64-linux-gnu/
/lib/../lib/
/usr/lib/x86_64-linux-gnu/9/
/usr/lib/x86_64-linux-gnu/
/usr/lib/../lib/
/usr/lib/gcc/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/lib/
/usr/lib/gcc/x86_64-linux-gnu/9/../../../
/lib/
/usr/lib/
```

プロジェクト固有で使用しているsqlite3.hファイルのバージョン


```
$grep VERSION /usr/include/sqlite3.h
#ifdef SQLITE_VERSION
# undef SQLITE_VERSION
#ifdef SQLITE_VERSION_NUMBER
# undef SQLITE_VERSION_NUMBER
** ^(The [SQLITE_VERSION] C preprocessor macro in the sqlite3.h header
** ^(The [SQLITE_VERSION_NUMBER] C preprocessor macro resolves to an integer
** numbers used in [SQLITE_VERSION].)^
** The SQLITE_VERSION_NUMBER for any given release of SQLite will also
#define SQLITE_VERSION        "3.29.0"
#define SQLITE_VERSION_NUMBER 3029000
** These interfaces provide the same information as the [SQLITE_VERSION],
** [SQLITE_VERSION_NUMBER], and [SQLITE_SOURCE_ID] C preprocessor macros
** assert( sqlite3_libversion_number()==SQLITE_VERSION_NUMBER );
** assert( strcmp(sqlite3_libversion(),SQLITE_VERSION)==0 );
** ^The sqlite3_version[] string constant contains the text of [SQLITE_VERSION]
** [SQLITE_VERSION_NUMBER].  ^(The sqlite3_sourceid() function returns 
** <li>[[SQLITE_FCNTL_DATA_VERSION]]
** The [SQLITE_FCNTL_DATA_VERSION] opcode is used to detect changes to
#define SQLITE_FCNTL_DATA_VERSION           35
** [SQLITE_FCNTL_DATA_VERSION] [file control].
** <li> the [SQLITE_FCNTL_DATA_VERSION] [file control]
** The [SQLITE_FCNTL_DATA_VERSION] returns the data version counter
```
