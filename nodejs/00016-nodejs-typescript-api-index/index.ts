import express from 'express'

const app: express.Express = express()

const router: express.Router = express.Router()

router.get('/', (req:express.Request, res:express.Response) => {
    res.send('ハロー・ワールド')
  })

app.use(router)

app.listen(3000,()=>{ console.log('Listening on port 3000') })