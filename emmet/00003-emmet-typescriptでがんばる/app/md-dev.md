```
$ mkdir -p 00003-emmet-typescriptでがんばる


$ cd 00003-emmet-typescriptでがんばる


$ mkdir -p app


$ cd app/


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



$ tsc a.ts 

$ ls a.*
a.js  a.ts


$ node a.js
<p><a href=""></a></p>
```
