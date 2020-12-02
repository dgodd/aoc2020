package day2

import (
	"testing"
)

func TestSample1(t *testing.T) {
	d := Day2Data{Min: 1, Max: 3, Char: "a", Password: "abcde"}
	if d.Valid1() != true {
		t.Error("Expected true")
	}
}

func TestSample2(t *testing.T) {
	d := Day2Data{Min: 1, Max: 3, Char: "b", Password: "cdefg"}
	if d.Valid1() != false {
		t.Error("Expected false")
	}
}

func TestSample3(t *testing.T) {
	d := Day2Data{Min: 2, Max: 9, Char: "c", Password: "ccccccccc"}
	if d.Valid1() != true {
		t.Error("Expected true")
	}
}

func TestSample3a(t *testing.T) {
	d := Day2Data{Min: 2, Max: 9, Char: "c", Password: "c"}
	if d.Valid1() != false {
		t.Error("Expected false")
	}
}

func TestDay2_Part1(t *testing.T) {
	data, err := day2Data()
	if err != nil {
		t.Error(err)
	}

	match := 0
	for _, d := range data {
		if d.Valid1() {
			match += 1
		}
	}
	if match != 414 {
		t.Errorf("Expected: 414; Got: %d", match)
	}
}

func TestSample4(t *testing.T) {
	d := Day2Data{Min: 1, Max: 3, Char: "a", Password: "abcde"}
	if d.Valid2() != true {
		t.Error("Expected true")
	}
}

func TestSample4a(t *testing.T) {
	d := Day2Data{Min: 1, Max: 3, Char: "b", Password: "abcde"}
	if d.Valid2() != false {
		t.Error("Expected false")
	}
}

func TestSample5(t *testing.T) {
	d := Day2Data{Min: 1, Max: 3, Char: "b", Password: "cdefg"}
	if d.Valid2() != false {
		t.Error("Expected false")
	}
}

func TestSample6(t *testing.T) {
	d := Day2Data{Min: 2, Max: 9, Char: "c", Password: "ccccccccc"}
	if d.Valid2() != false {
		t.Error("Expected false")
	}
}

func TestDay2_Part2(t *testing.T) {
	data, err := day2Data()
	if err != nil {
		t.Error(err)
	}

	match := 0
	for _, d := range data {
		if d.Valid2() {
			match += 1
		}
	}
	if match != 413 {
		t.Errorf("Expected: 413; Got: %d", match)
	}
}
