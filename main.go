package main

import (
	"errors"
	"fmt"
	"io/ioutil"
	"strconv"
	"strings"
)

func day1Part1() (int64, error) {
	txt, err := ioutil.ReadFile("data/day1_part1.txt")
	if err != nil {
		return 0, err
	}
	lines := strings.Split(string(txt), "\n")
	numbers := make([]int64, 0, len(lines))
	for _, line := range lines {
		if num, err := strconv.ParseInt(line, 10, 64); err == nil {
			numbers = append(numbers, num)
		}
	}
	//fmt.Println(numbers)
	for i, n1 := range numbers {
		for _, n2 := range numbers[i+1:] {
			if n1+n2 == 2020 {
				return n1 * n2, nil
			}
		}
	}

	return 0, errors.New("not found")
}

func main() {
	num, err := day1Part1()
	if err != nil {
		panic(err)
	}
	fmt.Println("DAY 1 Part 1:", num)
}
