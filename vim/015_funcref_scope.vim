function! Mock1()
  echo "Mock1"
endfunction

try
  let ref=function("Mock1")
catch
  "E704: Funcref variable name must start with a capital: ref
  echomsg "関数参照の変数名は大文字で始める必要があるよ"
endtry

"現在のスクリプトファイルでローカル
let s:ref=function("Mock1")
echo s:ref
echo string(s:ref)

"E704: Funcref variable name must start with a capital: g:ref
"let g:ref=function("Mock1")

"現在のバッファにローカル
let b:ref=function("Mock1")
echo b:ref
echo string(b:ref)

"現在のウィンドウにローカル
let w:ref=function("Mock1")
echo w:ref
echo string(w:ref)

"現在のタブページにローカル
let t:ref=function("Mock1")
echo t:ref
echo string(t:ref)

"関数ローカル
"let l:ref=function("Mock1")
"E461: Illegal variable name: l:ref

"let v:ref=function("Mock1")
"E704: Funcref variable name must start with a capital: v:ref
