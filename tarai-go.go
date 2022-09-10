package main

import "fmt"

func tarai(x int, y int, z int) int {
	if x > y {
		return tarai(tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y))
	} else {
		return y
	}
}

func main() {
	fmt.Printf("%d\n", tarai(14, 7, 0))
}
