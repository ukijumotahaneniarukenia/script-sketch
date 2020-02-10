# 参考文献

外部ファイル読み込み系
https://nim-lang.org/docs/manual.html#modules-import-statement

型確認

https://nim-lang.org/docs/manual.html#special-types-typeof-operator

データ構造確認に使える
https://nim-lang.org/docs/manual.html#generics-type-classes

エラーハンドリング

https://nim-lang.org/docs/manual.html#exception-handling

割り算

https://nim-lang.org/docs/manual.html#procedures-var-parameters

テーブル型マップ

https://nim-lang.org/docs/manual.html#statements-and-expressions-table-constructor

Set
集合演算
https://nim-lang.org/docs/manual.html#types-set-type

配列
https://nim-lang.org/docs/manual.html#types-array-and-sequence-types

タプル
https://nim-lang.org/docs/manual.html#types-tuples-and-object-types

https://nim-lang.org/install_unix.html
https://qiita.com/rigani/items/6e87c7cee6903ed65ed2

Unicode string literal

https://nim-lang.org/docs/manual.html


http://nim-memo.hatenablog.com/entry/2016/10/25/114401


ちょーさいこう
https://hookrace.net/blog/what-is-special-about-nim/

パッケージマネージャ的なやつ
nimble
https://github.com/nim-lang/nimble


http://nim-memo.hatenablog.com/entry/2016/10/24/173300


https://qiita.com/KTakahiro1729/items/f4776f3a072c01f9086b


チュートリアル

https://nim-lang.org/docs/tut1.html


nimのインストール

```
curl -LO https://nim-lang.org/download/nim-1.0.2-linux_x64.tar.xz
tar xvf nim-1.0.2-linux_x64.tar.xz
cd nim-1.0.2
sudo ./install.sh /usr/local/bin
```

確認

```
[sqlite🖤ceacf3fb0808 (木 10月 24 00:43:13) ~/script_scratch/nim/nim-1.0.2]$nim --version
Nim Compiler Version 1.0.2 [Linux: amd64]
Compiled at 2019-10-22
Copyright (c) 2006-2019 by Andreas Rumpf

active boot switches: -d:release
```


nimbleの導入


```
./koch nimble

Hint: operation successful (113602 lines compiled; 2.882 sec total; 138.004MiB peakmem; Release Build) [SuccessX]
```

シンボリックリンク貼っておｋ

```
[sqlite🖤ceacf3fb0808 (木 10月 24 00:52:35) ~/script_scratch/nim/nim-1.0.2]$/home/sqlite/script_scratch/nim/nim-1.0.2/bin/nimble --version
nimble v0.11.0 compiled at 2019-10-23 15:49:02
git hash: 91c06d1fc41049d3e5ec1524836ba54fbd74d14e


sudo ln -s /home/sqlite/script_scratch/nim/nim-1.0.2/bin/nimble /usr/local/bin/nimble

[sqlite🖤ceacf3fb0808 (木 10月 24 00:55:19) ~/script_scratch/nim/nim-1.0.2]$nimble --version
nimble v0.11.0 compiled at 2019-10-23 15:49:02
git hash: 91c06d1fc41049d3e5ec1524836ba54fbd74d14e

``` 
