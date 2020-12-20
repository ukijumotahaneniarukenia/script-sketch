package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {

	scanner := bufio.NewScanner(os.Stdin)

	err := scanner.Err()

	if err != nil {
		fmt.Fprintln(os.Stderr, "error:", err)
		os.Exit(1)
	}

	for scanner.Scan() {

		num, err := strconv.Atoi(scanner.Text())

		if err != nil {
			fmt.Fprintln(os.Stderr, "error:", err)
			os.Exit(1)
		}

		result := fmt.Sprintf("%U", num)
		fmt.Println(result)
	}

}
