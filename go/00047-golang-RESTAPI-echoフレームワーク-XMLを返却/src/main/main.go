package main

import (
	"net/http"

	"github.com/labstack/echo"
)

// User 単一構造体を定義
type User struct {
	Name  string `xml:"name"`
	Email string `xml:"email"`
}

// Handler
func handler(c echo.Context) error {
	u := &User{
		Name:  "Jon",
		Email: "jon@labstack.com",
	}
	return c.XML(http.StatusOK, u)
}

func main() {
	e := echo.New()

	e.GET("/", func(c echo.Context) error {
		return handler(c)
	})

	e.Logger.Fatal(e.Start(":8080"))
}
