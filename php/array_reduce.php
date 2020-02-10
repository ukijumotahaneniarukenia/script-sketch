<?php
function f2($array)
{
    return array_reduce($array, function ($carry, $item) {
        if (ctype_lower($item[0])) {
            $carry[] = '!' . $item;
        }
        return $carry;
    }, []);
}
var_dump(f2(['Aa', 'bb', 'cC', 'DD']));
?>

//$php array_reduce.php | sed 's;^//.*;;' | sed '/^$/d'
//array(2) {
//  [0]=>
//  string(3) "!bb"
//  [1]=>
//  string(3) "!cC"
//}
