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
