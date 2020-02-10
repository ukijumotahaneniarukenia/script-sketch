#!/bin/bash

#golf用
#echo 'U1f4a'{0..9}|xargs -I@ egison -e '(match-all(reverse {@})(list string)[<join $x $xx>(concat{(reverse x)(reverse xx)})])'|sed 's;{{;;;s;}};;;'|awk -vRS="} {" '{print $0}'|sed '/^$/d'|sed -n '$!p'|sed 's; ;\x27\; echo -ne \x27\\;g;s;^;echo -ne \x27\\;;s;$;\x27\;echo;;'|bash

#echo 'U1f4a'{0..9}|xargs -I@ egison -e '(match-all(reverse {@})(list string)[<join $x $xx>(concat{(reverse x)(reverse xx)})])'|sed 's;{{;;;s;}};;;'|awk -vRS="} {" 4 |sed '/^$/d'|sed -n '$!p'|sed 's; ;\x27\; echo -ne \x27\\;g;s;^;echo -ne \x27\\;;s;$;\x27\;echo;;'|bash

echo {a..d} | xargs -I@ egison -e '
echo -e 'U1f4a'{0..9} | xargs -I@ egison -e '
  (
  match-all (reverse {@})
  (list string)
  [<join $x $xx> (concat{(reverse x) (reverse xx)})]
)
' | sed 's;{{;;;s;}};;;'| awk -vRS="} {" '{print $0}' | sed '/^$/d' | sed -n '$!p' | \
sed 's; ;\x27\; echo -ne \x27\\;g;s;^;echo -ne \x27\\;;s;$;\x27\;echo;;' | bash
