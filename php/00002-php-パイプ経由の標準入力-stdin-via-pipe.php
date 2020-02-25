<?php

function split($tgt): Array{
  return explode(" ", $tgt);
}

$array = array_map('split', file('php://stdin'));
print_r($array);

print_r($array[0]);