package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"unicode/utf8"
)

func Kebab2Downcamel(targetString string) (destString string) {

	if !utf8.ValidString(targetString) {
		return targetString
	}

	var resultList []string

	for i, targetCharCodePoint := range targetString {
		if i == 0 {
			resultList = append(resultList, strings.ToUpper(string(targetCharCodePoint)))
		} else {
			resultList = append(resultList, string(targetCharCodePoint))
		}
	}
	return strings.Join(resultList, "")
}

func main() {

	scanner := bufio.NewScanner(os.Stdin)

	err := scanner.Err()

	if err != nil {
		fmt.Fprintln(os.Stderr, "error:", err)
		os.Exit(1)
	}

	for scanner.Scan() {

		fmt.Println(scanner.Text())

		list := strings.Split(scanner.Text(), "-")

		var result = string("")
		for i := 0; i < len(list); i++ {
			if i == 0 {
				result = list[i]
			} else {
				result = result + Kebab2Downcamel(list[i])
			}
		}

		fmt.Println(result)

	}

}
