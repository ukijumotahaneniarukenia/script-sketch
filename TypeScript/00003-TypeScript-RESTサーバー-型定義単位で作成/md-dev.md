- https://docs.nestjs.com/first-steps

- https://docs.nestjs.com/controllers

- https://docs.nestjs.com/providers

- https://docs.nestjs.com/modules

```
$ mkdir -p 00003-TypeScript-RESTサーバー-型定義単位で作成

$ cd 00003-TypeScript-RESTサーバー-型定義単位で作成

$ sudo npm install -g @nestjs/cli

$ nest new my-app
⚡  We will scaffold your app in a few seconds..

CREATE my-app/.eslintrc.js (599 bytes)
CREATE my-app/.prettierrc (51 bytes)
CREATE my-app/README.md (3370 bytes)
CREATE my-app/nest-cli.json (64 bytes)
CREATE my-app/package.json (1888 bytes)
CREATE my-app/tsconfig.build.json (97 bytes)
CREATE my-app/tsconfig.json (339 bytes)
CREATE my-app/src/app.controller.spec.ts (617 bytes)
CREATE my-app/src/app.controller.ts (274 bytes)
CREATE my-app/src/app.module.ts (249 bytes)
CREATE my-app/src/app.service.ts (142 bytes)
CREATE my-app/src/main.ts (208 bytes)
CREATE my-app/test/app.e2e-spec.ts (630 bytes)
CREATE my-app/test/jest-e2e.json (183 bytes)

? Which package manager would you ❤️  to use? npm
✔ Installation in progress... ☕

🚀  Successfully created project my-app
👉  Get started with the following commands:

$ cd my-app

$ npm install

$ npm start

$ firefox http://localhost:3000

$ chrome http://localhost:3000
```



ディレクトリをほっていく



```
$ nest new my-app

$ cd my-app/

コントローラの作成

$ nest g controller cats
CREATE src/cats/cats.controller.spec.ts (479 bytes)
CREATE src/cats/cats.controller.ts (97 bytes)
UPDATE src/app.module.ts (322 bytes)

$ npm start

$ curl http://localhost:3000/cats
This action returns all cats

サービスの作成
$ nest g service cats
CREATE src/cats/cats.service.spec.ts (446 bytes)
CREATE src/cats/cats.service.ts (88 bytes)
UPDATE src/app.module.ts (386 bytes)


インターフェースの作成
$ mkdir -p src/cats/interface
$ touch src/cats/interface/cat.interface.ts

DTOの作成

$ mkdir -p src/cats/dto
$ touch src/cats/dto/create-cat.dto.ts
$ touch src/cats/dto/update-cat.dto.ts

$ curl http://localhost:3000/cats
[]
$ curl -X POST localhost:3000/cats -H 'Content-Type:application/json' -d '{"name":"うんこ", "age": 1, "breed":"ベンガル猫"}'

$ curl http://localhost:3000/cats
[{"name":"うんこ","age":1,"breed":"ベンガル猫"}]

$ curl -X POST localhost:3000/cats -H 'Content-Type:application/json' -d '{"name":"森鴎外", "age": 1, "breed":"ベンガル猫"}'

$ curl http://localhost:3000/cats
[{"name":"うんこ","age":1,"breed":"ベンガル猫"},{"name":"森鴎外","age":1,"breed":"ベンガル猫"}]




```
