
```
$ mkdir -p 00002-Nextjs-NextApiRequestとNextApiResponseでAPIサーバ

$ cd 00002-Nextjs-NextApiRequestとNextApiResponseでAPIサーバ

$ npx create-next-app app --use-npm --template typescript

$ cd app/

$ npm install --save-dev typescript @types/react @types/node

$ mkdir -p pages/api/v1/users

$ mkdir -p data

$ touch data/users.tsx

$ mkdir -p interfaces

$ touch interfaces/User.tsx

$ touch pages/api/v1/users/index.tsx

$ npm install --save urlencoded-body-parser

$ curl -H "Content-Type: application/json" -X POST -s 'http://localhost:3000/api/v1/users/UNKO' -d '{"id":"UNKO","name":"うんこ"}'

$ curl -H "Content-Type: application/json" -X PUT -s 'http://localhost:3000/api/v1/users/UNKO' -d '{"id":"UNKO","name":"うんこもりもり"}'

$ curl -X DELETE -s 'http://localhost:3000/api/v1/users/vjH35nKOtiopav6pHAFRV6npkqaGVURm'

$ curl -X DELETE -s 'http://localhost:3000/api/v1/users/vjH35nKOtiopav6pHAFRV6npkqaGVURmV'

$ curl -H "Content-Type: application/json" -X PATCH -s 'http://localhost:3000/api/v1/users/UNKO' -d '{"id":"UNKO","name":"うんこもりもり"}'
```


```
$ npm run dev

$ curl -s 'http://localhost:3000/api/v1/users' | jq .
```


```
$ curl -s 'http://localhost:3000/api/v1/users/l2mbgGDcorvVMI6b3SZOERl6J93MmMd' | jq
{
  "statusCode": 404,
  "message": "Not Found User"
}

$ curl -s 'http://localhost:3000/api/v1/users/l2mbgGDcorvVMI6b3SZOERl6J93MmMdV' | jq
[
  {
    "id": "l2mbgGDcorvVMI6b3SZOERl6J93MmMdV",
    "name": "クイナ"
  }
]
```
