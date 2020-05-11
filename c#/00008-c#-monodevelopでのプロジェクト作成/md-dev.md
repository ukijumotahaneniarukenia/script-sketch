monoコマンド等も梱包されている

```
#オール・インワン
bash centos-7-6-18-10-install-monodevelop-X-X-X.sh
```

monodevelope起動方法

```
$monodevelop 1>$HOME/launch-monodevelop.log 2>&1 &
```

プロジェクト作成後

```
$find
.
./app
./app/nnn
./app/nnn/Program.cs
./app/nnn/obj
./app/nnn/obj/x86
./app/nnn/obj/x86/Debug
./app/nnn/obj/x86/Debug/nnn.csprojAssemblyReference.cache
./app/nnn/bin
./app/nnn/bin/Debug
./app/nnn/nnn.csproj.user
./app/nnn/nnn.csproj
./app/nnn/Properties
./app/nnn/Properties/AssemblyInfo.cs
./app/app.sln
./app/.vs
./app/.vs/app
./app/.vs/app/xs
./app/.vs/app/xs/UserPrefs.xml
```

コンパイル後

```
$find
.
./app
./app/nnn
./app/nnn/Program.cs
./app/nnn/obj
./app/nnn/obj/x86
./app/nnn/obj/x86/Debug
./app/nnn/obj/x86/Debug/nnn.csproj.FileListAbsolute.txt
./app/nnn/obj/x86/Debug/nnn.csprojAssemblyReference.cache
./app/nnn/obj/x86/Debug/nnn.pdb
./app/nnn/obj/x86/Debug/nnn.exe
./app/nnn/bin
./app/nnn/bin/Debug
./app/nnn/bin/Debug/nnn.pdb
./app/nnn/bin/Debug/nnn.exe
./app/nnn/nnn.csproj.user
./app/nnn/nnn.csproj
./app/nnn/Properties
./app/nnn/Properties/AssemblyInfo.cs
./app/app.sln
./app/.vs
./app/.vs/app
./app/.vs/app/xs
./app/.vs/app/xs/UserPrefs.xml


$ls -l ./app/nnn/bin/Debug/nnn.exe
-rw-rw-r--. 1 kuraine kuraine 4608  5月 11 22:09 ./app/nnn/bin/Debug/nnn.exe

```

実行

```
$mono ./app/nnn/bin/Debug/nnn.exe
Hello World!
```
