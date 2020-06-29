package main

import (
	"net/http"

	"github.com/labstack/echo"
)

// User 単一構造体を定義
type User struct {
	Name  string `json:"name"`
	Email string `json:"email"`
}

// Handler
func handler(c echo.Context) error {
	u := &User{
		Name:  "Jon",
		Email: "jon@labstack.com",
	}
	return c.JSON(http.StatusOK, u)
}

func main() {
	e := echo.New()

	e.GET("/", func(c echo.Context) error {
		return handler(c)
	})

	e.Logger.Fatal(e.Start(":8080"))
}
