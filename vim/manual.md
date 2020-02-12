Vim script入門記事
https://www.slideshare.net/rbtnn/vimconf2015-55367256
Vim scriptをパイプとして扱う
http://auewe.hatenablog.com/entry/2016/12/03/001000




# vim入門記事

詳しい
クリップボード関連
https://ujihisa.wordpress.com/2018/10/08/how-to-paste-clipboard-in-terminal/


基本操作



https://knowledge.sakura.ad.jp/22488/

https://knowledge.sakura.ad.jp/22465/

https://knowledge.sakura.ad.jp/22465/

https://knowledge.sakura.ad.jp/22069/

https://knowledge.sakura.ad.jp/21687/

ターミナルモードの使い方
https://knowledge.sakura.ad.jp/23018/

モードまとめ
https://qiita.com/gorilla0513/items/e8ccb15bfc87e7ed8d5b

コマンドラインモード実行できるコマンドがexコマンド

Exコマンド一覧
https://vim-jp.org/vimdoc-ja/vimindex.html#ex-cmd-index

https://qiita.com/gorilla0513/items/f4a5fd835201cf49fda1

https://vim.fandom.com/ja/wiki/Vim_wiki

https://www.slideshare.net/rbtnn/vimconf2015-55367256

http://auewe.hatenablog.com/entry/2016/12/03/001000


# vimマクロ
https://qiita.com/Go-zen-chu/items/5464fb6b9e6b38c958bd


# vimスクリプトから標準出力に吐く

https://qiita.com/watiko/items/3ce5086c0defc0c148bf

# 標準入力をvimにながす

https://qiita.com/yuitowest/items/e05a8f889a18534c3280


# vim外部コマンド関連

https://wisteriasec.wordpress.com/2017/08/21/vim%E3%81%AE%E5%A4%96%E9%83%A8%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E9%80%A3%E6%90%BA/

# shellとvimをつなぐのり

https://vim-jp.org/blog/2015/10/15/tovim-on-shell-command-pipes.html


# tty

https://qiita.com/toshihirock/items/22de12f99b5c40365369


# コマンドライン上での標準出力をvimに渡す

```
ls | ./tovim.sh
```

tovim.shの内容を以下のようにして、上のコマンドを実行すると、
```
$cat tovim.sh 
#!/bin/bash
TMP=tmp_$$
cat - >$TMP 
vim $TMP
rm $TMP
```

端末からの入力でないとおこられる。
```
#$ls | ./tovim.sh 
#Vim: 警告: 端末からの入力ではありません
#^C/home/sqlite/.vimrc の処理中にエラーが検出されました:
```

てんぷファイルを読み込むときは端末からの入力であることを明記してやる必要があるぽい。

そのための
```
</dev/tty
```

```
$cat tovim.sh 
#!/bin/bash
TMP=tmp_$$
cat - >$TMP 
#vim $TMP </dev/tty
rm $TMP
```


# vimで外部コマンド実行

https://dev.classmethod.jp/tool/vim-use-shellcommands/


# コマンドラインからvimスクリプトを実行

```
$ls
echo.vim  manual.md  tovim.sh
$vim --cmd "source put.vim|quit"
```

```
$cat echo.vim 
echo "うんんんこ"

```

すごい。vimすごい。

```
$cat 響け.vim
"https://togetter.com/li/1041621?page=2
echo join(split(repeat("響け！ユーフォニアム", 11), '.\{11}\zs'), "\n") 
$vim --cmd "source 響け.vim|quit"
響け！ユーフォニアム響
け！ユーフォニアム響け
！ユーフォニアム響け！
ユーフォニアム響け！ユ
ーフォニアム響け！ユー
フォニアム響け！ユーフ
ォニアム響け！ユーフォ
ニアム響け！ユーフォニ
アム響け！ユーフォニア
ム響け！ユーフォニアム
```


vimで行番号をしゅとく

https://ryochack.hatenablog.com/entry/2012/07/08/222637


かわいい
http://mattn.kaoriya.net/software/vim/20111202085236.htm

https://thinca.hatenablog.com/entry/20100201/126500982

行番号
https://osyo-manga.hatenadiary.org/entry/20130503/1367584587




vimとshellいききできる
https://togetter.com/li/1080646


exモードで:normしてキーバインドを使うという発想は無かった。

   -e			Exモード ("ex" と同じ)
   -s			サイレント(バッチ)モード ("ex" 専用)

コマンドをプラスで繋いでいる
```
$seq 10 | vim -es /dev/stdin +'5,7!tac' +%p +q!
1
2
3
4
7
6
5
8
9
10
```

これもうごくんだ

```
$seq 50 | vim -es /dev/stdin +'11,$d|%p|q!'
1
2
3
4
5
6
7
8
9
10
[sqlite💞ceacf3fb0808 (水 10月 30 02:13:32) ~/script_scratch/vim]$seq 50 | vim -es /dev/stdin +'11,$d|%p|q!'
```

あとでかいどくすうる
```
[sqlite🖤ceacf3fb0808 (水 10月 30 02:15:17) ~/script_scratch/vim]$seq 10 | vim -es /dev/stdin +'2,4!xargs' +'4,6!awk "\$0=\$0*2" | xargs' +'$!factor' +%p +q!
1
2 3 4
5
12 14 16
9
10: 2 5

```



https://togetter.com/li/1080646?page=3
```
[sqlite🖤ceacf3fb0808 (水 10月 30 02:19:03) ~/script_scratch/vim]$echo abcdefghijklmn | vim -es /dev/stdin +'norm l~'{,,,,,,} +'%p|q!'
aBcDeFgHiJkLmN
[sqlite🖤ceacf3fb0808 (水 10月 30 02:19:04) ~/script_scratch/vim]$echo abcdefghijklmn | echo vim -es /dev/stdin +'norm l~'{,,,,,,} +'%p|q!'
vim -es /dev/stdin +norm l~ +norm l~ +norm l~ +norm l~ +norm l~ +norm l~ +norm l~ +%p|q!
```


```
seq 1 10 | vim -es /dev/stdin +'3m7|%p|q!'
[sqlite🖤ceacf3fb0808 (水 10月 30 02:20:07) ~/script_scratch/vim]$seq 1 10 | vim -es /dev/stdin +'3m7|%p|q!'
1
2
4
5
6
7
3
8
9
10

```


ぜんぜんわかんねぇけどすごいな

```
[sqlite🖤ceacf3fb0808 (水 10月 30 02:20:19) ~/script_scratch/vim]$echo 1 | vim -es /dev/stdin +'norm yypylp'{,,,} +'g/^/co5' +'%p|q!'
1
11
111
1111
11111
11111
1111
111
11
1
[sqlite🖤ceacf3fb0808 (水 10月 30 02:20:33) ~/script_scratch/vim]$echo 1 | vim -es /dev/stdin +'norm yypylp'{,,,} +'g/^/co9' +'%p|q!'
1
11
111
1111
11111
[sqlite🖤ceacf3fb0808 (水 10月 30 02:20:39) ~/script_scratch/vim]$echo 1 | vim -es /dev/stdin +'norm yypylp'{,,,} +'g/^/co1' +'%p|q!'
1
11111
1111
111
11
1
11
111
1111
11111
[sqlite🖤ceacf3fb0808 (水 10月 30 02:20:44) ~/script_scratch/vim]$echo 1 | vim -es /dev/stdin +'norm yypylp'{,,,} +'g/^/co2' +'%p|q!'
1
11
11111
1111
111
11
1
111
1111
11111
[sqlite🖤ceacf3fb0808 (水 10月 30 02:20:46) ~/script_scratch/vim]$echo 1 | vim -es /dev/stdin +'norm yypylp'{,,,} +'g/^/co3' +'%p|q!'
1
11
111
11111
1111
111
11
1
1111
11111

```


vim
https://vim.fandom.com/wiki/Reverse_order_of_lines

```
[sqlite🖤ceacf3fb0808 (水 10月 30 02:22:44) ~/script_scratch/vim]$echo 1 | vim -es /dev/stdin +'norm yypylp'{,,,} +'g/^/co0' +'%p|q!'
11111
1111
111
11
1
1
11
111
1111
11111

```

```
[sqlite🖤ceacf3fb0808 (水 10月 30 02:23:07) ~/script_scratch/vim]$seq 5 | ex /dev/stdin +'g/^/m0' +'%p|q!'
5
4
3
2
1

```


```
[sqlite🖤ceacf3fb0808 (水 10月 30 02:23:29) ~/script_scratch/vim]$echo 1 | ex /dev/stdin +t. +'t.|-2|.,+s/./&&/'{,,,} +'%p|q!' 
1
11
111
1111
11111
11111
1111
111
11
1

```


```
[sqlite🖤ceacf3fb0808 (水 10月 30 02:23:55) ~/script_scratch/vim]$ echo 'こううんのおまもり' | vim -es /dev/stdin +'%!grep -o .' +':3,4m0|$-1,$co3|4,5co5|8,$d' +'%!xargs' +'%p|q!'
う ん こ も り も り

```


```
[sqlite🖤ceacf3fb0808 (水 10月 30 02:24:52) ~/script_scratch/vim]$echo '響けユーフォニアム' | ex /dev/stdin +'p|norm x$p'{1..9} +'q!'     
響けユーフォニアム
けユーフォニアム響
ユーフォニアム響け
ーフォニアム響けユ
フォニアム響けユー
ォニアム響けユーフ
ニアム響けユーフォ
アム響けユーフォニ
ム響けユーフォニア
```


これすこしわかりやすいかも！！
```
[sqlite🖤ceacf3fb0808 (水 10月 30 02:27:07) ~/script_scratch/vim]$echo {a..d} | xargs -n 1 | vim -es /dev/stdin +':set number|%p|q!'
      1 a
      2 b
      3 c
      4 d

```


```
vim -es +'norm 4o' +'se nu|%p|q!'
[sqlite💟ceacf3fb0808 (水 10月 30 02:30:38) ~/script_scratch/vim]$vim -es +'norm4o' +'se nu|%p|q!'
      1  
      2  
      3  
      4  
      5  

```


```
[sqlite💟ceacf3fb0808 (水 10月 30 02:31:13) ~/script_scratch/vim]$vim -es +'pu=range(1,10)' +'%p|q!'
1
2
3
4
5
6
7
8
9
10
```


```
[sqlite💟ceacf3fb0808 (水 10月 30 02:31:34) ~/script_scratch/vim]$vim -es +'pu=range(1,5)|$d|%s/^/str/' +'%p|q!'
str1
str2
str3
str4
str5

```


```
[sqlite🖤ceacf3fb0808 (水 10月 30 02:33:41) ~/script_scratch/vim]$tail ~/.bashrc
#alias vim="sudo vim"
#alias vi="sudo vim"
export LD_LIBRARY_PATH=/usr/local/lib
alias sqlite=/usr/local/bin/sqlite3
alias sed=/usr/local/bin/sed


vo () {
        vim -es <(cat) "$@" '+%p|q!'
      }
[sqlite🖤ceacf3fb0808 (水 10月 30 02:33:45) ~/script_scratch/vim]$seq 5 | vo +'g/^/m0'
5
4
3
2
1

```

興奮した。寝る。
https://vim-jp.org/vimdoc-ja/
https://vim.fandom.com/wiki/Reverse_order_of_lines
exモードでのコマンドをおぼえるひつあり
