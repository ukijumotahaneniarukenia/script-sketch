# 環境

```python
[sqlite💛ceacf3fb0808 (月 10月 28 17:21:18) ~/script_scratch/python]$python
Python 3.7.4 (default, Oct 22 2019, 23:06:20) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-39)] on linux
Type "help", "copyright", "credits" or "license" for more information.
```

使用するライブラリ
```python
from functools import reduce
```

# 前提

入力チェックして何ができるか確認していった。


実引数を指定しないとエラー。

```python
>>> reduce(lambda z: z, [])
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: reduce() of empty sequence with no initial value
```

指定すると出力してくれる。

```python
>>> reduce(lambda z: z, [1])
1
```

大文字小文字は区別しない。

```python
>>> reduce(lambda x,y:X , [1])
1
```

実引数に２つ引数を指定。
仮引数に１つしか構えていないので、エラー。

```python
>>> reduce(lambda z: z, [1,2])
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: <lambda>() takes 1 positional argument but 2 were given
```

同じ仮引数を指定すると重複エラー。

```python
>>> reduce(lambda z,z: z, [1,2])
  File "<stdin>", line 1
SyntaxError: duplicate argument 'z' in function definition
```

別の名をつけると1+2で3を出力してくれる。

```python
>>> reduce(lambda z,zz: z, [1,2])
1
>>> reduce(lambda z,zz: z+zz, [1,2])
3
```

仮引数に指定していない変数を式で参照するとエラー。

```python
>>> reduce(lambda z,zz: zzz, [1,2])
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 1, in <lambda>
NameError: name 'zzz' is not defined
```

３つ仮引数を指定するとエラー。

```python
>>> reduce(lambda z,zz,zzz: zzz, [1,2])
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: <lambda>() missing 1 required positional argument: 'zzz'
```

初項をしていないときのデフォルト値は数値の場合、0の模様
文字列だと、空文字列の模様

```python
>>> reduce(lambda x,y:x+y,[1,2,3],0)
6
>>> reduce(lambda x,y:x+y,[1,2,3],1)
7
```

カンマとかセパレータ仕込むと前回と今回を区別しやすいかも。

```python
>>> reduce(lambda x,y:x+y,["a","b,c,d","e"])
'ab,c,de'
>>> reduce(lambda x,y:x+","+y,["a","b,c,d","e"])
'a,b,c,d,e'
>>> reduce(lambda x,y:x+","+y,["a","b","c"],"!!!!!!!")
'!!!!!!!,a,b,c'
```

# 仮定

左側に与えられている引数の役割が２つある。

## 実引数の数が単一の場合

引数を設定せず、その引数自身を返却する

## 実引数の数が２つ以下の場合

x:実引数の左側の要素
y:実引数の右側の要素

## 実引数の数が３つ以上の場合

実引数の数が２つ以下の場合を踏まえて

x:指定した計算式による前回の計算結果
y:最後に取り出した実引数の次の要素

# 検証

前提を踏まえた上で、仮定がいけているか確認してみようとおもう。

## 実引数の数が単一の場合

### 仮引数が単一

取得結果は与えた引数のみ。

```python
>>> reduce(lambda x: x, [1])
1
>>> reduce(lambda y: y, [1])
1
```

式に同じ引数を繰り返し指定しても取得結果は与えた引数のみ。

```python
>>> reduce(lambda x:x+x+x , [1])
1
>>> reduce(lambda y:y+y+y , [1])
1
```

### 仮引数が複数

仮引数の順番を入れ替えて結果に影響があるかないか確認

```python
>>> reduce(lambda x,y:x , [1])
1
>>> reduce(lambda x,y:y , [1])
1
>>> reduce(lambda y,x:x , [1])
1
>>> reduce(lambda y,x:y , [1])
1
```

式に同じ引数を繰り返し指定しても取得結果は与えた引数のみ。

```python
>>> reduce(lambda x,y:x+x+x , [1])
1
>>> reduce(lambda x,y:y+y+y , [1])
1
>>> reduce(lambda x,y:y+x+y , [1])
1
```

## 実引数の数が２つ以下の場合

このパターンは仮引数がすべて複数とする。
仮引数の位置と実引数の位置関係は左からの位置に相関があるようだ。

x=1,y=2

```python
>>> reduce(lambda x,y:x+y,[1,2])
3
>>> reduce(lambda x,y:x-y,[1,2])
-1
>>> reduce(lambda x,y:x/y,[1,2])
0.5
>>> reduce(lambda x,y:x*y,[1,2])
2
```

y=1,x=2

```python
>>> reduce(lambda y,x:x+y,[1,2])
3
>>> reduce(lambda y,x:x-y,[1,2])
1
>>> reduce(lambda y,x:x/y,[1,2])
2.0
>>> reduce(lambda y,x:x*y,[1,2])
2
```

式の順番入れ替えてみた

x=1,y=2

```python
>>> reduce(lambda x,y:y+x,[1,2])
3
>>> reduce(lambda x,y:y-x,[1,2])
1
>>> reduce(lambda x,y:y/x,[1,2])
2.0
>>> reduce(lambda x,y:y*x,[1,2])
2
```

y=1,x=2

```python
>>> reduce(lambda y,x:y+x,[1,2])
3
>>> reduce(lambda y,x:y-x,[1,2])
-1
>>> reduce(lambda y,x:y/x,[1,2])
0.5
>>> reduce(lambda y,x:y*x,[1,2])
2
```

## 実引数の数が３つ以上の場合


このパターンは仮引数がすべて複数とする。


```python
>>> reduce(lambda x,y:x+y,[1,2,3]),0
6
```

0のまえに+がないから、xが前回の計算蓄積結果でyが今回の要素と思われる。

()で囲んだ部分が前回の計算蓄積結果で、それ以外が今回の要素。
初項の場合はyには値がない。xに0が入力されている。

仮引数xには初項の値と、前回の計算蓄積結果を保持している。

```
0
(0)+1
(0+1)+2
(0+1+2)+3
```

```python
>>> reduce(lambda x,y:x+y,[1,2,3],0)
6
>>> reduce(lambda x,y:x+"+"+y,["1","2","3"],"0")
'0+1+2+3'
```

```
0+0
(0+0)+0+0
(0+0+0+0)+0+0
(0+0+0+0+0+0)+0+0
```

```python
>>> reduce(lambda x,y:x+"+"+x,["1","2","3"],"0")
'0+0+0+0+0+0+0+0'
>>> reduce(lambda x,y:x+"+"+x,["1","2","3"],"1")
'1+1+1+1+1+1+1+1'
```

この結果のイメージは

```
y=1,x=0,exp=(0+1)
y=(0+1),x=2,exp=(0+1+2)
y=(0+1+2),x=3,exp=(0+1+2+3)
y=(0+1+2+3),x=nil
```

```python
>>> reduce(lambda x,y:x+"+"+y,["1","2","3"],"0")
'0+1+2+3'
```

```
y=1,x=0,exp=(1+0)
y=(1+0),x=2,exp=(2+1+0)
y=(2+1+0),x=3,exp=(3+2+1+0)
y=(3+2+1+0),x=nil
```

```python
>>> reduce(lambda x,y:y+"+"+x,["1","2","3"],"0")
'3+2+1+0'
```


```
y=0,x=1,exp=(1+0)
y=(1+0),x=2,exp=(2+1+0)
y=(2+1+0),x=3,exp=(3+2+1+0)
y=(3+2+1+0),x=nil
```

```python
>>> reduce(lambda y,x:x+"+"+y,["1","2","3"],"0")
'3+2+1+0'
```

```
y=0,x=1,exp=(0+1)
y=(0+1),x=2,exp=(0+1+2)
y=(0+1+2),x=3,exp=(0+1+2+3)
y=(0+1+2+3),x=nil
```

```python
>>> reduce(lambda y,x:y+"+"+x,["1","2","3"],"0")
'0+1+2+3'
```

シェルでこんなイメージ

```python
#!/usr/local/bin/python3.7

import sys

def main():
  cum=""
  for ln in sys.stdin:
    cum=cum+"+"+ln.strip()
    print(cum)

if __name__=="__main__":
    main()
```

処理する順番が異なるだけ。

```bash
$seq 0 3 | ./reduce11.py
+0
+0+1
+0+1+2
+0+1+2+3
$seq 0 3 | tac | ./reduce11.py | keta
      +3
    +3+2
  +3+2+1
+3+2+1+0
```


つぎにこれをみてみる

```python
>>> reduce(lambda x,y: y+y, [-2,-1,3,1],0)
2
```

これは一つずつ引数を増やしていくことでデバッグできる
前回の計算蓄積結果を問わず、今回の要素のみで計算していることがわかる。

```
x=0,y=-2,expr=(-2)+(-2)=-4
x=-4,y=-1,expr=(-1)+(-1)=-2
x=-2,y=-3,expr=3+3=6
x=6,y=1,expr=1+1=2
```

```python
>>> reduce(lambda x,y: y+y, [-2],0)
-4
>>> reduce(lambda x,y: y+y, [-2,-1],0)
-2
>>> reduce(lambda x,y: y+y, [-2,-1,3],0)
6
>>> reduce(lambda x,y: y+y, [-2,-1,3,1],0)
2
```


初期値がzeroの場合はなにをしてもゼロのまま。

左側の仮引数が初項ないし、前回計算蓄積結果を保持していることが感じ取れる。

```
x=0,y=1,expr=0+0=0
x=0,y=2,expr=0+0=0
x=0,y=3,expr=0+0=0
x=0,y=4,expr=0+0=0
```

```python
>>> reduce(lambda x,y: x+x, [1,2,3,4],0)
0
```

初期値がzero以外の場合はなにをしてもゼロのまま。

```
x=1,y=1,expr=1+1=2
x=2,y=2,expr=2+2=4
x=4,y=3,expr=4+4=8
x=8,y=4,expr=8+8=16
```

```python
>>> reduce(lambda x,y: x+x, [1,2,3,4],1)
16
```

```
x=1,y=1,expr=1+1+1=3
x=3,y=2,expr=3+3+3=9
x=9,y=3,expr=9+9+9=27
x=27,y=4,expr=27+27+27=81
```

```python
>>> reduce(lambda x,y: x+x+x, [1,2,3,4],1)
81
```


# まとめ

以下のようにラムダ式の仮引数と式と実引数と初期値を定義した場合、以下のようなことが感じ取れた。

```python
reduce(lambda x,y: x+y, [1,2,3,4],1)
```

初期値はデフォルト値で数値は0,文字は空文字。

## 実引数の数が単一の場合

引数を設定せず、その引数自身を返却する

## 実引数の数が２つ以下の場合

x:実引数の左側の要素
y:実引数の右側の要素

## 実引数の数が３つ以上の場合

実引数の数が２つ以下の場合を踏まえて

x:指定した計算式による前回の計算結果
y:最後に取り出した実引数の次の要素


# あとがき
自前で実装するとなると引数の数ごとに分岐して、受け取った実引数の最初の要素とそれ以外に分けて、引数処理して、指定された式に渡す。
引数を受け取った式はexec関数かeval関数で即時実行して、値を取得して、呼び出し元に返却する。呼び出し元は返却された戻り値を前回の計算蓄積結果として保持して、次の要素を処理する際に引数として渡すのかな。そもそも式が前回の計算蓄積結果を参照する場合に限るけど。チェック処理として、まず、前回蓄積結果を参照するかどうかが必要になるのか。
