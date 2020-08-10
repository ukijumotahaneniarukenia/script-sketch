package main

import (
	"fmt"
	"image"
	"image/color"
	"image/png"
	"log"

	//残念 さがそ

	"github.com/psykhi/wordclouds" //../github.com/psykhi/wordclouds/spatialhashmap.go:36:5: assignment mismatch: 1 variable but uuid.NewV4 returns 2 values
)

var defaultColors = []color.RGBA{
	{0x00, 0x00, 0x00, 0xff},
	{0x46, 0x46, 0x46, 0xff},
	{0x64, 0x64, 0x64, 0xff},
	{0xbb, 0xbb, 0xbb, 0xff},
	{0xc8, 0xc8, 0xc8, 0xff},
}

//MaskConf kkk
type MaskConf struct {
	File  string     `json:"file"`
	Color color.RGBA `json:"color"`
}

//Conf jjj
type Conf struct {
	FontMaxSize     int          `json:"font_max_size"`
	FontMinSize     int          `json:"font_min_size"`
	RandomPlacement bool         `json:"random_placement"`
	FontFile        string       `json:"font_file"`
	Colors          []color.RGBA `json:"colors"`
	Width           int          `json:"width"`
	Height          int          `json:"height"`
	Mask            MaskConf     `json:"mask"`
}

func (c *Conf) calcFontMaxSize(numOfChar int) int {
	var fontMaxSize int
	fontMaxSize = int(float32(c.Width) * 0.4 / float32(numOfChar))

	return fontMaxSize
}

func (c *Conf) calcFontMinSize(numOfChar int) int {
	var fontMinSize int
	fontMinSize = int(float32(c.Width) * 0.4 / float32(numOfChar) / 10)
	return fontMinSize
}

func createWordCloud(wordCnt map[string]int, numOfChar int, colorsSetting []color.RGBA) image.Image {

	var DefaultConf = Conf{
		RandomPlacement: false,
		FontFile:        "./Menlo-for-Powerline.ttf",
		Colors:          colorsSetting,
		Width:           2048,
		Height:          2048,
		Mask: MaskConf{"", color.RGBA{
			R: 0,
			G: 0,
			B: 0,
			A: 0,
		}},
	}

	conf := DefaultConf

	var boxes []*wordclouds.Box
	if conf.Mask.File != "" {
		boxes = wordclouds.Mask(
			conf.Mask.File,
			conf.Width,
			conf.Height,
			conf.Mask.Color)
	}

	colors := make([]color.Color, 0)
	for _, c := range conf.Colors {
		colors = append(colors, c)
	}

	w := wordclouds.NewWordcloud(wordCnt,
		wordclouds.FontFile(conf.FontFile),
		wordclouds.FontMaxSize(conf.calcFontMaxSize(numOfChar)),
		wordclouds.FontMinSize(conf.calcFontMinSize(numOfChar)),
		wordclouds.Colors(colors),
		wordclouds.MaskBoxes(boxes),
		wordclouds.Height(conf.Height),
		wordclouds.Width(conf.Width),
		wordclouds.RandomPlacement(conf.RandomPlacement),
	)

	// ここで描画
	img := w.Draw()
	return img
}

func main() {

	colorsSetting := defaultColors

	//TODO tsvをkey-value形式で読み込む
	inputText := map[string]int{
		"以上":   81,
		"理由":   44,
		"肖像":   10,
		"散歩":   5,
		"大変":   21,
		"茶褐色":  3,
		"ばなし":  2,
		"赤金":   2,
		"普":    1,
		"年寄り":  2,
		"下痢":   1,
		"いか":   8,
		"満天下":  4,
		"洋館":   2,
		"北":    6,
		"廻り":   3,
		"国老":   1,
		"プップッ": 1,
		"そこ":   129,
		"ゆ":    21,
		"はるか":  4,
		"平均":   1,
		"民謡":   1,
		"句":    15,
		"無邪気":  6,
		"当日":   9,
		"端的":   3,
		"ロク":   4,
		"頁":    17,
		"松林":   2,
		"個々":   2,
		"小手":   2,
		"ハンケチ": 2,
		"バンコ":  2,
		"一端":   5,
		"あすこ":  2,
		"譬":    2,
		"寺号":   1,
		"逍遥":   2,
		"行者":   2,
		"ボロボロ": 3,
	}

	titleName := "ドグラ・マグラ"
	prefix := "NNN"
	suffix := ".img"
	separator := "-"
	outFileName := prefix + separator + titleName + separator + suffix

	numOfChar := 10 //keyのうち最大の文字列長を取得

	img := wordCloud.createWordCloud(inputText, numOfChar, colorsSetting)

	err = png.Encode(outFileName, img)
	if err != nil {
		log.Fatal(err)
		panic(err)
	}

	outFileName.Close()

	fmt.Println("Now On Air")
}
