#!/bin/bash

echo {a..d} | xargs -I{} perl -E '
  my @array=qw({});
  my(\$first,@remain)=@array;
  print(join(",",@array),"\n");
  for(@remain){
    print(join(",",@remain,\$first),"\n");
    push(@remain,\$first);
    \$first=shift(@remain);
  }
)'
