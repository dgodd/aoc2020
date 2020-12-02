package day2

import (
	"testing"
)

func TestSample1(t *testing.T) {
	d := Day2Data{Min: 1, Max: 3, Char: "a", Password: "abcde"}
	if d.Valid() != true {
		t.Error("Expected true")
	}
}

func TestSample2(t *testing.T) {
	d := Day2Data{Min: 1, Max: 3, Char: "b", Password: "cdefg"}
	if d.Valid() != false {
		t.Error("Expected false")
	}
}

func TestSample3(t *testing.T) {
	d := Day2Data{Min: 2, Max: 9, Char: "c", Password: "ccccccccc"}
	if d.Valid() != true {
		t.Error("Expected true")
	}
}

func TestSample3a(t *testing.T) {
	d := Day2Data{Min: 2, Max: 9, Char: "c", Password: "c"}
	if d.Valid() != false {
		t.Error("Expected false")
	}
}

func TestDay2_Input(t *testing.T) {
	data, err := day2Data()
	if err != nil {
		t.Error(err)
	}

	match := 0
	for _, d := range data {
		if d.Valid() {
			match += 1
		}
	}
	if match != 414 {
		t.Errorf("Expected: 414; Got: %d", match)
	}
}
