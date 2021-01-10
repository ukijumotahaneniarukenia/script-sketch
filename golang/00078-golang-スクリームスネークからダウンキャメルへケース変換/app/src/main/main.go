package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
	"unicode/utf8"
)

func Snake2Down(targetString string) (destString string) {

	if !utf8.ValidString(targetString) {
		return targetString
	}

	var resultList []string

	for _, targetCharCodePoint := range targetString {
		resultList = append(resultList, strings.ToLower(string(targetCharCodePoint)))
	}
	return strings.Join(resultList, "")
}

func Snake2Camel(targetString string) (destString string) {

	if !utf8.ValidString(targetString) {
		return targetString
	}

	var resultList []string

	for i, targetCharCodePoint := range targetString {
		if i == 0 {
			resultList = append(resultList, string(targetCharCodePoint))
		} else {
			resultList = append(resultList, strings.ToLower(string(targetCharCodePoint)))
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

		list := strings.Split(scanner.Text(), "_")

		var result = string("")
		for i := 0; i < len(list); i++ {
			if i == 0 {
				result = Snake2Down(list[i])
			} else {
				result = result + Snake2Camel(list[i])
			}
		}

		fmt.Println(result)

	}

}
