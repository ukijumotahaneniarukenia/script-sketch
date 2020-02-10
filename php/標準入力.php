<?php

function split($tgt): Array{
  return explode(" ", $tgt);
}

#https://qiita.com/yuhei_umeda/items/552c3f2f19e55f80fdfb
#https://www.php.net/manual/ja/function.explode.php
#$array = array_map('trim', file('php://stdin'));
$array = array_map('split', file('php://stdin'));
print_r($array);

print_r($array[0]);
