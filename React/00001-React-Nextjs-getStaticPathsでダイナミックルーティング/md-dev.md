- https://github.com/vercel/next.js/blob/master/examples/with-typescript/tsconfig.json

```
$ mkdir -p 00001-React-Nextjs-getStaticPathsでダイナミックルーティング

$ cd 00001-React-Nextjs-getStaticPathsでダイナミックルーティング

$ npx create-next-app app --use-npm --template typescript

$ cd app/

$ npm install --save-dev typescript @types/react @types/node

$ rm -rf pages/ public/ styles/

$ mkdir -p interfaces

$ touch interfaces/User.tsx

$ mkdir -p data

$ touch data/users.tsx

$ mkdir -p pages

$ touch pages/users/index.tsx

$ touch pages/users/[id].tsx

$ touch pages/index.tsx

$ touch pages/about.tsx
```
