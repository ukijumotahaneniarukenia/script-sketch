let number=1
let string="hoge"
let num_ary=[1,2,3,4]
let str_ary=["a","b","c","d"]

function Unko()
  return "UNKO"
endfunction

let Func_ref=function("Unko")

"echo Func_ref

let dict={"a":1,"b":2}

echo dict["a"]

let dict["c"]=3

echo dict

echo keys(dict)

for key in keys(dict)
  echo key
endfor

for key in sort(keys(dict))
  echo key
endfor

for val in values(dict)
  echo val
endfor

for [key,value] in items(dict)
  echo key ."    " .value
endfor

"let nestdict = {1: {11: 'a', 12: 'b'}, 2: {21: 'c'}}

"echo nestdict

"変数表示
"echo number
"echo string
"echo str_ary
"echo num_ary
"echo num_ary[0]
"echo num_ary[1]
"echo num_ary[2]
"echo num_ary[3]
"
"
"echo str_ary[0]
"echo str_ary[1]
"echo str_ary[2]
"echo str_ary[3]
