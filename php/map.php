<?php
  $array=[1,2,3,4,5];
  $b=[];
  foreach($array as $ele){
    echo $ele,"\n";
    $b[$ele]=$ele+1;
  }
  echo $b,"\n";
  echo gettype($b),"\n";
  echo gettype(gettype($b)),"\n";

  foreach($b as $ele){
    echo $ele,"\n";
  }
?>

//[sqlite❤29231fdc7920 (月 10月 28 15:49:13) ~/script_scratch/php]$php map.php
//1
//2
//3
//4
//5
//PHP Notice:  Array to string conversion in /home/sqlite/script_scratch/php/map.php on line 8
//Array
//array
//string

//1
//2
//3
//4
//5
//PHP Notice:  Array to string conversion in /home/sqlite/script_scratch/php/map.php on line 8
//Array
//array
//string
//2
//3
//4
//5
//6
