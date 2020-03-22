let sum = { "value" : 0}
function! sum.call(index, value)
    let self.value += a:value
    return a:value
endfunction

call map(range(1, 10), sum.call)
echo sum.value
echo range(1, 10)
