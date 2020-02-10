#!/bin/bash

comb(){
  cnt=$1;shift;
  tgt=$@;
  seq $cnt | xargs -I@ echo @ $tgt |xargs -I% bash -c 'egison -T -e "(match-all (cdr {%})(list string)[(loop \$i [1 (car {%})] <join _ <cons \$x_i ...>> _) (map (lambda [\$i] x_i) (between 1 (car {%})))])"'
}
comb 4 {a..d}
