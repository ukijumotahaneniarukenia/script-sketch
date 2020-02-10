# 参考文献

部分集合
https://math.hyuki.net/20160522051328/

コマンドライン引数
https://www.egison.org/manual/command.html

# 入出力
https://github.com/egison/egison/tree/master/sample/io

# メインプログラムの書き方

https://www.egison.org/manual/io.html

https://www.egison.org/~egi/files/mitou-boost.pdf


自身とそれら以外の特徴を見抜く


reduceと構成は似ている感じかな

前回のパタンマッチ結果を蓄積しながら、今回の計算を実施するイメージ。

入れ子をイメージ。


基本的な関数群

https://www.egison.org/manual/primitive-functions.html


```
[sqlite💚29231fdc7920 (水 10月 30 23:09:22) ~/script_scratch/egison]$egison -e '(regex "[0-9]+,[0-9]+" "abc,123,45,defg");=>{["abc," {"123" "45"} ",defg"]}'
{["abc," "123,45" ",defg"]}
```

```

[sqlite💚29231fdc7920 (水 10月 30 23:10:14) ~/script_scratch/egison]$egison -e '(split-string "," "2,3,5,7,11,13");'
{"2" "3" "5" "7" "11" "13"}

```


```
[sqlite💚29231fdc7920 (水 10月 30 23:13:23) ~/script_scratch/egison]$egison -e '(append-string "💩" "うんこ");'
"💩うんこ"
```


```
[sqlite💚29231fdc7920 (水 10月 30 23:14:17) ~/script_scratch/egison]$egison -e '(length-string "うんこ");'
3
[sqlite💚29231fdc7920 (水 10月 30 23:14:37) ~/script_scratch/egison]$egison -e '(length-string "💩");'
1
```

```
[sqlite💚29231fdc7920 (水 10月 30 23:15:47) ~/script_scratch/egison]$egison -e '(uncons-string "Egison");'
[c#E "gison"]
[sqlite💚29231fdc7920 (水 10月 30 23:16:04) ~/script_scratch/egison]$egison -e '(uncons-string "gison");'
[c#g "ison"]
```


```
[sqlite💚29231fdc7920 (水 10月 30 23:17:29) ~/script_scratch/egison]$echo {a..g} | tr -d ' ' | xargs -I@ egison -e '(unpack "@")'
{c#a c#b c#c c#d c#e c#f c#g}
```
