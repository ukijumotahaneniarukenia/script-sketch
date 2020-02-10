#!/bin/bash

#debugするときは-Tつけるとわかりやすい、あと列追加

echo {a..d} | xargs -I@ egison -e '
  (
  match-all {@}
  (list string)
  [<join $x $xx> (concat{xx x})]
)
' | sed 's;{{;;;s;}};;;'| awk -vRS="} {" '{print $0}' | sed '/^$/d' | sed -n '$!p'

echo "================================================================================"
echo {a..d} | xargs -I@ egison -e '
  (
  match-all (reverse {@})
  (list string)
  [<join $x $xx> (concat{(reverse x) (reverse xx)})]
)
' | sed 's;{{;;;s;}};;;'| awk -vRS="} {" '{print $0}' | sed '/^$/d' | sed -n '$!p'

#echo {a..d} | xargs -I@ egison -T -e '
#  (
#  match-all (reverse {@})
#  (list string)
#  [<join $x $xx> {xx (reverse xx) x (reverse x)}]
#)
#' 
#| sed 's;{{;;;s;}};;;'| awk -vRS="} {" '{print $0}' | sed '/^$/d' | sed -n '$!p'
