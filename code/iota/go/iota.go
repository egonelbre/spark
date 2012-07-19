package main

import "fmt"

type Iota func()int

func NewIota(start int) Iota{
	return func() int {
		start += 1
		return start - 1
	}
}

func main() {
	enum := NewIota(0)
	for i := 0; i < 10; i += 1 {
		fmt.Println("it: ", enum())
	}
}
