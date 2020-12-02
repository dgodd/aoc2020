package main

import (
	"testing"
)

func TestDay1(t *testing.T) {
	numbers, err := day1Numbers()
	if err != nil {
		t.Error(err)
	}

	num, err := day1Part1(numbers)
	if err != nil {
		t.Error(err)
	}
	if num != 471019 {
		t.Errorf("Expected Part1 to eq 471019")
	}

	num, err = day1Part2(numbers)
	if err != nil {
		t.Error(err)
	}
	if num != 103927824 {
		t.Errorf("Expected Part2 to eq 103927824")
	}
}
