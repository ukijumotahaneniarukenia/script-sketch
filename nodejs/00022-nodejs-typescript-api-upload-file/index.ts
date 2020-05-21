import express from 'express'

import path from 'path'

import fs from 'fs'

import multer from 'multer'

const app: express.Express = express()

const router: express.Router = express.Router()

const upload = multer({ dest: 'uploads/' }) //アップロード先フォルダを指定 なければ自動で作成される

let fileFullPathList = [];

function fetchFileList(dir) {
  const filenames = fs.readdirSync(dir);
  filenames.forEach((filename) => {
    const fullPath = path.join(dir, filename);
    const stats = fs.statSync(fullPath);
    if (stats.isFile()) {
      //ファイルの場合
      fileFullPathList.push(fullPath)
    } else if (stats.isDirectory()) {
      //ディレクトリの場合
      fetchFileList(fullPath);
    }
  });
  return fileFullPathList;
}

//webフォルダ配下を公開する
app.use(express.static('web'))

app.use(express.static(path.join(__dirname, 'public')))

router.get('/api/v1/list', (req:express.Request, res:express.Response) => {
  fileFullPathList = [];
  const tgtDir = process.cwd() + '/uploads'
  console.log(tgtDir)
  console.log(fetchFileList(tgtDir))
  res.json(fileFullPathList)
})

router.post('/upload', upload.single('file'),  (req:express.Request, res:express.Response) => {
  console.log('Upload: ' + req.file.originalname);
  // ステータスコード200:OKを送信
  res.status(200).send('<a href="/index.html" >ホームに戻る</a>')
})

app.use(router)

app.listen(3000,()=>{ console.log('Listening on port 3000') })
