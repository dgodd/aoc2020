package day5

import (
	"testing"
)

func TestSeatIdSample(t *testing.T) {
	if SeatID("BFFFBBFRRR") != 567 {
		t.Error("Expected BFFFBBFRRR == 567")
	}
	if SeatID("FFFBBBFRRR") != 119 {
		t.Error("Expected FFFBBBFRRR == 567")
	}
	if SeatID("BBFFBBFRLL") != 820 {
		t.Error("Expected BBFFBBFRLL == 820")
	}
}

func TestPart1(t *testing.T) {
	max, err := Part1()
	if err != nil {
		t.Error(err)
	}
	if max != 955 {
		t.Error("Expected == 955: Got == ", max)
	}
}

func TestPart2(t *testing.T) {
	mySeatID, err := Part2()
	if err != nil {
		t.Error(err)
	}
	if mySeatID != 569 {
		t.Error("Expected == 569: Got == ", mySeatID)
	}
}
