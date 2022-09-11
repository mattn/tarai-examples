package main

import (
	"fmt"
	"log"
	"os"
	"strconv"
)

func tarai(x int, y int, z int) int {
	if x > y {
		return tarai(tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y))
	} else {
		return y
	}
}

func arg(s string) int {
	n, err := strconv.Atoi(s)
	if err != nil {
		log.Fatal(err)
	}
	return n
}

func main() {
	if len(os.Args) != 4 {
		os.Exit(1)
	}
	x := arg(os.Args[1])
	y := arg(os.Args[2])
	z := arg(os.Args[3])
	fmt.Printf("%d\n", tarai(x, y, z))
}
