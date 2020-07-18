- プロジェクト作成

```
$ cd ~/script-sketch/TypeScript

$ mkdir -p 00001-TypeScript-jestでテスト

$ mkdir -p 00001-TypeScript-jestでテスト/app

$ mkdir -p 00001-TypeScript-jestでテスト/app/{src,test}

$ cd 00001-TypeScript-jestでテスト/app

$ npm init -y

$ echo '/node_modules/*' >.gitignore

$ npm install --save-dev typescript jest @types/jest ts-jest

$ cat <<EOS >ts-config.json
{
  "compilerOptions": {
    "target": "es6",
    "module": "commonjs",
    "outDir": "./dist",
    "strict": true,
    "esModuleInterop": true,
    "sourceMap": true
  },
  "include": [
    "./src/**/*.ts"
  ]
}
EOS

--修正前
{
  "name": "app",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "directories": {
    "test": "test"
  },
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "@types/jest": "^26.0.4",
    "jest": "^26.1.0",
    "ts-jest": "^26.1.3",
    "typescript": "^3.9.7"
  }
}


--修正後


$ cat package.json 
{
  "name": "app",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "directories": {
    "test": "test"
  },
  "scripts": {
    "test": "jest"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "@types/jest": "^26.0.4",
    "jest": "^26.1.0",
    "ts-jest": "^26.1.3",
    "typescript": "^3.9.7"
  },
  "jest": {
    "moduleFileExtensions": [
      "ts",
      "js"
    ],
    "transform": {
      "^.+\\.ts$": "ts-jest"
    },
    "globals": {
      "ts-jest": {
        "tsConfig": "ts-config.json"
      }
    },
    "testMatch": [
      "**/test/**/*-test.ts"
    ]
  }
}

```

テスト実行

```
$ npm test

> app@1.0.0 test /home/kuraine/script-sketch/TypeScript/00001-TypeScript-jestでテスト/app
> jest

 FAIL  test/greet-test.ts
  greet-NG
    ✕ should say hello to Tom. (4 ms)
  greet-OK
    ✓ should say hello to Tom.
    ✕ should say hello to Tom. (1 ms)

  ● greet-NG › should say hello to Tom.

    expect(received).toBe(expected) // Object.is equality

    Expected: "へろー, Tom!"
    Received: "Hello, Tom!"

       7 |     test('should say hello to Tom.', (): void => {
       8 |         const response: string = greet('Tom');
    >  9 |         expect(response).toBe('へろー, Tom!');
         |                          ^
      10 |     });
      11 | })
      12 | 

      at Object.<anonymous> (test/greet-test.ts:9:26)

  ● greet-OK › should say hello to Tom.

    expect(received).toBe(expected) // Object.is equality

    Expected: "Hi, Tom!"
    Received: "Hello, Tom!"

      22 |     test('should say hello to Tom.', (): void => {
      23 |         const response: string = greet('Tom');
    > 24 |         expect(response).toBe('Hi, Tom!');
         |                          ^
      25 |     });
      26 | })
      27 | 

      at Object.<anonymous> (test/greet-test.ts:24:26)

Test Suites: 1 failed, 1 total
Tests:       2 failed, 1 passed, 3 total
Snapshots:   0 total
Time:        1.615 s
Ran all test suites.
npm ERR! Test failed.  See above for more details.
```

