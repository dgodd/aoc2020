package main

import (
	"errors"
	"fmt"
	"io/ioutil"
	"strconv"
	"strings"
)

func day1Numbers() ([]int64, error) {
	txt, err := ioutil.ReadFile("data/day1_part1.txt")
	if err != nil {
		return nil, err
	}
	lines := strings.Split(string(txt), "\n")
	numbers := make([]int64, 0, len(lines))
	for _, line := range lines {
		if num, err := strconv.ParseInt(line, 10, 64); err == nil {
			numbers = append(numbers, num)
		}
	}
	return numbers, nil
}

func day1Part1(numbers []int64) (int64, error) {
	for i, n1 := range numbers {
		for _, n2 := range numbers[i+1:] {
			if n1+n2 == 2020 {
				return n1 * n2, nil
			}
		}
	}

	return 0, errors.New("not found")
}

func day1Part2(numbers []int64) (int64, error) {
	for i, n1 := range numbers {
		for j, n2 := range numbers[i+1:] {
			for _, n3 := range numbers[j+1:] {
				if n1+n2+n3 == 2020 {
					return n1 * n2 * n3, nil
				}

			}

		}
	}

	return 0, errors.New("not found")
}

func day1() error {
	numbers, err := day1Numbers()
	if err != nil {
		return err
	}

	num, err := day1Part1(numbers)
	if err != nil {
		return err
	}
	fmt.Println("DAY 1 Part 1:", num)

	num, err = day1Part2(numbers)
	if err != nil {
		return err
	}
	fmt.Println("DAY 1 Part 2:", num)

	return nil
}
