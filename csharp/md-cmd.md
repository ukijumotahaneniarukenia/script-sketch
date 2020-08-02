- クラス名をディレクトリ名に統一

IN

```
grep namespace -r $HOME/script-sketch/csharp | ruby -F: -anle 'p "_"+$F[0].split(/\//)[5].gsub(/-/,"_"),$F[1].split(" ")[1],$F[0]'|xargs -n3|awk '{print "sed -i \x27s;"$2";"$1";\x27 "$3}'
```

OUT

```
sed -i 's;_00004_c__reduce;_00004_csharp_reduce;' /home/aine/script-sketch/csharp/00004-csharp-reduce/Program.cs
sed -i 's;_00006_c__標準入力;_00006_csharp_標準入力;' /home/aine/script-sketch/csharp/00006-csharp-標準入力/Program.cs
sed -i 's;nnn;_00008_csharp_monodevelopでのプロジェクト作成;' /home/aine/script-sketch/csharp/00008-csharp-monodevelopでのプロジェクト作成/app/nnn/Program.cs
sed -i 's;_00002_c__パイプ経由引数;_00002_csharp_パイプ経由引数;' /home/aine/script-sketch/csharp/00002-csharp-パイプ経由引数/Program.cs
sed -i 's;_00007_c__実行ファイル名の取得;_00007_csharp_実行ファイル名の取得;' /home/aine/script-sketch/csharp/00007-csharp-実行ファイル名の取得/Program.cs
sed -i 's;_00003_c__コマンドライン引数;_00003_csharp_コマンドライン引数;' /home/aine/script-sketch/csharp/00003-csharp-コマンドライン引数/Program.cs
sed -i 's;_00001_c__ハローワールド;_00001_csharp_ハローワールド;' /home/aine/script-sketch/csharp/00001-csharp-ハローワールド/Program.cs
sed -i 's;_00009_csharp_monodevelopでの外部ライブラリ使用プロジェクト作成;_00009_csharp_monodevelopでの外部ライブラリ使用プロジェクト作成;' /home/aine/script-sketch/csharp/00009-csharp-monodevelopでの外部ライブラリ使用プロジェクト作成/app/nnn/Program.cs
sed -i 's;_00005_c__range;_00005_csharp_range;' /home/aine/script-sketch/csharp/00005-csharp-range/Program.cs
```
