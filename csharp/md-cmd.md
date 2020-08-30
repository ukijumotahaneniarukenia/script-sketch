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

- ワンライナー（非実用的）

PRE

```
apt install mono-csharp-shell
```


IN

```
$ echo '𝓘𝓷 𝓽𝓱𝓮 𝓼𝓮𝓬𝓸𝓷𝓭 𝔂𝓮𝓪𝓻 𝓸𝓯 𝓓𝓪𝓻𝓲𝓾𝓼 𝓽𝓱𝓮 𝓴𝓲𝓷𝓰' | xargs -n1 | xargs -n3
𝓘𝓷 𝓽𝓱𝓮 𝓼𝓮𝓬𝓸𝓷𝓭
𝔂𝓮𝓪𝓻 𝓸𝓯 𝓓𝓪𝓻𝓲𝓾𝓼
𝓽𝓱𝓮 𝓴𝓲𝓷𝓰
```


CMD

```
$ echo '𝓘𝓷 𝓽𝓱𝓮 𝓼𝓮𝓬𝓸𝓷𝓭 𝔂𝓮𝓪𝓻 𝓸𝓯 𝓓𝓪𝓻𝓲𝓾𝓼 𝓽𝓱𝓮 𝓴𝓲𝓷𝓰' | xargs -n1 | xargs -n3| csharp -e 'var m = new Dictionary<int, List<string>>();var l="";var n=1;while((l=Console.ReadLine()) != null){m.Add(n++,l.Split(" ").ToList());};foreach(var k in m.Keys){Console.WriteLine("{0}:{1}",k,String.Join(",",m[k]));};'
```


OUT

```
1:𝓘𝓷,𝓽𝓱𝓮,𝓼𝓮𝓬𝓸𝓷𝓭
2:𝔂𝓮𝓪𝓻,𝓸𝓯,𝓓𝓪𝓻𝓲𝓾𝓼
3:𝓽𝓱𝓮,𝓴𝓲𝓷𝓰
```



CMD

正規表現を使う方

フルパス指定でないといけんかった つらい


```
$ echo '𝓘𝓷 𝓽𝓱𝓮 𝓼𝓮𝓬𝓸𝓷𝓭 𝔂𝓮𝓪𝓻 𝓸𝓯 𝓓𝓪𝓻𝓲𝓾𝓼 𝓽𝓱𝓮 𝓴𝓲𝓷𝓰' | xargs -n1 | xargs -n3| csharp -e 'var m = new Dictionary<int, List<string>>();var l="";var n=1;while((l=Console.ReadLine()) != null){m.Add(n++,System.Text.RegularExpressions.Regex.Split(l," ").ToList());};foreach(var k in m.Keys){Console.WriteLine("{0}:{1}",k,String.Join(",",m[k]));};'
```


CMD

dotnet系は正規表現便利すぎ

```
$ echo caffelatte | csharp -e 'var l=Console.ReadLine();var c=l.Length;for(var i=0;i<=c;i++){var a=System.Text.RegularExpressions.Regex.Split(l,"(?<=.{"+i+","+c+"})").ToList();Console.WriteLine("{0} {1}",a[0],String.Join("",a.GetRange(1,a.Count-1)));}' | xargs -n2
```

OUT

```
caffelatte c
affelatte ca
ffelatte caf
felatte caff
elatte caffe
latte caffel
atte caffela
tte caffelat
te caffelatt
e caffelatte
```



