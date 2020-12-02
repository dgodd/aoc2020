package day2

import (
	"io/ioutil"
	"regexp"
	"strconv"
	"strings"
)

type Day2Data struct {
	Min      int
	Max      int
	Char     string
	Password string
}

func (d *Day2Data) Valid() bool {
	matched := regexp.MustCompile(d.Char).FindAllString(d.Password, -1)
	return len(matched) >= d.Min && len(matched) <= d.Max
}

func day2Data() ([]Day2Data, error) {
	txt, err := ioutil.ReadFile("../data/day2_part1.txt")
	if err != nil {
		return nil, err
	}
	lines := strings.Split(string(txt), "\n")

	validLine := regexp.MustCompile(`^(\d+)-(\d+) (.): (.*)`)
	data := make([]Day2Data, 0, len(lines))
	for _, line := range lines {
		if matched := validLine.FindStringSubmatch(line); len(matched) > 0 {
			min, _ := strconv.ParseInt(matched[1], 10, 32)
			max, _ := strconv.ParseInt(matched[2], 10, 32)

			data = append(data, Day2Data{
				Min:      int(min),
				Max:      int(max),
				Char:     matched[3],
				Password: matched[4],
			})
		}
	}
	return data, nil
}
