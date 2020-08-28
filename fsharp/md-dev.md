プロジェクト作成後、改行コードをLFに統一してコミット

dotnet系だとこうなるぽい

```
$ nkf -Lu --overwrite Program.fs

$ nkf -Lu --overwrite app.fsproj
```




```
$ mkdir -p 00001-fsharp-はじめのいっぽ


$ cd 00001-fsharp-はじめのいっぽ

$ echo '/.ionide' | xargs -n1 >>.gitignore

$ mkdir -p app


$ cd app


$ echo '/obj/* /bin/*' | xargs -n1 >>.gitignore


$ dotnet new console -lang "F#"


$ dotnet run
Hello World from F#!
```
