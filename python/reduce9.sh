#!/bin/bash

#「漸化式」で検索!!!!

#左側に与えられている引数の役割が2つある。

x,yとすると、

実引数の数が3つ以上の場合

x:前回の計算結果
y:今回の要素

実引数の数が2以下の場合

x:実引数の左側の要素
y:実引数の右側の要素

実引数の数が1の場合

引数を設定せず、その実引数自身を返却する

toomowareru


#初項はデフォルトで引数の最も左側の要素。指定あればそちらを優先。

#[sqlite❣29231fdc7920 (月 10月 28 12:45:23) ~/script_scratch/python]$python
#Python 3.7.4 (default, Oct 23 2019, 21:56:45) 
#[GCC 4.8.5 20150623 (Red Hat 4.8.5-39)] on linux
#Type "help", "copyright", "credits" or "license" for more information.
#>>> from functools import reduce

#初項の(要素数-1)乗だ。
#過去以前の自分と過去の自分を掛け合わせて今の自分を生み出している。

#過去以前と過去は同じ過去でグルーピング。

#>>> reduce(lambda x,y: x+x, [-1])
#-1
#>>> reduce(lambda x,y: x+x, [-1,0])
#-2
#>>> reduce(lambda x,y: x+x, [-1,0,1])
#-4
#>>> reduce(lambda x,y: x+x, [-1,0,1,2])
#-8
#>>> reduce(lambda x,y: x+x, [-1,0,1,2,3])
#-16
#>>> reduce(lambda x,y: x+x, [-1,0,1,2,3,4])
#-32
#>>> reduce(lambda x,y: x+x, [-1,0,1,2,3,4,5])
#-64
#>>> reduce(lambda x,y: x+x, [-1,0,1,2,3,4,5,6])
#-128
#>>> reduce(lambda x,y: x+x, [-1,0,1,2,3,4,5,6,7])
#-256
#>>> reduce(lambda x,y: x+x, [-1,0,1,2,3,4,5,6,7,8])
#-512
#>>> reduce(lambda x,y: x+x, [-1,0,1,2,3,4,5,6,7,8,9])
#-1024
#>>> reduce(lambda x,y: x+x, [-1,0,1,2,3,4,5,6,7,8,9,10])
#-2048

#ゼロになにを自乗してもゼロ
#>>> reduce(lambda x,y: x+x, [0])
#0
#>>> reduce(lambda x,y: x+x, [0,1])
#0
#>>> reduce(lambda x,y: x+x, [0,1,2])
#0
#>>> reduce(lambda x,y: x+x, [0,1,2,3])
#0
#>>> reduce(lambda x,y: x+x, [0,1,2,3,4])
#0
#>>> reduce(lambda x,y: x+x, [0,1,2,3,4,5])
#0
#>>> reduce(lambda x,y: x+x, [0,1,2,3,4,5,6])
#0
#>>> reduce(lambda x,y: x+x, [0,1,2,3,4,5,6,7])
#0
#>>> reduce(lambda x,y: x+x, [0,1,2,3,4,5,6,7,8])
#0
#>>> reduce(lambda x,y: x+x, [0,1,2,3,4,5,6,7,8,9])
#0
#>>> reduce(lambda x,y: x+x, [0,1,2,3,4,5,6,7,8,9,10])
#0
#
#初項-2
#要素数-1
#>>> reduce(lambda x,y: x+x, [-2])
#-2
#>>> reduce(lambda x,y: x+x, [-2,-1])
#-4
#>>> reduce(lambda x,y: x+x, [-2,-1,0])
#-8
#>>> reduce(lambda x,y: x+x, [-2,-1,0,1])
#-16
#>>> reduce(lambda x,y: x+x, [-2,-1,0,1,2])
#-32
#>>> reduce(lambda x,y: x+x, [-2,-1,0,1,2,3])
#-64
#>>> reduce(lambda x,y: x+x, [-2,-1,0,1,2,3,4])
#-128
#>>> reduce(lambda x,y: x+x, [-2,-1,0,1,2,3,4,5])
#-256
#>>> reduce(lambda x,y: x+x, [-2,-1,0,1,2,3,4,5,6])
#-512
#>>> reduce(lambda x,y: x+x, [-2,-1,0,1,2,3,4,5,6,7])
#-1024
#>>> reduce(lambda x,y: x+x, [-2,-1,0,1,2,3,4,5,6,7,8])
#-2048
#>>> reduce(lambda x,y: x+x, [-2,-1,0,1,2,3,4,5,6,7,8,9])
#-4096
#>>> reduce(lambda x,y: x+x, [-2,-1,0,1,2,3,4,5,6,7,8,9,10])
#-8192

#初項1
#要素数-1
#>>> reduce(lambda x,y: x+x, [1])
#1
#>>> reduce(lambda x,y: x+x, [1,2])
#2
#>>> reduce(lambda x,y: x+x, [1,2,3])
#4
#>>> reduce(lambda x,y: x+x, [1,2,3,4])
#8
#>>> reduce(lambda x,y: x+x, [1,2,3,4,5])
#16
#>>> reduce(lambda x,y: x+x, [1,2,3,4,5,6])
#32
#>>> reduce(lambda x,y: x+x, [1,2,3,4,5,6,7])
#64
#>>> reduce(lambda x,y: x+x, [1,2,3,4,5,6,7,8])
#128
#>>> reduce(lambda x,y: x+x, [1,2,3,4,5,6,7,8,9])
#256
#>>> reduce(lambda x,y: x+x, [1,2,3,4,5,6,7,8,9,10])
#512

#初項-10
#要素数-1
#>>> reduce(lambda x,y: x+x, [-10])
#-10
#>>> reduce(lambda x,y: x+x, [-10,0])
#-20
#>>> reduce(lambda x,y: x+x, [-10,0,0])
#-40
#>>> reduce(lambda x,y: x+x, [-10,0,0,0])
#-80
#>>> reduce(lambda x,y: x+x, [-10,0,0,0,0])
#-160
#>>> reduce(lambda x,y: x+x, [-10,0,0,0,0,0])
#-320
#>>> reduce(lambda x,y: x+x, [-10,0,0,0,0,0,0])
#-640
#>>> reduce(lambda x,y: x+x, [-10,0,0,0,0,0,0,0])
#-1280
#>>> reduce(lambda x,y: x+x, [-10,0,0,0,0,0,0,0,0])
#-2560
#>>> reduce(lambda x,y: x+x, [-10,0,0,0,0,0,0,0,0,0])
#-5120

引数のy,xのうち、左側が前回の計算結果で今回の引数から前回の計算結果を足し算している
>>> reduce(lambda y,x: x+y, [0])
0
>>> reduce(lambda y,x: x+y, [0,1])
1
>>> reduce(lambda y,x: x+y, [0,1,2])
3
>>> reduce(lambda y,x: x+y, [0,1,2,3])
6
>>> reduce(lambda y,x: x+y, [0,1,2,3,4])
10
>>> reduce(lambda y,x: x+y, [0,1,2,3,4,5])
15
>>> reduce(lambda y,x: x+y, [0,1,2,3,4,5,6])
21
>>> reduce(lambda y,x: x+y, [0,1,2,3,4,5,6,7])
28
>>> reduce(lambda y,x: x+y, [0,1,2,3,4,5,6,7,8])
36
>>> reduce(lambda y,x: x+y, [0,1,2,3,4,5,6,7,8,9])
45
>>> reduce(lambda y,x: x+y, [0,1,2,3,4,5,6,7,8,9,10])
55

引数のy,xのうち、左側が前回の計算結果で今回の引数から前回の計算結果を足し算している
>>> reduce(lambda y,x: x+y, [-2])
-2
>>> reduce(lambda y,x: x+y, [-2,-1])
-3
>>> reduce(lambda y,x: x+y, [-2,-1,0])
-3
>>> reduce(lambda y,x: x+y, [-2,-1,0,1])
-2
>>> reduce(lambda y,x: x+y, [-2,-1,0,1,2])
0
>>> reduce(lambda y,x: x+y, [-2,-1,0,1,2,3])
3
>>> reduce(lambda y,x: x+y, [-2,-1,0,1,2,3,4])
7
>>> reduce(lambda y,x: x+y, [-2,-1,0,1,2,3,4,5])
12
>>> reduce(lambda y,x: x+y, [-2,-1,0,1,2,3,4,5,6])
18
>>> reduce(lambda y,x: x+y, [-2,-1,0,1,2,3,4,5,6,7])
25
>>> reduce(lambda y,x: x+y, [-2,-1,0,1,2,3,4,5,6,7,8])
33
>>> reduce(lambda y,x: x+y, [-2,-1,0,1,2,3,4,5,6,7,8,9])
42
>>> reduce(lambda y,x: x+y, [-2,-1,0,1,2,3,4,5,6,7,8,9,10])
52

オペレータの順序を変えても結果が変わらないことを確認
>>> reduce(lambda x,y: y+x, [-2])
-2
>>> reduce(lambda x,y: y+x, [-2,-1])
-3
>>> reduce(lambda x,y: y+x, [-2,-1,0])
-3
>>> reduce(lambda x,y: y+x, [-2,-1,0,1])
-2
>>> reduce(lambda x,y: y+x, [-2,-1,0,1,2])
0
>>> reduce(lambda x,y: y+x, [-2,-1,0,1,2,3])
3
>>> reduce(lambda x,y: y+x, [-2,-1,0,1,2,3,4])
7
>>> reduce(lambda x,y: y+x, [-2,-1,0,1,2,3,4,5])
12


引数のy,xのうち、左側が前回の計算結果で今回の引数から前回の計算結果を引き算している
>>> reduce(lambda y,x: x-y, [-2])
-2
>>> reduce(lambda y,x: x-y, [-2,-1])
1
>>> reduce(lambda y,x: x-y, [-2,-1,0])
-1
>>> reduce(lambda y,x: x-y, [-2,-1,0,1])
2
>>> reduce(lambda y,x: x-y, [-2,-1,0,1,2])
0
>>> reduce(lambda y,x: x-y, [-2,-1,0,1,2,3])
3
>>> reduce(lambda y,x: x-y, [-2,-1,0,1,2,3,4])
1
>>> reduce(lambda y,x: x-y, [-2,-1,0,1,2,3,4,5])
4
>>> reduce(lambda y,x: x-y, [-2,-1,0,1,2,3,4,5,6])
2
>>> reduce(lambda y,x: x-y, [-2,-1,0,1,2,3,4,5,6,7])
5
>>> reduce(lambda y,x: x-y, [-2,-1,0,1,2,3,4,5,6,7,8])
3
>>> reduce(lambda y,x: x-y, [-2,-1,0,1,2,3,4,5,6,7,8,9])
6
>>> reduce(lambda y,x: x-y, [-2,-1,0,1,2,3,4,5,6,7,8,9,10])
4

>>> reduce(lambda x,y: y+y, [-2])
-2
>>> reduce(lambda x,y: y+y, [-2,-1])
-2
>>> reduce(lambda x,y: y+y, [-2,-1,0])
0
>>> reduce(lambda x,y: y+y, [-2,-1,0,1])
2
>>> reduce(lambda x,y: y+y, [-2,-1,0,1,2])
4
>>> reduce(lambda x,y: y+y, [-2,-1,0,1,2,3])
6
>>> reduce(lambda x,y: y+y, [-2,-1,0,1,2,3,4])
8
>>> reduce(lambda x,y: y+y, [-2,-1,0,1,2,3,4,5])
10
>>> reduce(lambda x,y: y+y, [-2,-1,0,1,2,3,4,5,6])
12
>>> reduce(lambda x,y: y+y, [-2,-1,0,1,2,3,4,5,6,7])
14

２つ引数が与えられていること期待しているが、単一の引数しか与えられなかった場合、その単一の引数を返却する。

>>> reduce(lambda x,y: y+y, [-2])
-2

x=-2,y=-1,y+y=(-1)+(-1)=-2

>>> reduce(lambda x,y: y+y, [-2,-1])
-2

引数が3つ以上与えられると前回の蓄積結果を参照する。
1
1+2
3+3

>>> reduce(lambda x,y: y+y, [-2,-1,0])
0
>>> reduce(lambda x,y: y+y, [-2,-1,0,1])
2
>>> reduce(lambda x,y: y+y, [-2,-1,0,1,2])
4
>>> reduce(lambda x,y: y+y, [-2,-1,0,1,2,3])
6
>>> reduce(lambda x,y: y+y, [-2,-1,0,1,2,3,4])
8
>>> reduce(lambda x,y: y+y, [-2,-1,0,1,2,3,4,5])
10
>>> reduce(lambda x,y: y+y, [-2,-1,0,1,2,3,4,5,6])
12
>>> reduce(lambda x,y: y+y, [-2,-1,0,1,2,3,4,5,6,7])
14

引数のうち左側が前回蓄積結果,蓄積した結果0に戻している

>>> reduce(lambda x,y: y+y+y, [-2,-1])
-3
>>> reduce(lambda x,y: y+y+y, [-2,-1,0])
0
>>> reduce(lambda x,y: y+y+y, [-2,-1,0,1])
3
>>> reduce(lambda x,y: y+y+y, [-2,-1,0,1,2])
6
>>> reduce(lambda x,y: y+y+y, [-2,-1,0,1,2,3])
9
>>> reduce(lambda x,y: y+y+y, [-2,-1,0,1,2,3,4])
12

