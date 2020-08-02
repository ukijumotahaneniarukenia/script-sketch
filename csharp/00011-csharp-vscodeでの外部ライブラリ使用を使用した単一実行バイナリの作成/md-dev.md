便利

- https://docs.microsoft.com/en-us/dotnet/core/whats-new/dotnet-core-3-0#readytorun-images

```
--self-containedにするとポータブル
```

ビルドホストはLinux

リナックス環境でビルドできた

引数に指定するアーキテクチャは単一しかだめぽい

```
$ mkdir -p 00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成

$ cd 00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成


$ dotnet add package Microsoft.Xml.SgmlReader --version 1.8.17

$ dotnet add package System.Xml.Linq --version 3.5.21022.801
```

ウィンドウズ

```
$ time echo win-x64 win-x86 win-arm win-arm64 win7-x64 win7-x86 win81-x64 win81-x86 win81-arm win10-x64 win10-x86 win10-arm win10-arm64 | xargs -n1 | xargs -t -I@ dotnet publish -c Release -r @ --self-contained
```

ちらほらビルドこけるのもあるが、主要なのはできるているので、OK

```


real	1m1.906s
user	1m5.250s
sys	0m4.774s
```

```
$ find -type f | grep -P 'exe$' | grep -P $(pwd | ruby -F/ -anle 'puts $F[$F.size-1]') | grep publish | xargs -I@ -t file @
```

```
file ./bin/Release/netcoreapp3.1/win10-arm64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win10-arm64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32+ executable (console), for MS Windows
file ./bin/Release/netcoreapp3.1/win-arm/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win-arm/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32 executable (console) ARMv7 Thumb, for MS Windows
file ./bin/Release/netcoreapp3.1/win-x86/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win-x86/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32 executable (console) Intel 80386, for MS Windows
file ./bin/Release/netcoreapp3.1/win10-x86/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win10-x86/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32 executable (console) Intel 80386, for MS Windows
file ./bin/Release/netcoreapp3.1/win7-x86/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win7-x86/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32 executable (console) Intel 80386, for MS Windows
file ./bin/Release/netcoreapp3.1/win10-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win10-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32+ executable (console) x86-64, for MS Windows
file ./bin/Release/netcoreapp3.1/win-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32+ executable (console) x86-64, for MS Windows
file ./bin/Release/netcoreapp3.1/win10-arm/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win10-arm/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32 executable (console) ARMv7 Thumb, for MS Windows
file ./bin/Release/netcoreapp3.1/win81-arm/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win81-arm/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32 executable (console) ARMv7 Thumb, for MS Windows
file ./bin/Release/netcoreapp3.1/win7-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win7-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32+ executable (console) x86-64, for MS Windows
file ./bin/Release/netcoreapp3.1/win81-x86/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win81-x86/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32 executable (console) Intel 80386, for MS Windows
file ./bin/Release/netcoreapp3.1/win-arm64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win-arm64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32+ executable (console), for MS Windows
file ./bin/Release/netcoreapp3.1/win81-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe
./bin/Release/netcoreapp3.1/win81-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成.exe: PE32+ executable (console) x86-64, for MS Windows
```

マック

```
$ time echo osx-x64 osx.10.10-x64 osx.10.11-x64 osx.10.12-x64 osx.10.13-x64 osx.10.14-x64 | xargs -n1 | xargs -t -I@ dotnet publish -c Release -r @ --self-contained
```

ちらほらビルドこけるのもあるが、主要なのはできるているので、OK

```
real	0m28.795s
user	0m30.404s
sys	0m2.380s
```

```
$ find -type f | grep -vP '.[a-zA-Z]+$' | grep bin | grep publish | xargs -I@ -t file @
```

```
file ./bin/Release/netcoreapp3.1/osx.10.11-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/osx.10.11-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: Mach-O 64-bit x86_64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|WEAK_DEFINES|BINDS_TO_WEAK|PIE|HAS_TLV_DESCRIPTORS>
file ./bin/Release/netcoreapp3.1/linux-arm64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/linux-arm64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, BuildID[sha1]=6a5111355e517b864ffd31e82024b066ab432c59, stripped
file ./bin/Release/netcoreapp3.1/osx-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/osx-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: Mach-O 64-bit x86_64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|WEAK_DEFINES|BINDS_TO_WEAK|PIE|HAS_TLV_DESCRIPTORS>
file ./bin/Release/netcoreapp3.1/rhel.6-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/rhel.6-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.18, BuildID[sha1]=25d185c3edfd44132935d8697f2d95c460b78236, stripped
file ./bin/Release/netcoreapp3.1/linux-arm/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/linux-arm/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3, for GNU/Linux 2.6.32, BuildID[sha1]=8b3cec13fdd785df9cceb15195b048817e517fb1, stripped
file ./bin/Release/netcoreapp3.1/osx.10.12-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/osx.10.12-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: Mach-O 64-bit x86_64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|WEAK_DEFINES|BINDS_TO_WEAK|PIE|HAS_TLV_DESCRIPTORS>
file ./bin/Release/netcoreapp3.1/linux-musl-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/linux-musl-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-musl-x86_64.so.1, BuildID[sha1]=de9f179eb7f4d89b049c9420b8a5ec1680c51a80, stripped
file ./bin/Release/netcoreapp3.1/linux-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/linux-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=6644aee648567ad2d7c248a017cbc94d6f5dda3c, stripped
file ./bin/Release/netcoreapp3.1/osx.10.13-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/osx.10.13-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: Mach-O 64-bit x86_64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|WEAK_DEFINES|BINDS_TO_WEAK|PIE|HAS_TLV_DESCRIPTORS>
file ./bin/Release/netcoreapp3.1/rhel-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/rhel-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=6644aee648567ad2d7c248a017cbc94d6f5dda3c, stripped
file ./bin/Release/netcoreapp3.1/osx.10.10-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/osx.10.10-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: Mach-O 64-bit x86_64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|WEAK_DEFINES|BINDS_TO_WEAK|PIE|HAS_TLV_DESCRIPTORS>
file ./bin/Release/netcoreapp3.1/osx.10.14-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/osx.10.14-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: Mach-O 64-bit x86_64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|WEAK_DEFINES|BINDS_TO_WEAK|PIE|HAS_TLV_DESCRIPTORS>
```

リナックス

tizenはだめだった

```
$ time echo linux-x64 linux-musl-x64 linux-arm linux-arm64 rhel-x64 rhel.6-x64 tizen tizen.4.0.0 tizen.5.0.0 | xargs -n1 | xargs -t -I@ dotnet publish -c Release -r @ --self-contained
```

ちらほらビルドこけるのもあるが、主要なのはできるているので、OK

```
real	0m49.740s
user	0m51.329s
sys	0m4.132s

```


```
$ find -type f | grep -vP '.[a-zA-Z]+$' | grep bin | grep publish | grep -v osx | xargs -I@ -t file @
```

```
file ./bin/Release/netcoreapp3.1/linux-arm64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/linux-arm64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, BuildID[sha1]=6a5111355e517b864ffd31e82024b066ab432c59, stripped
file ./bin/Release/netcoreapp3.1/rhel.6-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/rhel.6-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.18, BuildID[sha1]=25d185c3edfd44132935d8697f2d95c460b78236, stripped
file ./bin/Release/netcoreapp3.1/linux-arm/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/linux-arm/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3, for GNU/Linux 2.6.32, BuildID[sha1]=8b3cec13fdd785df9cceb15195b048817e517fb1, stripped
file ./bin/Release/netcoreapp3.1/linux-musl-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/linux-musl-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-musl-x86_64.so.1, BuildID[sha1]=de9f179eb7f4d89b049c9420b8a5ec1680c51a80, stripped
file ./bin/Release/netcoreapp3.1/linux-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/linux-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=6644aee648567ad2d7c248a017cbc94d6f5dda3c, stripped
file ./bin/Release/netcoreapp3.1/rhel-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
./bin/Release/netcoreapp3.1/rhel-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=6644aee648567ad2d7c248a017cbc94d6f5dda3c, stripped
```

ポータビリティ

べんり

```
$ ls -lh ./bin/Release/netcoreapp3.1/linux-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成
-rwxr-xr-x 1 aine aine 53M  8月  2 20:33 ./bin/Release/netcoreapp3.1/linux-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成

$ cp ./bin/Release/netcoreapp3.1/linux-x64/publish/00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成 ~


$ cd ~

$ ./00011-csharp-vscodeでの外部ライブラリ使用を使用した単一実行バイナリの作成


```
