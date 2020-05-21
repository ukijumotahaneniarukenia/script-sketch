import express from 'express'

import multer from 'multer'

const bodyParser = require('body-parser') //ポストデータ処理用に必要なモジュール import文だとエラーなるからこれで読み込み

const uuid = require('uuid'); // uuidモジュールを読み込む import文だとエラーなるからこれで読み込み

const app: express.Express = express()

const router: express.Router = express.Router()

//webフォルダ配下を公開する
app.use(express.static('web'))

app.use(multer().none()); // multerでブラウザから送信されたデータを解釈する

app.use(bodyParser.urlencoded({ extended: false })) //ポストデータ処理用に使用 デフォ trueだけど falseがいいぽい
app.use(bodyParser.json()); //ポストデータ処理用に使用 jsonデータとして解釈

// TODOリストデータ
const todoList = [];

router.get('/api/v1/list', (req:express.Request, res:express.Response) => {
    res.json(todoList)
  })

// http://localhost:3000/api/v1/add にデータを送信してきたときに
// TODOリストに項目を追加する
router.post('/api/v1/add', (req:express.Request, res:express.Response) => {
  // クライアントからの送信データを取得する
  // console.log(req.body)

  const todoData = req.body;

  const todoTitle = todoData.title;//タイトルプロパティを取得

  // // ユニークIDを生成する
  const id = uuid.v4();//fc0a9fb8-385a-4a76-a6fe-1cd60a865eee

  // TODO項目を作る
  const todoItem = {
      id,
      title: todoTitle,
      done: false
  };

  // {
  //   id: 'a90966b5-9135-4b8f-885c-a8d08db672d8',
  //   title: 'world',
  //   done: false
  // }
  
  // // TODOリストに項目を追加する
  todoList.push(todoItem);

  // コンソールに出力する
  console.log('Add: ' + JSON.stringify(todoItem));

  // 追加した項目をクライアントに返す
  res.json(todoItem);
});

//api仕様をアプリに設定
app.use(router)

app.listen(3000,()=>{ console.log('Listening on port 3000') })
