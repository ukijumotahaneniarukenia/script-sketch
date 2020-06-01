環境など

```

$ cat /etc/os-release
NAME="Ubuntu"
VERSION="18.04.4 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.4 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
doc-ubuntu-18-04-aws_workspaces-vscode (root)  22:48:28  build  (master)  uname -r
3.10.0-1062.el7.x86_64


$ cmake --version
cmake version 3.10.2

CMake suite maintained and supported by Kitware (kitware.com/cmake).


$ gcc --version
gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


$ g++ --version
g++ (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

```


```
cd /usr/local/src

apt install -y cmake

git clone --recursive https://github.com/cquery-project/cquery.git

cd cquery

git submodule update --init

mkdir build

cd build/

cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=release -DCMAKE_EXPORT_COMPILE_COMMANDS=YES

cmake --build .

cmake --build . --target install

cd /usr/local/src/cquery/build/release/bin

$ls -lh
total 95M
-rwxr-xr-x. 1 root root 3.5M  6月  1 22:42 cquery
---x--x--x. 1 root root  90M  9月 19  2018 cquery-clang
---x--x--x. 1 root root 2.1M  9月 19  2018 cquery-clang-format


mv cquery cquery-clang cquery-clang-format /usr/local/bin/
```

バージョン確認など

```
$ cquery --version
cquery: error while loading shared libraries: libclang.so.7: cannot open shared object file: No such file or directory

$ cquery-clang --version

clang version 7.0.0 (tags/RELEASE_700/final)
Target: x86_64-unknown-linux-gnu
Thread model: posix
InstalledDir: /usr/local/bin

$ cquery-clang-format --version
clang-format version 7.0.0 (tags/RELEASE_700/final)

```

足りないライブラリファイルをパスに通す

```

$ echo $LD_LIBRARY_PATH
/usr/local/lib

$ export LD_LIBRARY_PATH=/usr/local/src/cquery/build/clang+llvm-7.0.0-x86_64-linux-gnu-ubuntu-14.04/lib:$LD_LIBRARY_PATH


$ echo $LD_LIBRARY_PATH
/usr/local/src/cquery/build/clang+llvm-7.0.0-x86_64-linux-gnu-ubuntu-14.04/lib:/usr/local/lib/


$ cquery --version
Content-Length: 152

{"jsonrpc":"2.0","method":"$cquery/progress","params":{"indexRequestCount":0,"doIdMapCount":0,"onIdMappedCount":0,"onIndexedCount":0,"activeThreads":0}}



^C
Loguru caught a signal: SIGINT
Stack trace:
9       0x5654f3805e6a _start + 42
8       0x7ff61a9b5b97 __libc_start_main + 231
7       0x5654f37fabf2 main + 3618
6       0x5654f387e933 LanguageServerMain(std::string const&) + 115
5       0x5654f387dcbd RunQueryDbThread(std::string const&) + 2381
4       0x7ff61b6118bc std::condition_variable::wait(std::unique_lock<std::mutex>&) + 12
3       0x7ff61ad929f3 pthread_cond_wait + 579
2       0x7ff61ad97890 /lib/x86_64-linux-gnu/libpthread.so.0(+0x12890) [0x7ff61ad97890]
1       0x7ff61d5a384b /usr/local/src/cquery/build/clang+llvm-7.0.0-x86_64-linux-gnu-ubuntu-14.04/lib/libclang.so.7(+0x1abc84b) [0x7ff61d5a384b]
0       0x7ff61ad97727 raise + 199
(   7.533s) [querydb      ]                  :0     | Signal: SIGINT


```
