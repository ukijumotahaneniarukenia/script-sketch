package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {

	scanner := bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		num, _ := strconv.Atoi(scanner.Text())
		result := fmt.Sprintf("%x", num)
		fmt.Println(result)
	}

	err := scanner.Err()

	if err != nil {
		fmt.Fprintln(os.Stderr, "error:", err)
		os.Exit(1)
	}
}
