外部ライブラリを交えて単一バイナリ生成できた。便利。

- https://github.com/labstack/echo

- https://echo.labstack.com/guide


ディレクトリ作成

```
./T01-テンプレート作成.sh init 00044-golang-RESTAPI-echoフレームワーク app
```


ライブラリイントール

```
cd 00044-golang-RESTAPI-echoフレームワーク/app
export GOPATH=$(pwd)
time go get github.com/labstack/echo
```

エントリファイル作成

```
cat  <<EOS >./src/main/main.go
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
EOS
```


外部ライブラリありの単一実行バイナリ作成

```
cd 00044-golang-RESTAPI-echoフレームワーク/app
 ( export GOPATH=$(pwd) && cd src/main && go install )
```


サーバープロセス起動

```
$ cd 00044-golang-RESTAPI-echoフレームワーク/app
$ ./bin/main

   ____    __
  / __/___/ /  ___
 / _// __/ _ \/ _ \
/___/\__/_//_/\___/ v4.1.16
High performance, minimalist Go web framework
https://echo.labstack.com
____________________________________O/_______
                                    O\
⇨ http server started on [::]:1323
```

アクセス

```
$ curl -s http://localhost:8080/getJson | awk 4
{"name":"Jon","email":"jon@labstack.com"}

$ curl -s http://localhost:8080/getXml | awk 4
<?xml version="1.0" encoding="UTF-8"?>
<UserXML><name>Jon</name><email>jon@labstack.com</email></UserXML>

$ curl -s http://localhost:8080/getHtml | awk 4
<strong>Hello, World!</strong>

$ curl -s http://localhost:8080/getString | awk 4
hello
```
