- プロジェクト作成

```
$ cd ~/script-sketch/lodash

$ mkdir -p 00002-lodash-トランスパイルしてから実行する

$ mkdir -p 00002-lodash-トランスパイルしてから実行する/app

$ mkdir -p 00002-lodash-トランスパイルしてから実行する/app/src

$ cd 00002-lodash-トランスパイルしてから実行する/app

$ npm init -y

$ echo '/node_modules/*' >.gitignore

$ npm install --save-dev ts-node typescript

$ npm install --save-dev lodash

$ npm install --save-dev @types/lodash

$ cat <<EOS >tsconfig.json
{
  "compilerOptions": {
    "esModuleInterop": true
  }
}
EOS

```

- トランスパイル


```
$ tsc src/main.ts

Command 'tsc' not found, but can be installed with:

apt install node-typescript
Please ask your administrator.

```


```
sudo apt install -y node-typescript
```

```
$ tsc src/main.ts
node_modules/@types/lodash/common/collection.d.ts(1783,24): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/collection.d.ts(1805,46): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/collection.d.ts(1827,46): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(818,12): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(827,12): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(837,12): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(848,12): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(853,45): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(870,34): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(878,34): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(887,34): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(897,34): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(902,43): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(916,34): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(924,34): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(933,34): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(943,34): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(948,43): error TS2304: Cannot find name 'NonNullable'.
node_modules/@types/lodash/common/object.d.ts(1689,12): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(1706,12): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(1723,12): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(1740,12): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(1817,12): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(1841,12): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(1865,12): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(1874,12): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(1898,12): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(1974,34): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(1998,34): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(2022,34): error TS2304: Cannot find name 'Exclude'.
node_modules/@types/lodash/common/object.d.ts(2046,34): error TS2304: Cannot find name 'Exclude'.
src/main.ts(1,8): error TS1192: Module '"/home/kuraine/script-sketch/lodash/00002-lodash-トランスパイルしてから実行する/app/node_modules/@types/lodash/index"' has no default export.

```

- トランスパイルの成果物

```
$ cd src/
$ ls
main.js  main.ts
```

- 実行

```
$ node src/main.js
[ 'カレー', 'うんこ', 'メロン', 'オレンジ', 'りんご', 'すいか' ]
/home/kuraine/script-sketch/lodash/00002-lodash-トランスパイルしてから実行する/app/src/main.js:6
console.log(lodash_1["default"].shuffle(item));
                                ^

TypeError: Cannot read property 'shuffle' of undefined
    at Object.<anonymous> (/home/kuraine/script-sketch/lodash/00002-lodash-トランスパイルしてから実行する/app/src/main.js:6:33)
    at Module._compile (internal/modules/cjs/loader.js:1138:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:1158:10)
    at Module.load (internal/modules/cjs/loader.js:986:32)
    at Function.Module._load (internal/modules/cjs/loader.js:879:14)
    at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:71:12)
    at internal/main/run_main_module.js:17:47

```

- 即時実行の場合

  - これはいけるなぞ

```
$ npx ts-node src/main.ts
[ 'カレー', 'うんこ', 'メロン', 'オレンジ', 'りんご', 'すいか' ]
[ 'カレー', 'メロン', 'すいか', 'オレンジ', 'りんご', 'うんこ' ]
[ 'カレー', 'オレンジ', 'すいか', 'うんこ', 'りんご', 'メロン' ]
```
