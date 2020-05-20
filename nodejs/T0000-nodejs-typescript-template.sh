#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 00016-nodejs-typescript-api-index
EOS
exit 0
}

BASE_DIR=$HOME/script-sketch/nodejs

WRKSP_NAME=$1;shift

[ -z $WRKSP_NAME ] && usage

mkdir -p $BASE_DIR/$WRKSP_NAME

cd $BASE_DIR/$WRKSP_NAME

npm init -y

npm install --save-dev ts-node typescript

cat <<EOS >$BASE_DIR/$WRKSP_NAME/tsconfig.json
{
  "compilerOptions": {
    "esModuleInterop": true
  }
}
EOS

echo '/node_modules/*' >$BASE_DIR/$WRKSP_NAME/.gitignore

cat <<EOS >$BASE_DIR/$WRKSP_NAME/index.ts
import express from 'express'

const app: express.Express = express()

const router: express.Router = express.Router()

router.get('/api/v1/list', (req:express.Request, res:express.Response) => {
    const word = [
        { title: 'うんこ', done: true },
        { title: 'もりもり', done: false },
        { title: '森鴎外', done: false },
        { title: 'うんどろめだ', done: false }
    ]
    res.json(word)
  })

app.use(router)

app.listen(3000,()=>{ console.log('Listening on port 3000') })
EOS

cd $BASE_DIR/$WRKSP_NAME

npm install --save-dev express
npm install --save-dev @types/express
