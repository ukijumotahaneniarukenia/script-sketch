https://github.com/mysqljs/mysql

https://dev.classmethod.jp/server-side/node-js-server-side/node-js-mysql-get-data-from-table-record/


- 01-node-mysql.js

```nodejs
const mysql = require('mysql');

const conn = mysql.createConnection({
    host:'localhost'
    ,user:'root'
    ,password:'Mysql3306'
    ,database:'testdb'
});

conn.connect();

conn.query('select * from test_tbl limit 5',function(err,rows,fields){
    if (err) {console.log('err :'+err);}
    console.log(rows);
});

conn.end();
```

実行

エラーでた

```
node .\01-node-mysql.js
err :Error: ER_NOT_SUPPORTED_AUTH_MODE: Client does not support authentication protocol requested by server; consider upgrading MySQL client

Error: ER_NOT_SUPPORTED_AUTH_MODE: Client does not support authentication protocol requested by server; consider upgrading MySQL client
    at Handshake.Sequence._packetToError (G:\node-scratch\node_modules\mysql\lib\protocol\sequences\Sequence.js:47:14)
    at Handshake.ErrorPacket (G:\node-scratch\node_modules\mysql\lib\protocol\sequences\Handshake.js:123:18)
    at Protocol._parsePacket (G:\node-scratch\node_modules\mysql\lib\protocol\Protocol.js:291:23)
    at Parser._parsePacket (G:\node-scratch\node_modules\mysql\lib\protocol\Parser.js:433:10)
    at Parser.write (G:\node-scratch\node_modules\mysql\lib\protocol\Parser.js:43:10)
    at Protocol.write (G:\node-scratch\node_modules\mysql\lib\protocol\Protocol.js:38:16)
    at Socket.<anonymous> (G:\node-scratch\node_modules\mysql\lib\Connection.js:88:28)
    at Socket.<anonymous> (G:\node-scratch\node_modules\mysql\lib\Connection.js:526:10)
    at Socket.emit (events.js:223:5)
    at addChunk (_stream_readable.js:309:12)
    --------------------
    at Protocol._enqueue (G:\node-scratch\node_modules\mysql\lib\protocol\Protocol.js:144:48)
    at Protocol.handshake (G:\node-scratch\node_modules\mysql\lib\protocol\Protocol.js:51:23)
    at Connection.connect (G:\node-scratch\node_modules\mysql\lib\Connection.js:116:18)
    at Object.<anonymous> (G:\node-scratch\01-node-mysql.js:10:6)
    at Module._compile (internal/modules/cjs/loader.js:955:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:991:10)
    at Module.load (internal/modules/cjs/loader.js:811:32)
    at Function.Module._load (internal/modules/cjs/loader.js:723:14)
    at Function.Module.runMain (internal/modules/cjs/loader.js:1043:10)
    at internal/main/run_main_module.js:17:11 {
  code: 'ER_NOT_SUPPORTED_AUTH_MODE',
  errno: 1251,
  sqlMessage: 'Client does not support authentication protocol requested by server; consider upgrading MySQL client',
  sqlState: '08004',
  fatal: true


}

```

対応

```
rootユーザーでサーバー側のマシンに入って認証方式をいかに変更
IDENTIFIED WITH mysql_native_password
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Mysql3306'
```

とれた
- https://qiita.com/monga3/items/6583c07a9b275b469608

```nodejs
node .\01-node-mysql.js
 [
   RowDataPacket { id: 1, item: '00acc8a7ea' },
   RowDataPacket { id: 2, item: '8d71503aba' },
   RowDataPacket { id: 3, item: '378636839b' },
   RowDataPacket { id: 4, item: '384cb7e20c' },
   RowDataPacket { id: 5, item: '25bfd9d9c7' }
 ]
```

