package day5

import (
	"errors"
	"io/ioutil"
	"sort"
	"strings"
)

func SeatID(str string) int {
	out := 0
	for _, chr := range str {
		out = out << 1
		if chr == 'B' || chr == 'R' {
			out += 0b1
		}
	}
	return out
}

func allIds() ([]int, error) {
	txt, err := ioutil.ReadFile("../data/day5.txt")
	if err != nil {
		return nil, err
	}
	lines := strings.Split(string(txt), "\n")

	out := []int{}
	for _, line := range lines {
		out = append(out, SeatID(line))
	}
	return out, nil
}

func Part1() (int, error) {
	ids, err := allIds()
	if err != nil {
		return 0, err
	}

	max := 0
	for _, id := range ids {
		if id > max {
			max = id
		}
	}
	return max, nil
}

func Part2() (int, error) {
	ids, err := allIds()
	if err != nil {
		return 0, err
	}
	sort.Sort(sort.IntSlice(ids))

	for i := 1; i < len(ids); i += 1 {
		a := ids[i-1]
		b := ids[i]
		if a+2 == b {
			return a + 1, nil
		}
	}

	return 0, errors.New("Not Found")
}
