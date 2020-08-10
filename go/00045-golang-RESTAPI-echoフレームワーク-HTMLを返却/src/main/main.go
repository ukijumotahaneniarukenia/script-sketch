package main

import (
	"net/http"

	"github.com/labstack/echo"
)

func main() {
	e := echo.New()

	e.GET("/", func(c echo.Context) error {
		return c.HTML(http.StatusOK, "<strong>Hello, World!</strong>")
	})

	e.Logger.Fatal(e.Start(":8080"))
}
