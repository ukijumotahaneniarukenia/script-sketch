<?php
function f1($array)
{
    return array_map(function ($item) {
        return '!' . $item;
    }, array_filter($array, function ($item) {
        return ctype_lower($item[0]);
    }));
}
var_dump(f1(['Aa', 'bb', 'cC', 'DD']));
?>

//$php filter_map.php | sed 's;^//.*;;' | sed '/^$/d'
//array(2) {
//  [1]=>
//  string(3) "!bb"
//  [2]=>
//  string(3) "!cC"
//}
