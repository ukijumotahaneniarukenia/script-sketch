- REF

  - https://future-architect.github.io/typescript-guide/index.html#indices-and-tables

- 関数型ファンクション郡
  - https://lodash.com/


- プロジェクト作成

```
cd ~/script-sketch/lodash

mkdir -p 00001-lodash-おはつ

mkdir -p 00001-lodash-おはつ/app

mkdir -p 00001-lodash-おはつ/app/src

プロジェクトのルートディレクトリに移動して環境整備
cd 00001-lodash-おはつ/app

npm init -y


echo '/node_modules/*' >.gitignore


npm install --save-dev ts-node typescript


npm install --save-dev lodash


npm install --save-dev @types/lodash


cat <<EOS >tsconfig.json
{
  "compilerOptions": {
    "esModuleInterop": true
  }
}
EOS

そ〜すふぁいる作成
cd src

touch main.ts

mkdir -p sub

touch omikuji.ts
```

- 実行

```
npx ts-node main.ts
```
