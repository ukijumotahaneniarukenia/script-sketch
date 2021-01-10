package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"unicode"
	"unicode/utf8"
)

func Train2Downcamel(targetString string) (destString string) {

	if !utf8.ValidString(targetString) {
		return targetString
	}

	var resultList []string

	for _, targetCharCodePoint := range targetString {
		if unicode.IsUpper(targetCharCodePoint) {
			resultList = append(resultList, strings.ToLower(string(targetCharCodePoint)))
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

		list := strings.Split(scanner.Text(), "-")

		var result = string("")
		for i := 0; i < len(list); i++ {
			if i == 0 {
				result = Train2Downcamel(list[i])
			} else {
				result = result + list[i]
			}
		}

		fmt.Println(result)

	}

}
