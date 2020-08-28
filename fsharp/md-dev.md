

csharpのライブラリも使える便利

```
cat <<EOS

open System

let a = [ 1; 2; 3 ] ;;

Console.WriteLine(a);;




EOS
```


実行

```
$ dotnet fsi a.fsx
[1; 2; 3]
```


拡張子はfsxの方がトラブルすくない

補完効かなくなるときはvscode閉じて開き直しでいい感じ
