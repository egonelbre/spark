package main

import (
	"fmt"
	"errors"
	"strconv"
	"strings"
)

type Op struct {
	Arity	int
	Fun	func(x []float64) float64
}

var ops = map[string]Op{
	"+": {2, func(x []float64) float64 {
		return x[0] + x[1]
	}},
	"-": {2, func(x []float64) float64 {
		return x[0] - x[1]
	}},
	"*": {2, func(x []float64) float64 {
		return x[0] * x[1]
	}},
	"/": {2, func(x []float64) float64 {
		return x[0] / x[1]
	}},
}

func Calc(calc string) ([]float64, error) {
	stack := strings.Split(calc, " ")
	args := make([]float64, 0)
	
	for len(stack) > 0 {
		token := stack[0]
		stack = stack[1:]
		if token == "" {
			continue
		} else if num, err := strconv.ParseFloat(token, 64); err == nil {
			args = append(args, num)
		} else {
			op, valid := ops[token]
			if !valid {
				return args, errors.New("Op '" + token + "' not defined")
			}
			if len(args) < op.Arity {
				return args, errors.New("Not enough arguments for '" + token + "'")
			}
			arg := args[len(args)-op.Arity:]
			args = args[:len(args)-op.Arity]
			res := op.Fun(arg)
			args = append(args, res)
		}
	}

	return args, nil
}

func main() {
	v, err := Calc("5 4 3 + /")
	if err != nil {
		fmt.Println(err.Error())
	} else {
		fmt.Println(v)
	}
}
