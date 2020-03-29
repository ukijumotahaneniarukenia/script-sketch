import tables

var a = {1: "one", 2: "two"}.toTable  #エントリ作成
var b = a #エントリのコピー

echo a, b

echo len(a) #エントリ数の取得
echo len(b) #エントリ数の取得

b[3] = "three" #エントリの追加

b[2].add("うんこ") #指定したキーのエントリ値の更新

echo a, b

echo len(a) #エントリ数の取得
echo len(b) #エントリ数の取得


b.del(1) #エントリの削除

echo a, b

echo len(a) #エントリ数の取得
echo len(b) #エントリ数の取得


echo a.contains(1) #エントリの存在チェック
echo b.contains(1) #エントリの存在チェック


var aa = {'o': @[1, 5, 7, 9], 'e': @[2, 4, 6, 8]}.toTable


echo aa


for k in aa.keys:
  aa[k].add(99) #エントリ値が配列やと追加になる
  echo k,aa[k]
  for e in aa[k]:
    echo k,aa[k],e

let aaa = {'o': @[1, 5, 7, 9], 'e': @[2, 4, 6, 8]}.toTable
for v in aaa.values:
  echo v


for k,v in aaa.pairs: #エントリキーとエントリ値を同時に取得できる
  echo k,v
