//https://github.com/mapbox/node-sqlite3

let sqlite3 = require('sqlite3').verbose();

let db = new sqlite3.Database(':memory:');

db.serialize(function() {
  //json_table関数に与える引数を変数にしたい。標準入力から受け取ったファイルの中身を与えたい。
  db.each("SELECT key,value,type,atom,id,parent,fullkey,path FROM json_table()", function(err, row) {
      console.log(row.key+":"+row.value+":"+row.type+":"+row.atom+":"+row.id+":"+row.parent+":"+row.fullkey+":"+row.path);
  });
});

db.close();
