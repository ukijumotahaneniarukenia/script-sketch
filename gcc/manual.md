# インストール手順

http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/

makeは3分ぐらいかかる。

```
$curl -LO http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-7.5.0/gcc-7.5.0.tar.gz
$tar xvf gcc-7.5.0.tar.gz
$cd gcc-7.5.0
$./contrib/download_prerequisites
./contrib/download_prerequisites: line 58: type: wget: not found
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: .; Unknown error
100 2327k  100 2327k    0     0   554k      0  0:00:04  0:00:04 --:--:--  610k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: .; Unknown error
100 1249k  100 1249k    0     0   388k      0  0:00:03  0:00:03 --:--:--  563k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: .; Unknown error
100  654k  100  654k    0     0   223k      0  0:00:02  0:00:02 --:--:--  294k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: .; Unknown error
100 1588k  100 1588k    0     0   330k      0  0:00:04  0:00:04 --:--:--  380k
gmp-6.1.0.tar.bz2: OK
mpfr-3.1.4.tar.bz2: OK
mpc-1.0.3.tar.gz: OK
isl-0.16.1.tar.bz2: OK
All prerequisites downloaded successfully.
$./configure --enable-languages=c,c++ --prefix=/usr/local --disable-bootstrap --disable-multilib
$make -j12
$sudo make -j12 install
$gcc --version
gcc (GCC) 7.5.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```
