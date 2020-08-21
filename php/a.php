<?php
$array = [
  "a" => 1,
  "b" => [
    "A" => 2,
    "B" => 3,
    "C" => 4,
  ],
  "c" => 5,
] ;


$xml = new SimpleXMLElement('<root/>');

function callback( $value, $key, $c ) {
  #echo "キーは、" . $key . "、" . $c . "です。" . "\n" ;
  #echo "バリューは、" . $value . "、" . $c . "です。" . "\n" ;
#Array
#(
#    [1] => a
#)



  print_r ( array($value=>$key));

#Array
#(
#    [a] => 1
#)

  print_r ( array_flip(array($value=>$key)));



}

$response = array_walk_recursive( $array, "callback", "custom" ) ;
