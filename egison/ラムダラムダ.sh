#!/bin/bash

#型確認
echo {a..d} | xargs -I% egison -e '
(string? %)
'

#文字列型として認識するためにはダブルクォートで囲む
echo {a..d} | xargs -I% egison -e '
(string? "%")
'

#型確認
echo {a..d} | xargs -I% egison -e '
(collection? %)
'

#文字列からコレクション型に
echo {a..d} | xargs -I% egison -e '
(split-string " " "%")
'

#型確認
echo {a..d} | xargs -I% egison -e '
(collection? (split-string " " "%"))
'

#変数名にアンスコ使えない
echo {a..d} | xargs -I% egison -e '
((lambda [$rsvargs] rsvargs) (split-string " " "%"))
'

#与えられた引数の先頭要素を返却
echo {a..d} | xargs -I% egison -e '
((lambda [$rsvargs] (car rsvargs)) (split-string " " "%"))
'

#与えられた引数の先頭要素以外を返却
echo {a..d} | xargs -I% egison -e '
((lambda [$rsvargs] (cdr rsvargs)) (split-string " " "%"))
'

#与えられた引数の末尾要素を返却
echo {a..d} | xargs -I% egison -e '
((lambda [$rsvargs] (rac rsvargs)) (split-string " " "%"))
'

#与えられた引数の末尾要素以外を返却
echo {a..d} | xargs -I% egison -e '
((lambda [$rsvargs] (rdc rsvargs)) (split-string " " "%"))
'

#複数要素を返却できない。単一要素のみ返却できる。
#そのためグルーピングして返却すること。
echo {a..d} | xargs -I% egison -e '
((lambda [$rsvargs] {(car rsvargs) (car rsvargs)}) (split-string " " "%"))
'

#コレクションの入れ子ができる
echo {a..d} | xargs -I% egison -e '
((lambda [$rsvargs] {(car rsvargs) (cdr rsvargs)}) (split-string " " "%"))
'

#コレクションの入れ子ができる。入れ子の展開
echo {a..d} | xargs -I% egison -e '
((lambda [$rsvargs] {(car rsvargs) @(cdr rsvargs)}) (split-string " " "%"))
'
