#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 00016-nodejs-typescript-api-index
EOS
exit 0
}

WRKSP_NAME=$1;shift

[ -z $WRKSP_NAME ] && usage

cd $HOME/script-sketch/nodejs

mkdir -p $WRKSP_NAME

npm init -y

npm install --save-dev ts-node typescript

cat <<EOS >tsconfig.json
{
  "compilerOptions": {
    "esModuleInterop": true
  }
}
EOS

touch index.ts

npm install --save-dev express
npm install --save-dev @types/express
