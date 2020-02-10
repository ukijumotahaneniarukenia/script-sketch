function! Double(number)
        return a:number*2
endfunction

"関数の再定義が可能
function! Double(n1,n2)
        return a:n1*a:n2
endfunction

let rez=Double(10,9)
echo rez

function! GetRandom(mn,mx)
        return reltime()
endfunction

"エクスクラメーションマークを使用しないと関数の再定義ができない
function! GetRandom(mn,mx)
        return reltime()
endfunction

"reltime関数は
function! GetRandom()
        return reltime()
endfunction

function! GetRandom(start,end)
        return reltime(a:start,a:end)
endfunction

"reltime関数は
function! GetRandom()
        "UNIX時刻を返却
        return reltime()[0]
endfunction

"reltime関数は
function! GetRandom()
        "マイクロ秒を返却
        return reltime()[1]
endfunction

"reltime関数は
function! GetRandom(start,end)
        "マイクロ秒を返却
        return a:end-a:start
endfunction

"reltime関数は
function! GetRandom(start,end)
        "マイクロ秒を返却
        return a:end-a:start+1
endfunction

"reltime関数は
function! GetRandom(start,end)
        "マイクロ秒を返却
        return a:end-a:start+1+a:start
endfunction

"reltime関数は
function! GetRandom(start,end)
        "マイクロ秒を返却
        return a:end%a:start
endfunction

"最終的な関数
function! GetRandom(start,end)
        "マイクロ秒を返却
        return reltime()[1]%(a:end-a:start+1)+a:start
endfunction

"ランダムな日付時刻を取得する関数
function! GetRandomDate()
        "マイクロ秒を返却
        return GetRandom(1980,2024) . '-' . GetRandom(1,12) . '-' . GetRandom(1,28)
endfunction

"ランダムな日付時刻を取得する関数
function! GetRandomDateTime()
        "マイクロ秒を返却
        return GetRandomDate() . ' ' . GetRandom(0,23) . ':' . GetRandom(0,59) . ':' . GetRandom(0,59)
endfunction

echo GetRandomDate()
echo GetRandomDateTime()
