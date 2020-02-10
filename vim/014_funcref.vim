function! Mock1()
  return "Mock1"
endfunction

function! Mock2(n,s)
  return "Mock2 param" . "[n:" . a:n . "],[s:" . a:s ."]"
endfunction

"引数なしファンクションの実行
let RefMock1=function("Mock1")
echo call(RefMock1,[])

"引数ありファンクションの実行
let RefMock2=function("Mock2")
echo call(RefMock2,[1,"unko"])

"ファンクション名の取得
"同一変数名の再代入はいける
let RefMock1=function("Mock1")

echo string(RefMock1)
echo RefMock1


