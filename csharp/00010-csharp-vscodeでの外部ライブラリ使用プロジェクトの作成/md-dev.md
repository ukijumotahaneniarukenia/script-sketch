- パッケージの検索はここで

  - https://www.nuget.org/packages/


csharpべんり

usingの候補が出ないところはまだ、monodevelopをたよるか

```
$ cd 00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成

$ dotnet add package Microsoft.Xml.SgmlReader --version 1.8.17

$ dotnet add package System.Xml.Linq --version 3.5.21022.801

$ dotnet build
.NET Core 向け Microsoft (R) Build Engine バージョン 16.6.0+5ff7b0c9e
Copyright (C) Microsoft Corporation.All rights reserved.

  復元対象のプロジェクトを決定しています...
/home/aine/script-sketch/csharp/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成.csproj : warning NU1701: パッケージ 'System.Xml.Linq 3.5.21022.801' はプロジェクトのターゲット フレームワーク '.NETCoreApp,Version=v3.1' ではなく '.NETFramework,Version=v4.6.1, .NETFramework,Version=v4.6.2, .NETFramework,Version=v4.7, .NETFramework,Version=v4.7.1, .NETFramework,Version=v4.7.2, .NETFramework,Version=v4.8' を使用して復元されました。このパッケージは、使用しているプロジェクトとの完全な互換性がない可能性があります。
  復元対象のすべてのプロジェクトは最新です。
/home/aine/script-sketch/csharp/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成.csproj : warning NU1701: パッケージ 'System.Xml.Linq 3.5.21022.801' はプロジェクトのターゲット フレームワーク '.NETCoreApp,Version=v3.1' ではなく '.NETFramework,Version=v4.6.1, .NETFramework,Version=v4.6.2, .NETFramework,Version=v4.7, .NETFramework,Version=v4.7.1, .NETFramework,Version=v4.7.2, .NETFramework,Version=v4.8' を使用して復元されました。このパッケージは、使用しているプロジェクトとの完全な互換性がない可能性があります。
/usr/share/dotnet/sdk/3.1.302/Microsoft.Common.CurrentVersion.targets(2081,5): warning MSB3246: 解決されたファイルには、無効なイメージが含まれているか、メタデータが存在しないか、またはアクセスできません。アセンブリ ファイル '/home/aine/.nuget/packages/microsoft.xml.sgmlreader/1.8.17/lib/netcoreapp3.1/SgmlReader.exe' を開くことができませんでした -- PE イメージには管理されたメタデータが含まれていません。 [/home/aine/script-sketch/csharp/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成.csproj]
  00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成 -> /home/aine/script-sketch/csharp/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成/bin/Debug/netcoreapp3.1/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成.dll

ビルドに成功しました。

/home/aine/script-sketch/csharp/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成.csproj : warning NU1701: パッケージ 'System.Xml.Linq 3.5.21022.801' はプロジェクトのターゲット フレームワーク '.NETCoreApp,Version=v3.1' ではなく '.NETFramework,Version=v4.6.1, .NETFramework,Version=v4.6.2, .NETFramework,Version=v4.7, .NETFramework,Version=v4.7.1, .NETFramework,Version=v4.7.2, .NETFramework,Version=v4.8' を使用して復元されました。このパッケージは、使用しているプロジェクトとの完全な互換性がない可能性があります。
/home/aine/script-sketch/csharp/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成.csproj : warning NU1701: パッケージ 'System.Xml.Linq 3.5.21022.801' はプロジェクトのターゲット フレームワーク '.NETCoreApp,Version=v3.1' ではなく '.NETFramework,Version=v4.6.1, .NETFramework,Version=v4.6.2, .NETFramework,Version=v4.7, .NETFramework,Version=v4.7.1, .NETFramework,Version=v4.7.2, .NETFramework,Version=v4.8' を使用して復元されました。このパッケージは、使用しているプロジェクトとの完全な互換性がない可能性があります。
/usr/share/dotnet/sdk/3.1.302/Microsoft.Common.CurrentVersion.targets(2081,5): warning MSB3246: 解決されたファイルには、無効なイメージが含まれているか、メタデータが存在しないか、またはアクセスできません。アセンブリ ファイル '/home/aine/.nuget/packages/microsoft.xml.sgmlreader/1.8.17/lib/netcoreapp3.1/SgmlReader.exe' を開くことができませんでした -- PE イメージには管理されたメタデータが含まれていません。 [/home/aine/script-sketch/csharp/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成.csproj]
    3 個の警告
    0 エラー

経過時間 00:00:01.38

$ file ./bin/Debug/netcoreapp3.1/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成 
./bin/Debug/netcoreapp3.1/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=6644aee648567ad2d7c248a017cbc94d6f5dda3c, stripped

うごかせた

$ ./bin/Debug/netcoreapp3.1/00010-csharp-vscodeでの外部ライブラリ使用プロジェクトの作成
```
