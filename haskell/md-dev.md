# 参考文献
- https://www.slideshare.net/mobile/rakutentech/egison-44189985
- https://qiita.com/greymd/items/3515869d9ed2a1a61a49
- https://www.egison.org/getting-started/getting-started-linux.html

# ghcインストール
- egisonを動かすにはhaskellが必要
- haskellを動かすにはghc環境が必要
- https://www.haskell.org/ghc/download_ghc_8_8_1.html
- https://haskell.jp/blog/posts/2019/stack-ghc8.8.html

# ghcの使い方

- ダイナミック実行,コマンド文字列結合を中心に
  - https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/ghci.html

# ghcとは

- https://ja.wikipedia.org/wiki/Glasgow_Haskell_Compiler

# stackコマンドインストール
- ghc環境におけるパッケージ管理コマンド
- pythonのpipコマンド的な位置づけであろう
- https://haskell.e-bigmoon.com/stack/intro/stack-install.html
- https://qiita.com/waddlaw/items/49874f4cf9b680e4b015

# haskellチュートリアル

- https://wiki.haskell.org/Haskell%E5%85%A5%E9%96%80_5%E3%82%B9%E3%83%86%E3%83%83%E3%83%97

```
$echo "main=putStrLn \"hello\"" > hello.hs
$cat hello.hs
main=putStrLn "hello"
$ghc -o hello hello.hs
[1 of 1] Compiling Main             ( hello.hs, hello.o )
Linking hello ...
$ll
total 192264
drwxrwxr-x 14 sqlite sqlite      4096 10月 18 23:25 ghc-8.8.1
-rw-rw-r--  1 sqlite sqlite 194601024 10月 18 23:20 ghc-8.8.1-x86_64-centos7-linux.tar.xz
-rwxrwxr-x  1 sqlite sqlite   2255992 10月 18 23:46 hello
-rw-rw-r--  1 sqlite sqlite       842 10月 18 23:46 hello.hi
-rw-rw-r--  1 sqlite sqlite        22 10月 18 23:46 hello.hs
-rw-rw-r--  1 sqlite sqlite      3184 10月 18 23:46 hello.o
$./hello
hello
```

# ghc動作確認
- https://nekketsuuu.github.io/entries/2018/09/19/egison.html
- https://haskell.e-bigmoon.com/stack/intro/stack-install.html
- https://haskell.jp/blog/posts/2019/stack-ghc8.8.html
- http://docs.haskellstack.org/en/stable/yaml_configuration/

```
$ghci
GHCi, version 8.8.1: https://www.haskell.org/ghc/  :? for help
Prelude> 1+2
3
Prelude> let x=42 in x/9
4.666666666666667
Prelude> x=42
Prelude> x
42
Prelude>
Leaving GHCi.
```

