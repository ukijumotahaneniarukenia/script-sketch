外部ライブラリを交えて単一バイナリ生成できた。便利。

- https://github.com/labstack/echo


- https://echo.labstack.com/guide


```
#ディレクトリ作成
./T01-go-テンプレート作成.sh 00044-go-RESTAPI-echoフレームワーク


#ライブラリイントール
cd 00044-go-RESTAPI-echoフレームワーク
export GOPATH=$(pwd)
time go get github.com/labstack/echo

$ cat ./src/main/main.go
package main

import (
	"net/http"

	"github.com/labstack/echo"
)

func main() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World!")
	})
	e.Logger.Fatal(e.Start(":1323"))
}


#外部ライブラリありの単一実行バイナリ作成

cd 00044-go-RESTAPI-echoフレームワーク
 ( export GOPATH=$(pwd) && cd src/main && go install ) //gopath変えんでもいけたので、変えずにいったほうがよさげ

 ( cd src/main && go install ) //gopath変えんでもいけたので、変えずにいったほうがよさげ

#起動

$ cd 00044-go-RESTAPI-echoフレームワーク
$ ./bin/main &
[1] 8581

   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.1.16
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:1323

#アクセス
firefox http://localhost:1323/
```



- プロセスkill


```
lsof -P -i:1323 | awk '{print $2}' | tail -n-1 | xargs sudo kill -9
```
