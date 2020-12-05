package main

import (
	"net/http"

	"github.com/labstack/echo"
)

// UserXML 単一構造体を定義
type UserXML struct {
	Name  string `xml:"name"`
	Email string `xml:"email"`
}

// Handler
func handlerXML(c echo.Context) error {
	u := &UserXML{
		Name:  "Jon",
		Email: "jon@labstack.com",
	}
	return c.XML(http.StatusOK, u)
}

// UserJSON 単一構造体を定義
type UserJSON struct {
	Name  string `json:"name"`
	Email string `json:"email"`
}

// handlerJSON
func handlerJSON(c echo.Context) error {
	u := &UserJSON{
		Name:  "Jon",
		Email: "jon@labstack.com",
	}
	return c.JSON(http.StatusOK, u)
}

func main() {
	e := echo.New()

	e.GET("/getString", func(c echo.Context) error {
		return c.String(http.StatusOK, "hello")
	})

	e.GET("/getHtml", func(c echo.Context) error {
		return c.HTML(http.StatusOK, "<strong>Hello, World!</strong>")
	})

	e.GET("/getJson", func(c echo.Context) error {
		return handlerJSON(c)
	})

	e.GET("/getXml", func(c echo.Context) error {
		return handlerXML(c)
	})

	e.Logger.Fatal(e.Start(":8080"))
}
