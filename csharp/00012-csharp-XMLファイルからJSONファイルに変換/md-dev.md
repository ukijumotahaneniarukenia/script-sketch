```
$ mkdir -p 00012-csharp-XMLファイルからJSONファイルに変換

$ cd 00012-csharp-XMLファイルからJSONファイルに変換


#このディレクトリ名が実行ファイル名になる
$ mkdir -p xml2json

$ cd xml2json

$ echo '/bin/* /obj/*' | xargs -n1 >.gitignore


$ dotnet new console
```

monodevelopで使用するライブラリを使用したモック作成してバージョン決めた後、vscodeに移植


monodevelopのpackage.configにある内容をインストール

```
<PackageReference Include="Newtonsoft.Json" version="12.0.3"/>
<PackageReference Include="System.Xml.XDocument" version="4.3.0"/>
```

$ dotnet add package Newtonsoft.Json --version 12.0.3


$ dotnet add package System.Xml.XDocument --version 4.3.0

monodevelopで書いたコードをvscodeのエディタにコピー

csprojファイルの編集


```
<PublishReadyToRun>false</PublishReadyToRun>はtrueのほうが良さげだが、ビルドコケるので、false。
```

```
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp3.1</TargetFramework>
    <RootNamespace>_00012_csharp_XMLファイルからJSONファイルに変換</RootNamespace>
    <PublishSingleFile>true</PublishSingleFile>
    <PublishTrimmed>true</PublishTrimmed>
    <PublishReadyToRun>false</PublishReadyToRun>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Newtonsoft.Json" Version="12.0.3" />
    <PackageReference Include="System.Xml.XDocument" Version="4.3.0" />
  </ItemGroup>

</Project>
```

ビルド

```
$ time echo linux-x64 osx.10.14-x64 win10-x64 | xargs -n1 | xargs -t -I@ dotnet publish -c Release -r @ --self-contained
```

バイナリフォーマット確認

```
$ find -type f | grep -P xml2json | grep Release| grep publish |teip -Gog '(?<!\.[a-zA-Z]+)$|exe$' -- awk '{print $1,1}' | grep 1$| awk '$0=$1' |xargs file
./bin/Release/netcoreapp3.1/win10-x64/publish/xml2json.exe: PE32+ executable (console) x86-64, for MS Windows
./bin/Release/netcoreapp3.1/linux-x64/publish/xml2json:     ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=6644aee648567ad2d7c248a017cbc94d6f5dda3c, stripped
./bin/Release/netcoreapp3.1/osx.10.14-x64/publish/xml2json: Mach-O 64-bit x86_64 executable, flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|WEAK_DEFINES|BINDS_TO_WEAK|PIE|HAS_TLV_DESCRIPTORS>
```

サイズ

```
$ find -type f | grep -P xml2json | grep Release| grep publish |teip -Gog '(?<!\.[a-zA-Z]+)$|exe$' -- awk '{print $1,1}' | grep 1$| awk '$0=$1' |xargs ls -lh
-rwxr-xr-x 1 aine aine 44M  8月  9 20:02 ./bin/Release/netcoreapp3.1/linux-x64/publish/xml2json
-rwxr-xr-x 1 aine aine 40M  8月  9 20:02 ./bin/Release/netcoreapp3.1/osx.10.14-x64/publish/xml2json
-rwxr-xr-x 1 aine aine 36M  8月  9 20:02 ./bin/Release/netcoreapp3.1/win10-x64/publish/xml2json.exe
```

ポータビリティ

ビルドホストがlinuxなのでlinuxのバイナリで確認

```
$ find -type f | grep -P xml2json | grep Release| grep publish |teip -Gog '(?<!\.[a-zA-Z]+)$|exe$' -- awk '{print $1,1}' | grep 1$| awk '$0=$1' | grep linux | xargs -I@ cp @ $HOME/



$ cd $HOME

$ ./xml2json test.xml test.json

$ echo  test.xml test.json|./xml2json
```
