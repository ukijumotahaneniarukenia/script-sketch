#!/bin/bash

#echo {a..d} | xargs -I@ egison -T -e '(match-all {@}(list string)[(loop $i [1 2] <join _ <cons $x_i ...>> _) (map (lambda [$i] x_i) (between 1 2))])'

#echo {a..d} | xargs -I@ egison -e "(match-all {@}(list string)[(loop \$i [1 2] <join _ <cons \$x_i ...>> _) (map (lambda [\$i] x_i) (between 1 2))])"

#echo {a..d} | xargs -I% bash -c 'declare -a args=(%);echo ${args[@]};egison -e "(match-all {%}(list string)[(loop \$i [1 2] <join _ <cons \$x_i ...>> _) (map (lambda [\$i] x_i) (between 1 2))])"'

#echo {a..d} | xargs -I% bash -c 'declare -a args=(%);echo ${args[@]:0:1};egison -e "(match-all {%}(list string)[(loop \$i [1 2] <join _ <cons \$x_i ...>> _) (map (lambda [\$i] x_i) (between 1 2))])"'
#
#echo 2 {a..d} | \
#  xargs -t -I% bash -c 'declare -a args=(%);echo ${args[@]:0:1};egison -e "(match-all (cdr {%})(list string)[(loop \$i [1 ${args[@]:0:1}] <join _ <cons \$x_i ...>> _) (map (lambda [\$i] x_i) (between 1 ${args[@]:0:1}))])"'

#echo 2 {a..d} | \
#  xargs -I% bash -c 'declare -a args=(%);egison -e "(match-all (cdr {%})(list string)[(loop \$i [1 ${args[@]:0:1}] <join _ <cons \$x_i ...>> _) (map (lambda [\$i] x_i) (between 1 ${args[@]:0:1}))])"'
#
#echo 2 {a..d} | \
#  xargs -I% bash -c 'declare -a args=(%);egison -T -e "(match-all (cdr {%})(list string)[(loop \$i [1 ${args[@]:0:1}] <join _ <cons \$x_i ...>> _) (map (lambda [\$i] x_i) (between 1 ${args[@]:0:1}))])"' | sort

echo -e 2 '\\U1f4a'{6..9}|xargs -I% bash -c 'declare -a args=(%);egison -T -e "(match-all (cdr {%})(list string)[(loop \$i [1 ${args[@]:0:1}] <join _ <cons \$x_i ...>> _) (map (lambda [\$i] x_i) (between 1 ${args[@]:0:1}))])"'|sort |sed 's;\t;\x27\; echo -ne \x27\\;g;s;^;echo -ne \x27\\;;s;$;\x27\;echo;' |bash
