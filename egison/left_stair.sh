#!/bin/bash

#golf用
#echo 'U1f4a'{0..9}|xargs -I@ egison -e '(match-all{@}(list string)[<join $x $xx>(concat{xx x})])'|sed 's;{{;;;s;}};;;'|awk -vRS="} {" 4|sed '/^$/d'|sed -n '$!p'|sed 's; ;\x27\; echo -ne \x27\\;g;s;^;echo -ne \x27\\;;s;$;\x27\;echo;;'|bash

#echo -e 'U1f4a'{0..9} | xargs -I@ egison -e '
#  (
#  match-all {@}
#  (list string)
#  [<join $x $xx> (concat{xx x})]
#)
#' | sed 's;{{;;;s;}};;;'| awk -vRS="} {" '{print $0}' | sed '/^$/d' | sed -n '$!p' | sed 's; ;\x27\; echo -ne \x27\\;g;s;^;echo -ne \x27\\;;s;$;\x27\;echo;;' | bash
