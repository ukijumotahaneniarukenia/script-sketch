- rustクロスコンパイル環境がハンディ

```
実行ユーザー単位で環境できる

doc-ubuntu-18-04-vim (kuraine)  01:33:18  ~   curl https://sh.rustup.rs -sSf | sh
info: downloading installer

Welcome to Rust!

This will download and install the official compiler for the Rust
programming language, and its package manager, Cargo.

Rustup metadata and toolchains will be installed into the Rustup
home directory, located at:

  /home/kuraine/.rustup

This can be modified with the RUSTUP_HOME environment variable.

The Cargo home directory located at:

  /home/kuraine/.cargo

This can be modified with the CARGO_HOME environment variable.

The cargo, rustc, rustup and other commands will be added to
Cargo's bin directory, located at:

  /home/kuraine/.cargo/bin

This path will then be added to your PATH environment variable by
modifying the profile file located at:

  /home/kuraine/.profile

You can uninstall at any time with rustup self uninstall and
these changes will be reverted.

Current installation options:


   default host triple: x86_64-unknown-linux-gnu
     default toolchain: stable (default)
               profile: default
  modify PATH variable: yes

1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
>1

info: profile set to 'default'
info: default host triple is x86_64-unknown-linux-gnu
info: syncing channel updates for 'stable-x86_64-unknown-linux-gnu'
info: latest update on 2020-06-18, rust version 1.44.1 (c7087fe00 2020-06-17)
info: downloading component 'cargo'
info: downloading component 'clippy'
info: downloading component 'rust-docs'
info: downloading component 'rust-std'
 17.7 MiB /  17.7 MiB (100 %)  16.8 MiB/s in  1s ETA:  0s
info: downloading component 'rustc'
 60.3 MiB /  60.3 MiB (100 %)  19.4 MiB/s in  2s ETA:  0s
info: downloading component 'rustfmt'
info: installing component 'cargo'
info: Defaulting to 500.0 MiB unpack ram
info: installing component 'clippy'
info: installing component 'rust-docs'
info: installing component 'rust-std'
info: installing component 'rustc'
 60.3 MiB /  60.3 MiB (100 %)  17.5 MiB/s in  3s ETA:  0s
info: installing component 'rustfmt'
info: default toolchain set to 'stable'

  stable installed - rustc 1.44.1 (c7087fe00 2020-06-17)


Rust is installed now. Great!

To get started you need Cargo's bin directory ($HOME/.cargo/bin) in your PATH
environment variable. Next time you log in this will be done
automatically.

To configure your current shell run source $HOME/.cargo/env


パス追加
export RUST_HOME=$HOME/.cargo
export PATH=$RUST_HOME/bin:$PATH



プロジェクトフォルダ作成
doc-ubuntu-18-04-vim (kuraine)  01:36:06  ~   cargo new hello_world
     Created binary (application) `hello_world` package
doc-ubuntu-18-04-vim (kuraine)  01:36:11  ~   tree hello_world
hello_world
├── Cargo.toml
└── src
    └── main.rs

1 directory, 2 files



doc-ubuntu-18-04-vim (kuraine)  01:36:53  ~   find hello_world -type f | grep -v '.git'
hello_world/Cargo.toml
hello_world/src/main.rs


doc-ubuntu-18-04-vim (kuraine)  01:38:27  hello_world  (master)  cargo build
   Compiling hello_world v0.1.0 (/home/kuraine/hello_world)
    Finished dev [unoptimized + debuginfo] target(s) in 0.16s
doc-ubuntu-18-04-vim (kuraine)  01:38:29  hello_world  (master)  tree
.
├── Cargo.lock
├── Cargo.toml
├── src
│   └── main.rs
└── target
    └── debug
        ├── build
        ├── deps
        │   ├── hello_world-0ce65a5d44ef4dcb
        │   └── hello_world-0ce65a5d44ef4dcb.d
        ├── examples
        ├── hello_world
        ├── hello_world.d
        └── incremental
            └── hello_world-1rizr6gmvxf2o
                ├── s-fp88800ico-lgvsda-2098r8zfudqq4
                │   ├── 16pak66ffq9qu5wl.o
                │   ├── 2sxlgiicin4z58vd.o
                │   ├── 3un8k3ymvh8968iq.o
                │   ├── 440alun37iwlmul8.o
                │   ├── 7z1wzy9ty3wuqfs.o
                │   ├── dep-graph.bin
                │   ├── query-cache.bin
                │   ├── w2xmrmdo5ik9pob.o
                │   └── work-products.bin
                └── s-fp88800ico-lgvsda.lock

9 directories, 17 files


doc-ubuntu-18-04-vim (kuraine)  01:38:32  hello_world  (master)  file ./target/debug/hello_world
./target/debug/hello_world: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=d1539f3acb19165cd5c7f2cc6c3304dba924237c, with debug_info, not stripped



doc-ubuntu-18-04-vim (kuraine)  01:39:10  hello_world  (master)  ./target/debug/hello_world
Hello, world!
doc-ubuntu-18-04-vim (kuraine)  01:39:27  hello_world  (master)  ls -lh ./target/debug/hello_world
-rwxr-xr-x 2 kuraine kuraine 2.8M  7月 13 01:38 ./target/debug/hello_world

クロスコンパイル用のコマンドをインストール

doc-ubuntu-18-04-vim (kuraine)  01:40:13  hello_world  (master)  cargo install cross
    Updating crates.io index
  Downloaded cross v0.2.1
  Downloaded 1 crate (175.1 KB) in 1.43s
  Installing cross v0.2.1
  Downloaded error-chain v0.12.2
  Downloaded semver-parser v0.7.0
  Downloaded backtrace v0.3.50
  Downloaded addr2line v0.13.0
  Downloaded miniz_oxide v0.4.0
  Downloaded home v0.5.3
  Downloaded void v1.0.2
  Downloaded cfg-if v0.1.10
  Downloaded nix v0.15.0
  Downloaded serde_json v1.0.56
  Downloaded itoa v0.4.6
  Downloaded bitflags v1.2.1
  Downloaded gimli v0.22.0
  Downloaded rustc-demangle v0.1.16
  Downloaded rustc_version v0.2.3
  Downloaded serde v1.0.114
  Downloaded version_check v0.9.2
  Downloaded toml v0.5.6
  Downloaded which v3.1.1
  Downloaded atty v0.2.14
  Downloaded semver v0.9.0
  Downloaded lazy_static v1.4.0
  Downloaded ryu v1.0.5
  Downloaded adler v0.2.3
  Downloaded libc v0.2.72
  Downloaded shell-escape v0.1.5
  Downloaded object v0.20.0
  Downloaded 27 crates (2.2 MB) in 3.06s
   Compiling libc v0.2.72
   Compiling serde v1.0.114
   Compiling adler v0.2.3
   Compiling version_check v0.9.2
   Compiling ryu v1.0.5
   Compiling cfg-if v0.1.10
   Compiling gimli v0.22.0
   Compiling bitflags v1.2.1
   Compiling semver-parser v0.7.0
   Compiling rustc-demangle v0.1.16
   Compiling object v0.20.0
   Compiling nix v0.15.0
   Compiling serde_json v1.0.56
   Compiling void v1.0.2
   Compiling itoa v0.4.6
   Compiling cross v0.2.1
   Compiling lazy_static v1.4.0
   Compiling shell-escape v0.1.5
   Compiling home v0.5.3
   Compiling miniz_oxide v0.4.0
   Compiling semver v0.9.0
   Compiling rustc_version v0.2.3
   Compiling error-chain v0.12.2
   Compiling which v3.1.1
   Compiling atty v0.2.14
   Compiling addr2line v0.13.0
   Compiling backtrace v0.3.50
   Compiling toml v0.5.6
    Finished release [optimized] target(s) in 42.82s
  Installing /home/kuraine/.cargo/bin/cross
   Installed package `cross v0.2.1` (executable `cross`)



doc-ubuntu-18-04-vim (kuraine)  01:40:59  hello_world  (master)  which cross 
/home/kuraine/.cargo/bin/cross
doc-ubuntu-18-04-vim (kuraine)  01:41:34  hello_world  (master)  cross --version
cross 0.2.1
info: downloading component 'rust-src'
info: installing component 'rust-src'
info: Defaulting to 500.0 MiB unpack ram
cargo 1.44.1 (88ba85757 2020-06-11)


クロスコンパイル用の環境確認

ホストに環境を用意しないといけない。

doc-ubuntu-18-04-vim (kuraine)  01:41:43  hello_world  (master)  which rustup
/home/kuraine/.cargo/bin/rustup
doc-ubuntu-18-04-vim (kuraine)  01:42:05  hello_world  (master)  rustup --version
rustup 1.22.1 (b01adbbc3 2020-07-08)
doc-ubuntu-18-04-vim (kuraine)  01:42:16  hello_world  (master)  which rustc
/home/kuraine/.cargo/bin/rustc
doc-ubuntu-18-04-vim (kuraine)  01:42:26  hello_world  (master)  rustc --version
rustc 1.44.1 (c7087fe00 2020-06-17)


doc-ubuntu-18-04-vim (kuraine)  01:42:34  hello_world  (master)  rustc --print target-list
aarch64-fuchsia
aarch64-linux-android
aarch64-pc-windows-msvc
aarch64-unknown-cloudabi
aarch64-unknown-freebsd
aarch64-unknown-hermit
aarch64-unknown-linux-gnu
aarch64-unknown-linux-musl
aarch64-unknown-netbsd
aarch64-unknown-none
aarch64-unknown-none-softfloat
aarch64-unknown-openbsd
aarch64-unknown-redox
aarch64-uwp-windows-msvc
aarch64-wrs-vxworks
arm-linux-androideabi
arm-unknown-linux-gnueabi
arm-unknown-linux-gnueabihf
arm-unknown-linux-musleabi
arm-unknown-linux-musleabihf
armebv7r-none-eabi
armebv7r-none-eabihf
armv4t-unknown-linux-gnueabi
armv5te-unknown-linux-gnueabi
armv5te-unknown-linux-musleabi
armv6-unknown-freebsd
armv6-unknown-netbsd-eabihf
armv7-linux-androideabi
armv7-unknown-cloudabi-eabihf
armv7-unknown-freebsd
armv7-unknown-linux-gnueabi
armv7-unknown-linux-gnueabihf
armv7-unknown-linux-musleabi
armv7-unknown-linux-musleabihf
armv7-unknown-netbsd-eabihf
armv7-wrs-vxworks-eabihf
armv7a-none-eabi
armv7a-none-eabihf
armv7r-none-eabi
armv7r-none-eabihf
asmjs-unknown-emscripten
hexagon-unknown-linux-musl
i586-pc-windows-msvc
i586-unknown-linux-gnu
i586-unknown-linux-musl
i686-apple-darwin
i686-linux-android
i686-pc-windows-gnu
i686-pc-windows-msvc
i686-unknown-cloudabi
i686-unknown-freebsd
i686-unknown-haiku
i686-unknown-linux-gnu
i686-unknown-linux-musl
i686-unknown-netbsd
i686-unknown-openbsd
i686-unknown-uefi
i686-uwp-windows-gnu
i686-uwp-windows-msvc
i686-wrs-vxworks
mips-unknown-linux-gnu
mips-unknown-linux-musl
mips-unknown-linux-uclibc
mips64-unknown-linux-gnuabi64
mips64-unknown-linux-muslabi64
mips64el-unknown-linux-gnuabi64
mips64el-unknown-linux-muslabi64
mipsel-unknown-linux-gnu
mipsel-unknown-linux-musl
mipsel-unknown-linux-uclibc
mipsisa32r6-unknown-linux-gnu
mipsisa32r6el-unknown-linux-gnu
mipsisa64r6-unknown-linux-gnuabi64
mipsisa64r6el-unknown-linux-gnuabi64
msp430-none-elf
nvptx64-nvidia-cuda
powerpc-unknown-linux-gnu
powerpc-unknown-linux-gnuspe
powerpc-unknown-linux-musl
powerpc-unknown-netbsd
powerpc-wrs-vxworks
powerpc-wrs-vxworks-spe
powerpc64-unknown-freebsd
powerpc64-unknown-linux-gnu
powerpc64-unknown-linux-musl
powerpc64-wrs-vxworks
powerpc64le-unknown-linux-gnu
powerpc64le-unknown-linux-musl
riscv32i-unknown-none-elf
riscv32imac-unknown-none-elf
riscv32imc-unknown-none-elf
riscv64gc-unknown-linux-gnu
riscv64gc-unknown-none-elf
riscv64imac-unknown-none-elf
s390x-unknown-linux-gnu
sparc-unknown-linux-gnu
sparc64-unknown-linux-gnu
sparc64-unknown-netbsd
sparc64-unknown-openbsd
sparcv9-sun-solaris
thumbv6m-none-eabi
thumbv7a-pc-windows-msvc
thumbv7em-none-eabi
thumbv7em-none-eabihf
thumbv7m-none-eabi
thumbv7neon-linux-androideabi
thumbv7neon-unknown-linux-gnueabihf
thumbv7neon-unknown-linux-musleabihf
thumbv8m.base-none-eabi
thumbv8m.main-none-eabi
thumbv8m.main-none-eabihf
wasm32-unknown-emscripten
wasm32-unknown-unknown
wasm32-wasi
x86_64-apple-darwin
x86_64-fortanix-unknown-sgx
x86_64-fuchsia
x86_64-linux-android
x86_64-linux-kernel
x86_64-pc-solaris
x86_64-pc-windows-gnu
x86_64-pc-windows-msvc
x86_64-rumprun-netbsd
x86_64-sun-solaris
x86_64-unknown-cloudabi
x86_64-unknown-dragonfly
x86_64-unknown-freebsd
x86_64-unknown-haiku
x86_64-unknown-hermit
x86_64-unknown-hermit-kernel
x86_64-unknown-illumos
x86_64-unknown-l4re-uclibc
x86_64-unknown-linux-gnu
x86_64-unknown-linux-gnux32
x86_64-unknown-linux-musl
x86_64-unknown-netbsd
x86_64-unknown-openbsd
x86_64-unknown-redox
x86_64-unknown-uefi
x86_64-uwp-windows-gnu
x86_64-uwp-windows-msvc
x86_64-wrs-vxworks


doc-ubuntu-18-04-vim (kuraine)  01:42:55  hello_world  (master)  rustup target list
aarch64-apple-ios
aarch64-fuchsia
aarch64-linux-android
aarch64-pc-windows-msvc
aarch64-unknown-linux-gnu
aarch64-unknown-linux-musl
aarch64-unknown-none
aarch64-unknown-none-softfloat
arm-linux-androideabi
arm-unknown-linux-gnueabi
arm-unknown-linux-gnueabihf
arm-unknown-linux-musleabi
arm-unknown-linux-musleabihf
armebv7r-none-eabi
armebv7r-none-eabihf
armv5te-unknown-linux-gnueabi
armv5te-unknown-linux-musleabi
armv7-linux-androideabi
armv7-unknown-linux-gnueabi
armv7-unknown-linux-gnueabihf
armv7-unknown-linux-musleabi
armv7-unknown-linux-musleabihf
armv7a-none-eabi
armv7r-none-eabi
armv7r-none-eabihf
asmjs-unknown-emscripten
i586-pc-windows-msvc
i586-unknown-linux-gnu
i586-unknown-linux-musl
i686-linux-android
i686-pc-windows-gnu
i686-pc-windows-msvc
i686-unknown-freebsd
i686-unknown-linux-gnu
i686-unknown-linux-musl
mips-unknown-linux-gnu
mips-unknown-linux-musl
mips64-unknown-linux-gnuabi64
mips64-unknown-linux-muslabi64
mips64el-unknown-linux-gnuabi64
mips64el-unknown-linux-muslabi64
mipsel-unknown-linux-gnu
mipsel-unknown-linux-musl
nvptx64-nvidia-cuda
powerpc-unknown-linux-gnu
powerpc64-unknown-linux-gnu
powerpc64le-unknown-linux-gnu
riscv32i-unknown-none-elf
riscv32imac-unknown-none-elf
riscv32imc-unknown-none-elf
riscv64gc-unknown-linux-gnu
riscv64gc-unknown-none-elf
riscv64imac-unknown-none-elf
s390x-unknown-linux-gnu
sparc64-unknown-linux-gnu
sparcv9-sun-solaris
thumbv6m-none-eabi
thumbv7em-none-eabi
thumbv7em-none-eabihf
thumbv7m-none-eabi
thumbv7neon-linux-androideabi
thumbv7neon-unknown-linux-gnueabihf
thumbv8m.base-none-eabi
thumbv8m.main-none-eabi
thumbv8m.main-none-eabihf
wasm32-unknown-emscripten
wasm32-unknown-unknown
wasm32-wasi
x86_64-apple-darwin
x86_64-apple-ios
x86_64-fortanix-unknown-sgx
x86_64-fuchsia
x86_64-linux-android
x86_64-pc-windows-gnu
x86_64-pc-windows-msvc
x86_64-rumprun-netbsd
x86_64-sun-solaris
x86_64-unknown-cloudabi
x86_64-unknown-freebsd
x86_64-unknown-linux-gnu (installed)
x86_64-unknown-linux-gnux32
x86_64-unknown-linux-musl
x86_64-unknown-netbsd
x86_64-unknown-redox


この３つはACK-SYNしたい
x86_64-apple-darwin
x86_64-pc-windows-gnu
x86_64-unknown-linux-gnu


docker環境が必要

doc-ubuntu-18-04-vim (kuraine)  01:44:16  hello_world  (master)  cross build --target x86_64-pc-windows-gnu x86_64-apple-darwin x86_64-unknown-linux-gnu
info: downloading component 'rust-std' for 'x86_64-pc-windows-gnu'
info: installing component 'rust-std' for 'x86_64-pc-windows-gnu'
info: Defaulting to 500.0 MiB unpack ram
error: no container engine found; install docker or podman
note: run with `RUST_BACKTRACE=1` for a backtrace


dockerホストで実行 --targetの引数は単一のみ

aine-MS-7B98 (aine)  01:48:36  hello_world  (master)  cross build --target x86_64-pc-windows-gnu
info: downloading component 'rust-std' for 'x86_64-pc-windows-gnu'
info: installing component 'rust-std' for 'x86_64-pc-windows-gnu'
info: Defaulting to 500.0 MiB unpack ram
Unable to find image 'rustembedded/cross:x86_64-pc-windows-gnu-0.2.1' locally
x86_64-pc-windows-gnu-0.2.1: Pulling from rustembedded/cross
d7c3167c320d: Pull complete 
131f805ec7fd: Pull complete 
322ed380e680: Pull complete 
6ac240b13098: Pull complete 
d7bf0568dabc: Pull complete 
981aecd3bf48: Pull complete 
6697c741376d: Pull complete 
cc1566a6c043: Pull complete 
7e4da0436841: Pull complete 
6a8d255df934: Pull complete 
8928e758bdd0: Pull complete 
f5186e3ba9b6: Pull complete 
8f352a8fa374: Pull complete 
4ad1b6ba757d: Pull complete 
Digest: sha256:5b195dffc3876e155bb95aac347be1440d1cd5bc85fb46c7d9b3feeed2b16d8c
Status: Downloaded newer image for rustembedded/cross:x86_64-pc-windows-gnu-0.2.1
   Compiling hello_world v0.1.0 (/project)
    Finished dev [unoptimized + debuginfo] target(s) in 0.17s


aine-MS-7B98 (aine)  01:49:31  hello_world  (master)  find | grep exe
./target/x86_64-pc-windows-gnu/debug/hello_world.exe
./target/x86_64-pc-windows-gnu/debug/deps/hello_world-574f4484d1c747c6.exe
aine-MS-7B98 (aine)  01:49:46  hello_world  (master)  file ./target/x86_64-pc-windows-gnu/debug/hello_world.exe
./target/x86_64-pc-windows-gnu/debug/hello_world.exe: PE32+ executable (console) x86-64, for MS Windows
aine-MS-7B98 (aine)  01:49:52  hello_world  (master)  file ./target/x86_64-pc-windows-gnu/debug/deps/hello_world-574f4484d1c747c6.exe
./target/x86_64-pc-windows-gnu/debug/deps/hello_world-574f4484d1c747c6.exe: PE32+ executable (console) x86-64, for MS Windows


aine-MS-7B98 (aine)  01:50:31  hello_world  (master)  cross build --target x86_64-unknown-linux-gnu
info: downloading component 'rust-src'
info: installing component 'rust-src'
info: Defaulting to 500.0 MiB unpack ram
Unable to find image 'rustembedded/cross:x86_64-unknown-linux-gnu-0.2.1' locally
x86_64-unknown-linux-gnu-0.2.1: Pulling from rustembedded/cross
b5e173e44934: Pull complete 
29047100b040: Pull complete 
15743a713c2a: Pull complete 
4b6bc9e29877: Pull complete 
1123a44ff793: Pull complete 
b4abb5865867: Pull complete 
9fdbb524b1c4: Pull complete 
2350ee5e55fc: Pull complete 
968cdcbf9025: Pull complete 
a35b78509a07: Pull complete 
0b2212848106: Pull complete 
1e800e929340: Pull complete 
03e3688a1c75: Pull complete 
39fbe813311d: Pull complete 
ca9b9e19e390: Pull complete 
b870dbe38f53: Pull complete 
a87354bc0877: Pull complete 
Digest: sha256:9f368a726a8ba08559451cd64160f7d2b47f6180ad024a46e31d29cc85dd81ff
Status: Downloaded newer image for rustembedded/cross:x86_64-unknown-linux-gnu-0.2.1
   Compiling hello_world v0.1.0 (/project)
    Finished dev [unoptimized + debuginfo] target(s) in 0.16s


aine-MS-7B98 (aine)  01:52:08  hello_world  (master)  file ./target/x86_64-unknown-linux-gnu/debug/deps/hello_world-a543216c3e5cd55d
./target/x86_64-unknown-linux-gnu/debug/deps/hello_world-a543216c3e5cd55d: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=cca7d4d25735e451b41a7c9330971698528b6560, with debug_info, not stripped
aine-MS-7B98 (aine)  01:52:33  hello_world  (master)   ./target/x86_64-unknown-linux-gnu/debug/deps/hello_world-a543216c3e5cd55d
Hello, world!



マックは環境を別に用意

aine-MS-7B98 (aine)  01:50:25  hello_world  (master)  cross build --target x86_64-apple-darwin 
   Compiling hello_world v0.1.0 (/home/aine/hello_world)
error[E0463]: can't find crate for `std`
  |
  = note: the `x86_64-apple-darwin` target may not be installed

error: aborting due to previous error

For more information about this error, try `rustc --explain E0463`.
error: could not compile `hello_world`.

To learn more, run the command again with --verbose.


aine-MS-7B98 (aine)  01:52:37  hello_world  (master)  rustup target list | grep app
aarch64-apple-ios
x86_64-apple-darwin
x86_64-apple-ios


rustup target add x86_64-apple-darwin

対象にクロスコンパイル対象に追加

aine-MS-7B98 (aine)  01:54:04  hello_world  (master)  rustup target add x86_64-apple-darwin
info: downloading component 'rust-std' for 'x86_64-apple-darwin'
info: installing component 'rust-std' for 'x86_64-apple-darwin'
info: Defaulting to 500.0 MiB unpack ram


aine-MS-7B98 (aine)  01:55:31  hello_world  (master)  cross build --target x86_64-apple-darwin
   Compiling hello_world v0.1.0 (/home/aine/hello_world)
error: linking with `cc` failed: exit code: 1
  |
  = note: "cc" "-m64" "-L" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib" "/home/aine/hello_world/target/x86_64-apple-darwin/debug/deps/hello_world.206s2jz8p5d3fo3f.rcgu.o" "/home/aine/hello_world/target/x86_64-apple-darwin/debug/deps/hello_world.23vvmurbvxut05nk.rcgu.o" "/home/aine/hello_world/target/x86_64-apple-darwin/debug/deps/hello_world.2ue597cdofhgxtlz.rcgu.o" "/home/aine/hello_world/target/x86_64-apple-darwin/debug/deps/hello_world.3lsrtqnyc44zwxmh.rcgu.o" "/home/aine/hello_world/target/x86_64-apple-darwin/debug/deps/hello_world.4xltfe557x4pxt9m.rcgu.o" "/home/aine/hello_world/target/x86_64-apple-darwin/debug/deps/hello_world.c74uhskdddqcvzx.rcgu.o" "-o" "/home/aine/hello_world/target/x86_64-apple-darwin/debug/deps/hello_world" "/home/aine/hello_world/target/x86_64-apple-darwin/debug/deps/hello_world.1kywxxhoidrnq5gw.rcgu.o" "-Wl,-dead_strip" "-nodefaultlibs" "-L" "/home/aine/hello_world/target/x86_64-apple-darwin/debug/deps" "-L" "/home/aine/hello_world/target/debug/deps" "-L" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/libstd-16788ade64e57bde.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/libpanic_unwind-9a8cd3f9e5f3d70b.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/libhashbrown-93e6ab273db3373f.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/librustc_std_workspace_alloc-8e4140dd8e9c5c52.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/libbacktrace-acdb60af30603380.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/libbacktrace_sys-e69cb554c5473e43.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/librustc_demangle-0e6e71d015f0d832.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/libunwind-148cae18a66ff11e.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/libcfg_if-c1c8042a25d04cae.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/liblibc-0a0bcb94df31e54d.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/liballoc-51b0291ce3aee382.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/librustc_std_workspace_core-37e506490f0b8800.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/libcore-caa802c98f89c09c.rlib" "/home/aine/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-apple-darwin/lib/libcompiler_builtins-7cb9c01c7b80892c.rlib" "-lSystem" "-lresolv" "-lc" "-lm"
  = note: /home/aine/hello_world/target/x86_64-apple-darwin/debug/deps/hello_world.206s2jz8p5d3fo3f.rcgu.o: file not recognized: file format not recognized
          collect2: error: ld returned 1 exit status
          

error: aborting due to previous error

error: could not compile `hello_world`.

To learn more, run the command again with --verbose.


これ試す
https://wapl.es/rust/2019/02/17/rust-cross-compile-linux-to-macos.html


docker in dockerなど試してみる価値はこれを機にありそう



apt install  -y   clang     gcc     g++     zlib1g-dev     libmpc-dev     libmpfr-dev     libgmp-dev


aine-MS-7B98 (aine)  02:08:07  hello_world  (master)  rustup target add x86_64-apple-darwin
info: component 'rust-std' for target 'x86_64-apple-darwin' is up to date


cd /usr/local/src


git clone https://github.com/tpoechtrager/osxcross

cd osxcross

aine-MS-7B98 (root)  02:09:22  osxcross  (master)  wget -nc https://s3.dockerproject.org/darwin/v2/MacOSX10.10.sdk.tar.xz
--2020-07-13 02:09:34--  https://s3.dockerproject.org/darwin/v2/MacOSX10.10.sdk.tar.xz
s3.dockerproject.org (s3.dockerproject.org) をDNSに問いあわせています... 143.204.83.95, 143.204.83.52, 143.204.83.18, ...
s3.dockerproject.org (s3.dockerproject.org)|143.204.83.95|:443 に接続しています... 接続しました。
HTTP による接続要求を送信しました、応答を待っています... 200 OK
長さ: 32936212 (31M) [application/x-xz]
`MacOSX10.10.sdk.tar.xz' に保存中

MacOSX10.10.sdk.tar.xz                          100%[=====================================================================================================>]  31.41M  10.4MB/s    時間 3.0s  

2020-07-13 02:09:38 (10.4 MB/s) - `MacOSX10.10.sdk.tar.xz' へ保存完了 [32936212/32936212]



mv MacOSX10.10.sdk.tar.xz tarballs/

UNATTENDED=yes OSX_VERSION_MIN=10.7 ./build.sh
Required dependency 'cmake' is not installed



apt  install cmake
パッケージリストを読み込んでいます... 完了
依存関係ツリーを作成しています                
状態情報を読み取っています... 完了
以下のパッケージが自動でインストールされましたが、もう必要とされていません:
  libllvm9
これを削除するには 'apt autoremove' を利用してください。
以下の追加パッケージがインストールされます:
  cmake-data libjsoncpp1 librhash0
提案パッケージ:
  cmake-doc ninja-build
以下のパッケージが新たにインストールされます:
  cmake cmake-data libjsoncpp1 librhash0
アップグレード: 0 個、新規インストール: 4 個、削除: 0 個、保留: 21 個。
5,470 kB のアーカイブを取得する必要があります。
この操作後に追加で 28.3 MB のディスク容量が消費されます。
続行しますか? [Y/n] y
取得:1 http://jp.archive.ubuntu.com/ubuntu focal/main amd64 cmake-data all 3.16.3-1ubuntu1 [1,612 kB]
取得:2 http://jp.archive.ubuntu.com/ubuntu focal/main amd64 libjsoncpp1 amd64 1.7.4-3.1ubuntu2 [75.6 kB]
取得:3 http://jp.archive.ubuntu.com/ubuntu focal/main amd64 librhash0 amd64 1.3.9-1 [113 kB]
取得:4 http://jp.archive.ubuntu.com/ubuntu focal/main amd64 cmake amd64 3.16.3-1ubuntu1 [3,669 kB]
5,470 kB を 1秒 で取得しました (9,760 kB/s)
以前に未選択のパッケージ cmake-data を選択しています。
(データベースを読み込んでいます ... 現在 239508 個のファイルとディレクトリがインストールされています。)
.../cmake-data_3.16.3-1ubuntu1_all.deb を展開する準備をしています ...
cmake-data (3.16.3-1ubuntu1) を展開しています...
以前に未選択のパッケージ libjsoncpp1:amd64 を選択しています。
.../libjsoncpp1_1.7.4-3.1ubuntu2_amd64.deb を展開する準備をしています ...
libjsoncpp1:amd64 (1.7.4-3.1ubuntu2) を展開しています...
以前に未選択のパッケージ librhash0:amd64 を選択しています。
.../librhash0_1.3.9-1_amd64.deb を展開する準備をしています ...
librhash0:amd64 (1.3.9-1) を展開しています...
以前に未選択のパッケージ cmake を選択しています。
.../cmake_3.16.3-1ubuntu1_amd64.deb を展開する準備をしています ...
cmake (3.16.3-1ubuntu1) を展開しています...
librhash0:amd64 (1.3.9-1) を設定しています ...
cmake-data (3.16.3-1ubuntu1) を設定しています ...
libjsoncpp1:amd64 (1.7.4-3.1ubuntu2) を設定しています ...
cmake (3.16.3-1ubuntu1) を設定しています ...
man-db (2.9.1-1) のトリガを処理しています ...
libc-bin (2.31-0ubuntu9) のトリガを処理しています ...


１回め

aine-MS-7B98 (root)  02:11:33  osxcross  (master)  UNATTENDED=yes OSX_VERSION_MIN=10.7 ./build.sh

configure: error: Cannot configure without xml2-config

exiting with abnormal exit code (1)
run 'OCDEBUG=1 ./build.sh' to enable debug messages

２回め


aine-MS-7B98 (root)  02:11:33  osxcross  (master)  apt install libxml2-dev
パッケージリストを読み込んでいます... 完了
依存関係ツリーを作成しています                
状態情報を読み取っています... 完了
以下のパッケージが自動でインストールされましたが、もう必要とされていません:
  libllvm9
これを削除するには 'apt autoremove' を利用してください。
以下のパッケージが新たにインストールされます:
  libxml2-dev
アップグレード: 0 個、新規インストール: 1 個、削除: 0 個、保留: 21 個。
737 kB のアーカイブを取得する必要があります。
この操作後に追加で 3,496 kB のディスク容量が消費されます。
取得:1 http://jp.archive.ubuntu.com/ubuntu focal/main amd64 libxml2-dev amd64 2.9.10+dfsg-5 [737 kB]
737 kB を 0秒 で取得しました (5,488 kB/s)
以前に未選択のパッケージ libxml2-dev:amd64 を選択しています。
(データベースを読み込んでいます ... 現在 242292 個のファイルとディレクトリがインストールされています。)
.../libxml2-dev_2.9.10+dfsg-5_amd64.deb を展開する準備をしています ...
libxml2-dev:amd64 (2.9.10+dfsg-5) を展開しています...
libxml2-dev:amd64 (2.9.10+dfsg-5) を設定しています ...
man-db (2.9.1-1) のトリガを処理しています ...


うまくいった

Do not forget to add

/usr/local/src/osxcross/target/bin

to your PATH variable.

All done! Now you can use o32-clang(++) and o64-clang(++) like a normal compiler.

Example usage:

Example 1: CC=o32-clang ./configure --host=i386-apple-darwin14
Example 2: CC=i386-apple-darwin14-clang ./configure --host=i386-apple-darwin14
Example 3: o64-clang -Wall test.c -o test
Example 4: x86_64-apple-darwin14-strip -x test


パスなどを通す
export OSXCROSS_HOME=/usr/local/src/osxcross/target
export PATH=$OSXCROSS_HOME/bin:$PATH

aine-MS-7B98 (aine)  02:16:33  hello_world  (master)  pwd
/home/aine/hello_world



プロジェクトディレクトリ単位の設定ファイルに以下を追記

#ここから
[target.x86_64-apple-darwin]
linker = "x86_64-apple-darwin14-clang"
ar = "x86_64-apple-darwin14-ar"
#ここまで

aine-MS-7B98 (aine)  02:27:50  hello_world  (master)  mkdir .cargo
aine-MS-7B98 (aine)  02:28:00  hello_world  (master)  touch .cargo/config
aine-MS-7B98 (aine)  02:28:10  hello_world  (master)  vi .cargo/config
aine-MS-7B98 (aine)  02:28:29  hello_world  (master)  
aine-MS-7B98 (aine)  02:28:29  hello_world  (master)  
aine-MS-7B98 (aine)  02:28:29  hello_world  (master)  cat .cargo/config
[target.x86_64-apple-darwin]
linker = "x86_64-apple-darwin14-clang"
ar = "x86_64-apple-darwin14-ar"




cargo build --target x86_64-apple-darwin


aine-MS-7B98 (aine)  02:28:31  hello_world  (master)  cargo build --target x86_64-apple-darwin
warning: unused manifest key: target.x86_64-apple-darwin.ar
warning: unused manifest key: target.x86_64-apple-darwin.linker
   Compiling hello_world v0.1.0 (/home/aine/hello_world)
    Finished dev [unoptimized + debuginfo] target(s) in 0.11s


aine-MS-7B98 (aine)  02:31:45  hello_world  (master)  find -type f | xargs file | grep -P 'exe|shared' | grep -v '\.git' | cut -d: -f1
./target/x86_64-unknown-linux-gnu/debug/deps/hello_world-a543216c3e5cd55d
./target/x86_64-unknown-linux-gnu/debug/hello_world
./target/x86_64-apple-darwin/debug/deps/hello_world
./target/x86_64-apple-darwin/debug/hello_world
./target/x86_64-pc-windows-gnu/debug/hello_world.exe
./target/x86_64-pc-windows-gnu/debug/deps/hello_world-574f4484d1c747c6.exe


aine-MS-7B98 (aine)  02:31:47  hello_world  (master)  file ./target/x86_64-apple-darwin/debug/deps/hello_world
./target/x86_64-apple-darwin/debug/deps/hello_world: Mach-O 64-bit x86_64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|PIE|HAS_TLV_DESCRIPTORS>


dockerインdockerに挑戦する
```
