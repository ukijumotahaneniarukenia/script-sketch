I'm trying ascii art. :)

# MOMO

MAINからFLOWをCALLするときに、PATTERN番号渡して、FLOW分ける。
PATTERNごとのSUBFLOWの戻り値を合計した値に応じて凖正常終了とか
終了ステータスを分けておく

awkでは相互にincludeし合うのはダメなようだ。


# 好きなファイル

```
/home/oracle/unko/centos_coreutils/coreutils-colorls.sh
/home/oracle/ff/gawk-5.0.0/test/getfile.awk
/home/oracle/ff/gawk-5.0.0/msg.c
```

# purpose

基本的な方針としてはハードでなるたけかかずにどこまでいけるかです。

```
[oracle@centos rr]$ date +%Y-%m-%d#%H:%M:%S
2019-06-22#16:50:03
[oracle@centos rr]$ rm -f __* && seq 30 | xargs -I@ bash -c 'printf "%02d\n" @' | xargs -I@ bash -c 'echo @ > ___@;'
[oracle@centos rr]$ ll __*
[oracle@centos rr]$ unkommit '\U1F4A9' '\U1F47B'
git commit ___01 -m "💩💩💩💩💩💩💩💩💩💩💩💩💩💩👻💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___02 -m "💩💩💩💩💩💩💩💩💩💩💩💩💩💩👻👻💩💩💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___03 -m "💩💩💩💩💩💩💩💩💩💩💩💩💩👻👻👻💩💩💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___04 -m "💩💩💩💩💩💩💩💩💩💩💩💩💩👻👻👻👻💩💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___05 -m "💩💩💩💩💩💩💩💩💩💩💩💩👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___06 -m "💩💩💩💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___07 -m "💩💩💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___08 -m "💩💩💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩💩"
git commit ___09 -m "💩💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩💩"
git commit ___10 -m "💩💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩"
git commit ___11 -m "💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩"
git commit ___12 -m "💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩"
git commit ___13 -m "💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩"
git commit ___14 -m "💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩"
git commit ___15 -m "💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩"
git commit ___16 -m "💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩"
git commit ___17 -m "💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩"
git commit ___18 -m "💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩"
git commit ___19 -m "💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩"
git commit ___20 -m "💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩"
git commit ___21 -m "💩💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩"
git commit ___22 -m "💩💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩💩"
git commit ___23 -m "💩💩💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩💩"
git commit ___24 -m "💩💩💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___25 -m "💩💩💩💩💩💩💩💩💩💩💩💩👻👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___26 -m "💩💩💩💩💩💩💩💩💩💩💩💩👻👻👻👻👻💩💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___27 -m "💩💩💩💩💩💩💩💩💩💩💩💩💩👻👻👻👻💩💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___28 -m "💩💩💩💩💩💩💩💩💩💩💩💩💩👻👻👻💩💩💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___29 -m "💩💩💩💩💩💩💩💩💩💩💩💩💩💩👻👻💩💩💩💩💩💩💩💩💩💩💩💩💩💩"
git commit ___30 -m "💩💩💩💩💩💩💩💩💩💩💩💩💩💩👻💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩"
```


# MEMO

## 自作コマンドへのPATH通し方

### 作成したコマンドシェルのパスを/usr/local/binに通すためのシンボリックリンク作成
 
```
[oracle@centos rr]$ sudo ln -si $(pwd)/.bin/unkommit.sh /usr/local/bin
[oracle@centos rr]$ ll /usr/local/bin
合計 15780
-rwxr-xr-x. 1 root root 16154160  5月 12 17:20 docker-compose
-rwxr-xr-x. 1 root root       34  4月  5 05:57 sqldeveloper
lrwxrwxrwx. 1 root root       32  6月 22 14:05 unkommit.sh -> /home/oracle/rr/.bin/unkommit.sh
```

### ~/.bashrcに作成したシンボリックリンクのリンク元のパスをエイリアスを登録しておく

```
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias unkommit="/usr/local/bin/unkommit.sh"
```

### 動作確認

```
[oracle@centos rr]$ unkommit
ERROR!--->FUNCTION:_unkommit
ERROR!--->PLEASE_MUST_ENTER_TWO_EMOJI_UNICODE.
INFO--->UNKO_EMOJI_UNICODE_IS_\U1F4A9_💩

BELOW IS OK_PATTERN AND NG_PATTERN.PLEASE REFER."😁"

THIS IS OK_PATTERN. Enable Any CodePoint of Unicode Except '\U1F4A9'.
ex.) '\U1F47B'"👻" is ghost.
===============================================================
unkommit '\U1F4A9' '\U1F47B'
unkommit '\U1F47B' '\U1F4A9'
unkommit '\U1F4A9' '\U1F4A9'

THIS IS NG_PATTERN. None Any One '\U1F4A9'.
===============================================================
unkommit '\U1F47B' '\U1F47B'
[oracle@centos rr]$ unkommit '\U1F47B' '\U1F47B'
ERROR!--->FUNCTION:_unkommit
ERROR!--->OUT_OF_UNKO.PLEASE_ENTER_LEAST_A_UNKO_EMOJI_UNICODE.
INFO--->UNKO_EMOJI_UNICODE_IS_\U1F4A9_💩

BELOW IS OK_PATTERN AND NG_PATTERN.PLEASE REFER."😁"

THIS IS OK_PATTERN. Enable Any CodePoint of Unicode Except '\U1F4A9'.
ex.) '\U1F47B'"👻" is ghost.
===============================================================
unkommit '\U1F4A9' '\U1F47B'
unkommit '\U1F47B' '\U1F4A9'
unkommit '\U1F4A9' '\U1F4A9'

THIS IS NG_PATTERN. None Any One '\U1F4A9'.
===============================================================
unkommit '\U1F47B' '\U1F47B'
```

### シンボリックリンクの削除

```
[oracle@centos rr]$ ( cd /usr/local/bin && sudo unlink unkommit.sh )
[oracle@centos rr]$ ll /usr/local/bin
合計 15780
-rwxr-xr-x. 1 root root 16154160  5月 12 17:20 docker-compose
-rwxr-xr-x. 1 root root       34  4月  5 05:57 sqldeveloper
[oracle@centos rr]$ sudo ln -si $(pwd)/.bin/unkommit.sh /usr/local/bin
[oracle@centos rr]$ ll /usr/local/bin
合計 15780
-rwxr-xr-x. 1 root root 16154160  5月 12 17:20 docker-compose
-rwxr-xr-x. 1 root root       34  4月  5 05:57 sqldeveloper
lrwxrwxrwx. 1 root root       32  6月 22 14:06 unkommit.sh -> /home/oracle/rr/.bin/unkommit.sh
```

## リモートレポジトリの状態にローカルレポジトリの状態を合わせる

```
[oracle@centos rr]$ git fetch
[oracle@centos rr]$ git merge origin/master
```

## ステージングへあげたい

```
[oracle@centos rr]$ git add -A __*
```


## ステージングから降ろしたい

```
[oracle@centos rr]$ git rm --cached __*
```

## リモートレポジトリから消したい

```
[oracle@centos rr]$ git rm __*
[oracle@centos rr]$ git commit -m "______$(echo -e '\U1F4A9')______"
[oracle@centos rr]$ git push origin master
```

# usage

## ./tool/snippet.sh

一括置換用。第一引数にフォルダ。検索文字列。置換前文字列。置換後文字列。コマンドラインからなら、sedで軽い気持ちでポンと実行すればいいと思います。
スクリプトにしたら、特にスペースが引数の文字列に混入してくる際のハンドリングがべりべり難しかった。スマートにかきてぇぇえ。
タブ区切りが味噌。個人的には。

```
[oracle@centos rr]$ ./tool/snippet.sh 'tool','fg_cyan $(_fin_msg "${FUNCNAME}")','fg_cyan $(_fin_msg "${FUNCNAME}")','_fin_msg "${FUNCNAME}"';
```



## extract_variable.sh

### 1
```
[oracle@centos rr]$ ./tool/extract_variable.sh "{func,cnst}"
```

### 2
```
[oracle@centos rr]$ ./tool/extract_variable.sh "*"
```

## call_seg_func.sh

### 1
```
[oracle@centos rr]$ time ./tool/call_seg_func.sh "*" 
```

### 2
```
[oracle@centos rr]$ time ./tool/call_seg_func.sh "cnst" 
```

### 3
```
[oracle@centos rr]$ time ./tool/call_seg_func.sh "cnst" "func"
```

### 4
```
[oracle@centos rr]$ time ./tool/call_seg_func.sh "tool"
```

### 5
```
[oracle@centos rr]$ time ./tool/call_seg_func.sh "func/{cnst,util}"
```

### 6
```
[oracle@centos rr]$ time ./tool/call_seg_func.sh "{cnst,func}"
```

### 7
```
[oracle@centos rr]$ time ./tool/call_seg_func.sh "."
```

## extract_test_code.sh

### 1
```
[oracle@centos rr]$ ./tool/extract_test_code.sh "test/invokee"
```

# flow

## 1
func,cnstフォルダ配下にせっせとファンクションとか書く。

## 2
テストしようかなっておもったら、./tool/call_seg_func.shをおもむろにたたく。

## 3
テストコード書いていて、切り出したいなとかおもったら、./tool/extract_test_code.sh たたく。

# todo

ファンクションの共通引数チェックの生成ないしオプション解析の生成。
テストファンクションの実行インターフェースの作成。
アート部品の作成。
アートテンプレートの作成。
精査したファンクションからファイルを逆生成したい。
