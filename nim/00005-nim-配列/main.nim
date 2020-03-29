let x = [1, 2, 3, 4, 5, 6]  # 数値配列
let y = @[1, 2, 3, 4, 5, 6] # 数値配列seq
let z = [1.0, 2, 3, 4] # 細かい精度に寄せられる #letで型推論ぽい



echo x

echo x[0] #データ取得

echo low(x) #指定した配列の最小インデックスを取得
echo high(x) #指定した配列の最大インデックスを取得

echo x[4] #データ取得


echo x[high(x)] #データ取得


echo typeof(x) #IntArray

echo y

echo low(y) #指定した配列の最小インデックスを取得
echo high(y) #指定した配列の最大インデックスを取得
echo typeof(y)


echo z



echo typeof(z)


let s = ["a","b","cc"]  # 文字列配列

for i in low(s) .. high(s):
  if s[i] == "a":
    echo "うんこ"
  else:
    echo "うんこじゃない"
  echo s[i]

echo s

echo typeof(s)
