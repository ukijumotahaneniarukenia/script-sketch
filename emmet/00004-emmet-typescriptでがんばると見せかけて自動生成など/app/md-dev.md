```
$ mkdir -p 00004-emmet-typescriptでがんばると見せかけて自動生成など


$ cd 00004-emmet-typescriptでがんばると見せかけて自動生成など


$ mkdir -p app


$ cd app/

$ curl https://raw.githubusercontent.com/ukijumotahaneniarukenia/script-sketch/master/emmet/emmet-html-snippet-pretty.tsv | awk -v FS="\t" '{print $1,$2,$4}' >list.txt

自動生成

$ cat list.txt  | head | while read grp grpseq cmd;do sed "s/TOBE_REPLACE/$cmd/" template.ts > $grp-$grpseq.ts;done

$ npm init -y


$ npm install emmet


$ sudo npm install -g typescript

$ sudo npm install -g @types/typescript


$ tsc a.ts
node_modules/emmet/dist/src/stylesheet/index.d.ts:4:38 - error TS2307: Cannot find module './scope' or its corresponding type declarations.

4 import { CSSAbbreviationScope } from './scope';
                                       ~~~~~~~~~


Found 1 error.



$ npm install scope
npm WARN app@1.0.0 No description
npm WARN app@1.0.0 No repository field.

+ scope@0.10.1
added 1 package from 1 contributor and audited 8 packages in 1.883s
found 0 vulnerabilities



修正前
import { CSSAbbreviationScope } from './scope';


修正後
import { CSSAbbreviationScope } from '../../../../scope';


ソースリスト確認
$ ls QH* | grep -v js
QH001-001.ts
QH001-002.ts
QH002-001.ts
QH002-002.ts
QH002-003.ts
QH002-004.ts
QH002-005.ts
QH002-006.ts
QH002-007.ts
QH002-008.ts

$ ls QH* | grep -v js | wc -l
147

$ time ls QH* | grep -v js | xargs -I@ tsc @

real	2m53.786s
user	5m13.963s
sys	0m7.552s



トランスパイル

$ ls QH* | grep -v js | xargs -I@ tsc @


エラーチェック
$ ls *js | while read f;do node $f 2>/dev/null;{ echo -ne $?"\n";echo $f;}|xargs -n2;done | tee >(grep -P '^1'>stderr.txt) >(grep -P '^0'>stdout.txt)

出力内容の保存

$ ls *js | while read f;do node $f 2>/dev/null >$f.html;done
```

