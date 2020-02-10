# インストール手順

clispはroswellで代替しよう。

うまくいかず。glibc周りで断念。

```
$sudo yum list installed | grep glibc
glibc.x86_64                        2.17-292.el7                        @base   
glibc-common.x86_64                 2.17-292.el7                        @base   
glibc-devel.x86_64                  2.17-292.el7                        @base   
glibc-headers.x86_64                2.17-292.el7                        @base   
$curl -LO https://ftp.gnu.org/gnu/glibc/glibc-2.28.tar.gz
$tar xvf glibc-2.28.tar.gz
$mkdir build
$mkdir -p ~/nnn/glibc-2.28
$cd build
#必要なコマンドいんすこ
$make --version
GNU Make 4.2.1
$gcc --version
gcc (GCC) 7.5.0
$sudo yum install -y bison
$sudo yum list | grep bison
bison.x86_64                              3.0.4-2.el7                    @base  
bison-devel.i686                          3.0.4-2.el7                    base   
bison-devel.x86_64                        3.0.4-2.el7                    base   
bison-runtime.x86_64                      3.0.4-2.el7                    base   
$sudo yum install -y texinfo
$sudo yum list | grep texinfo
texinfo.x86_64                            5.1-5.el7                      @base  
texinfo-tex.x86_64                        5.1-5.el7                      @base  
$sudo yum install -y binutils
$sudo yum list | grep binutils
binutils.x86_64                           2.27-41.base.el7_7.1           @updates
binutils-devel.x86_64                     2.27-41.base.el7_7.1           updates
$awk --version
GNU Awk 5.0.0, API: 2.0
$perl --version
This is perl 5, version 30, subversion 0 (v5.30.0) built for x86_64-linux-thread
$sed --version
/usr/local/bin/sed (GNU sed) 4.7
$make -j12
$sudo make -j12 install
```
