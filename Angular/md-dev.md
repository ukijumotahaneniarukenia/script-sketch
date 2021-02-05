
```
$ sudo npm install -g @angular/cli
npm WARN deprecated request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
npm WARN deprecated har-validator@5.1.5: this library is no longer supported
/usr/local/bin/ng -> /usr/local/lib/node_modules/@angular/cli/bin/ng

> @angular/cli@11.1.3 postinstall /usr/local/lib/node_modules/@angular/cli
> node ./bin/postinstall/script.js

? Would you like to share anonymous usage data with the Angular Team at Google under
Google’s Privacy Policy at https://policies.google.com/privacy? For more details and
how to change this setting, see http://angular.io/analytics. No
```


```
$ ng new app
? Do you want to enforce stricter type checking and stricter bundle budgets in the workspace?
  This setting helps improve maintainability and catch bugs ahead of time.
  For more information, see https://angular.io/strict No
? Would you like to add Angular routing? Yes
? Which stylesheet format would you like to use? CSS
CREATE app/README.md (1012 bytes)
CREATE app/.editorconfig (274 bytes)
CREATE app/.gitignore (631 bytes)
CREATE app/angular.json (3511 bytes)
CREATE app/package.json (1193 bytes)
CREATE app/tsconfig.json (538 bytes)
CREATE app/tslint.json (3185 bytes)
CREATE app/.browserslistrc (703 bytes)
CREATE app/karma.conf.js (1420 bytes)
CREATE app/tsconfig.app.json (287 bytes)
CREATE app/tsconfig.spec.json (333 bytes)
CREATE app/src/favicon.ico (948 bytes)
CREATE app/src/index.html (289 bytes)
CREATE app/src/main.ts (372 bytes)
CREATE app/src/polyfills.ts (2830 bytes)
CREATE app/src/styles.css (80 bytes)
CREATE app/src/test.ts (753 bytes)
CREATE app/src/assets/.gitkeep (0 bytes)
CREATE app/src/environments/environment.prod.ts (51 bytes)
CREATE app/src/environments/environment.ts (662 bytes)
CREATE app/src/app/app-routing.module.ts (245 bytes)
CREATE app/src/app/app.module.ts (393 bytes)
CREATE app/src/app/app.component.css (0 bytes)
CREATE app/src/app/app.component.html (25757 bytes)
CREATE app/src/app/app.component.spec.ts (1048 bytes)
CREATE app/src/app/app.component.ts (207 bytes)
CREATE app/e2e/protractor.conf.js (904 bytes)
CREATE app/e2e/tsconfig.json (274 bytes)
CREATE app/e2e/src/app.e2e-spec.ts (654 bytes)
CREATE app/e2e/src/app.po.ts (274 bytes)
✔ Packages installed successfully.
    Directory is already under version control. Skipping initialization of git.
```


```
$ ng serve
✔ Browser application bundle generation complete.

Initial Chunk Files | Names         |      Size
vendor.js           | vendor        |   2.68 MB
polyfills.js        | polyfills     | 127.65 kB
main.js             | main          |  58.12 kB
runtime.js          | runtime       |   6.15 kB
styles.css          | styles        | 119 bytes

                    | Initial Total |   2.87 MB

Build at: 2021-02-05T03:11:00.373Z - Hash: 4485ec79cd1065e59cb9 - Time: 4117ms

** Angular Live Development Server is listening on localhost:4200, open your browser on http://localhost:4200/ **


✔ Compiled successfully.
```



```
$ ng new app --minimal
? Do you want to enforce stricter type checking and stricter bundle budgets in the workspace?
  This setting helps improve maintainability and catch bugs ahead of time.
  For more information, see https://angular.io/strict No
? Would you like to add Angular routing? Yes
? Which stylesheet format would you like to use? CSS
CREATE app/README.md (1012 bytes)
CREATE app/.gitignore (631 bytes)
CREATE app/angular.json (3018 bytes)
CREATE app/package.json (751 bytes)
CREATE app/tsconfig.json (538 bytes)
CREATE app/.browserslistrc (703 bytes)
CREATE app/tsconfig.app.json (287 bytes)
CREATE app/src/favicon.ico (948 bytes)
CREATE app/src/index.html (289 bytes)
CREATE app/src/main.ts (372 bytes)
CREATE app/src/polyfills.ts (2830 bytes)
CREATE app/src/styles.css (80 bytes)
CREATE app/src/assets/.gitkeep (0 bytes)
CREATE app/src/environments/environment.prod.ts (51 bytes)
CREATE app/src/environments/environment.ts (662 bytes)
CREATE app/src/app/app-routing.module.ts (245 bytes)
CREATE app/src/app/app.module.ts (393 bytes)
CREATE app/src/app/app.component.ts (1478 bytes)
✔ Packages installed successfully.
    Directory is already under version control. Skipping initialization of git.
```


```
$ ng serve
Compiling @angular/core : es2015 as esm2015
Compiling @angular/common : es2015 as esm2015
Compiling @angular/platform-browser : es2015 as esm2015
Compiling @angular/router : es2015 as esm2015
Compiling @angular/platform-browser-dynamic : es2015 as esm2015
✔ Browser application bundle generation complete.

Initial Chunk Files | Names         |      Size
vendor.js           | vendor        |   2.68 MB
polyfills.js        | polyfills     | 127.65 kB
main.js             | main          |  13.15 kB
runtime.js          | runtime       |   6.15 kB
styles.css          | styles        | 119 bytes

                    | Initial Total |   2.82 MB

Build at: 2021-02-05T03:18:15.753Z - Hash: 86306299bbf135dcb0ea - Time: 9487ms

** Angular Live Development Server is listening on localhost:4200, open your browser on http://localhost:4200/ **


✔ Compiled successfully.
✔ Browser application bundle generation complete.

Initial Chunk Files | Names  |      Size
styles.css          | styles | 119 bytes

4 unchanged chunks

Build at: 2021-02-05T03:18:16.183Z - Hash: 48652b88490cfb739511 - Time: 170ms

✔ Compiled successfully.
```
