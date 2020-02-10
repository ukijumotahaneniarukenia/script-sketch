"https://stackoverflow.com/questions/4964772/string-formatting-padding-in-vim
function! Rpad(s,rep,sep)
        return a:s . repeat(a:sep,a:rep-len(a:s))
endfunction

function! Lpad(s,rep,sep)
        return repeat(a:sep,a:rep-len(a:s)) . a:s
endfunction

echo Rpad('abc',5,0)
echo Lpad('abc',6,"#")
