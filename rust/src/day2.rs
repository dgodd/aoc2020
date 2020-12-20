use std::fs;
use pest::Parser;

#[derive(Parser)]
#[grammar = "day2.pest"]
struct LineParser;

#[derive(Debug)]
pub struct Line {
    min: usize,
    max: usize,
    chr: char,
    s: String,
}

impl Line {
    pub fn part1(&self) -> bool {
        let n = self.s.chars().into_iter().filter(|c| *c == self.chr).count();
        n >= self.min && n <= self.max
    }

    pub fn part2(&self) -> bool {
        let c1 = self.s.chars().nth(self.min - 1);
        let c2 = self.s.chars().nth(self.max - 1);
        (c1.unwrap() == self.chr) ^ (c2.unwrap() == self.chr)
    }
}

pub fn lines(filename: &str) -> Vec<Line> {
    let contents = fs::read_to_string(filename).expect("Something went wrong reading the file");
    let pairs = LineParser::parse(Rule::lines, &contents).unwrap_or_else(|e| panic!("{}", e));
    pairs.map(|pair| {
        let mut inner_rules = pair.into_inner();
        let min: usize = inner_rules.next().unwrap().as_str().parse().unwrap();
        let max: usize = inner_rules.next().unwrap().as_str().parse().unwrap();
        let chr = inner_rules.next().unwrap().as_str();
        let s = inner_rules.next().unwrap().as_str();
        Line { min: min, max: max, chr: chr.chars().nth(0).unwrap(), s: String::from(s) }
    }).collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_part1_sample() {
        assert_eq!(lines("../data/day2_sample.txt").into_iter().filter(|line| line.part1()).count(), 2);
    }

    #[test]
    fn test_part1() {
        assert_eq!(lines("../data/day2_part1.txt").into_iter().filter(|line| line.part1()).count(), 414);
    }

    #[test]
    fn test_part2_sample() {
        assert_eq!(lines("../data/day2_sample.txt").into_iter().filter(|line| line.part2()).count(), 1);
    }

    #[test]
    fn test_part2() {
        assert_eq!(lines("../data/day2_part1.txt").into_iter().filter(|line| line.part2()).count(), 413);
    }
}
