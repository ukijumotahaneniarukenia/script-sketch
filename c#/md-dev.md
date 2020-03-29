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
