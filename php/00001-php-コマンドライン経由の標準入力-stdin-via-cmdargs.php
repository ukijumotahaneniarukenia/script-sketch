<?php
function split($tgt): Array{
    return explode("\n", $tgt);
  }
  
// print_r(count(preg_grep("/\n/", $argv)));

if(0==count(preg_grep("/\n/", $argv))) {
    print_r($argv); 
}else{
    print_r(array_map('split',$argv)[1]);
}