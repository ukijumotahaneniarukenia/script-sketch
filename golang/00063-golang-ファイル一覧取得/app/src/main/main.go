package main

import (
	"io/ioutil"
	"path/filepath"
)

func walkAroundAround(dirname string) error {
	dirList, err := ioutil.ReadDir(dirname)

	if err != nil {
		return err
	}

	for _, v := range dirList {
		fullPath := filepath.Join(dirname, v.Name())
		if v.IsDir() {
			// ディレクトリの場合
			walkAroundAround(fullPath)
		} else {
			// ディレクトリ以外の場合
			println(fullPath)
		}
	}
	return nil
}

func main() {
	err := walkAroundAround(`/home/aine/script-sketch/golang`) // more than one character in rune literal ==> シングルクォートではなくバッククォートで囲む
	if err != nil {
		println(err.Error())
	}
}
