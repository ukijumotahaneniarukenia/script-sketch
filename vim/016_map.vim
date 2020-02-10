let dict={"a":100,"b":200}


for [key,value] in items(dict)
  echo key ."    " .value
endfor

"dictに第二引数で与えたkeyを持つ場合は1をない場合は0を返却
echo has_key(dict,"c")


let dict1 = {}

"dictに含まれる要素がない場合はlen関数をしようしていく
echo len(dict1)

"dictに含まれる要素がなくてもempty関数は1を返却してくる
echo empty(dict1)

"dictに含まれる要素のうち、最大のvalue値を返却
echo max(dict)

"dictに含まれる要素のうち、最小のvalue値を返却
echo min(dict)

"第２引数に与えた値がvalueに発見された件数を返却する
echo count(dict,"a")

"
echo string(dict)


"map関数あった

call map(dict, '">> " . v:val')


echo dict
