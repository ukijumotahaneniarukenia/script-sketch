- REF
  - https://www.atmarkit.co.jp/fdotnet/dotnettips/681stdin/stdin.html

  - https://docs.microsoft.com/ja-jp/dotnet/core/tutorials/cli-create-console-app

- MAN

```
mkdir -p 00001-c#-ハローワールド

cd 00001-c#-ハローワールド

echo '/bin/* /obj/*' | xargs -n1 >.gitignore

dotnet new console

dotnet run

$ file ./bin/Debug/netcoreapp3.1/00001-c#-ハローワールド
./bin/Debug/netcoreapp3.1/00001-c#-ハローワールド: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=6644aee648567ad2d7c248a017cbc94d6f5dda3c, stripped
```

事前に実行バイナリファイルを作成しておくパタン

```
$cd ~/script-sketch/c#/00003-c#-コマンドライン引数
$dotnet build
.NET Core 向け Microsoft (R) Build Engine バージョン 16.5.0+d4cbfca49
Copyright (C) Microsoft Corporation.All rights reserved.

  /home/kuraine/script-sketch/c#/00003-c#-コマンドライン引数/00003-c#-コマンドライン引数.csproj の復元が 24.35 ms で完了しました。
  00003-c#-コマンドライン引数 -> /home/kuraine/script-sketch/c#/00003-c#-コマンドライン引数/bin/Debug/netcoreapp3.1/00003-c#-コマンドライン引数.dll

ビルドに成功しました。
    0 個の警告
    0 エラー

経過時間 00:00:00.57
$./bin/*/*/00003-c#-コマンドライン引数 {a..j}
a
b
c
d
e
f
g
h
i
j
```

100万個のコマンドライン引数はエラーやったので、xargs経由で渡す

```
$cd ~/script-sketch/c#/00003-c#-コマンドライン引数
$./bin/*/*/00003-c#-コマンドライン引数 $(seq 1000000)
bash: ./bin/Debug/netcoreapp3.1/00003-c#-コマンドライン引数: Argument list too long

$seq 1000000 | xargs ./bin/*/*/00003-c#-コマンドライン引数

$seq 100 | xargs -t -n10 ./bin/*/*/00003-c#-コマンドライン引数 1>/dev/null
./bin/Debug/netcoreapp3.1/00003-c#-コマンドライン引数 1 2 3 4 5 6 7 8 9 10
./bin/Debug/netcoreapp3.1/00003-c#-コマンドライン引数 11 12 13 14 15 16 17 18 19 20
./bin/Debug/netcoreapp3.1/00003-c#-コマンドライン引数 21 22 23 24 25 26 27 28 29 30
./bin/Debug/netcoreapp3.1/00003-c#-コマンドライン引数 31 32 33 34 35 36 37 38 39 40
./bin/Debug/netcoreapp3.1/00003-c#-コマンドライン引数 41 42 43 44 45 46 47 48 49 50
./bin/Debug/netcoreapp3.1/00003-c#-コマンドライン引数 51 52 53 54 55 56 57 58 59 60
./bin/Debug/netcoreapp3.1/00003-c#-コマンドライン引数 61 62 63 64 65 66 67 68 69 70
./bin/Debug/netcoreapp3.1/00003-c#-コマンドライン引数 71 72 73 74 75 76 77 78 79 80
./bin/Debug/netcoreapp3.1/00003-c#-コマンドライン引数 81 82 83 84 85 86 87 88 89 90
./bin/Debug/netcoreapp3.1/00003-c#-コマンドライン引数 91 92 93 94 95 96 97 98 99 100
```


コマンドライン上で実行できるcsharpらしい

jshellみたい

```
$ sudo apt install mono-csharp-shell

$ csharp -e '1+1'
```
