use std::fs;

#[derive(Debug)]
pub struct Trees {
    data: Vec<Vec<char>>,
    x: usize,
    y: usize,
}

impl Trees {
    pub fn new(filename: &str) -> Trees {
        let contents = fs::read_to_string(filename).expect("Something went wrong reading the file");
        let data = contents
            .split("\n")
            .map(|x| x.chars().collect::<Vec<char>>())
            .collect();
        Trees {
            data: data,
            x: 0,
            y: 0,
        }
    }

    pub fn reset(&mut self) {
        self.x = 0;
        self.y = 0;
    }

    pub fn get(&self, x: usize, y: usize) -> char {
        let row = self.data.get(y).unwrap();
        *row.get(x % row.len()).unwrap()
    }

    pub fn peek(&self) -> Option<char> {
        if (self.y + 1) < self.data.len() {
            Some(self.get(self.x, self.y))
        } else{
            None
        }
    }

    pub fn mv(&mut self, x: usize, y: usize) -> Option<char> {
        self.x += x;
        self.y += y;
        self.peek()
    }

    pub fn part1_hits(&mut self, x: usize, y: usize) -> u32 {
        self.reset();
        let mut hits = 0;
        if self.peek().unwrap_or(' ') == '#' {
            hits += 1;
        }
        for _ in 2..self.data.len() {
            if self.mv(x, y).unwrap_or(' ') == '#' {
                hits += 1;
            }
        }
        hits
    }

    pub fn part2_hits(&mut self) -> u32 {
        let h1 = self.part1_hits(1, 1);
        let h2 = self.part1_hits(3, 1);
        let h3 = self.part1_hits(5, 1);
        let h4 = self.part1_hits(7, 1);
        let h5 = self.part1_hits(1, 2);
        h1 * h2 * h3 * h4 * h5
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_trees_get() {
        let tree = Trees::new("../data/day3_sample.txt");
        assert_eq!(tree.get(0, 0), '.', "get(0, 0)");
        assert_eq!(tree.get(1, 0), '.', "get(1, 0)");
        assert_eq!(tree.get(0, 1), '#', "get(0, 1)");
        assert_eq!(tree.get(1, 1), '.', "get(1, 1)");
    }

    #[test]
    fn test_trees_get_wraps_x() {
        let tree = Trees::new("../data/day3_sample.txt");
        assert_eq!(tree.get(12, 0), '.');
        assert_eq!(tree.get(13, 0), '#');
        assert_eq!(tree.get(14, 0), '#');
        assert_eq!(tree.get(15, 0), '.');

        assert_eq!(tree.get(40, 0), '.', "get(40, 0)");
    }

    #[test]
    fn test_part1_sample() {
        let mut tree = Trees::new("../data/day3_sample.txt");
        assert_eq!(tree.part1_hits(3, 1), 7);
    }

    #[test]
    fn test_part1() {
        let mut tree = Trees::new("../data/day3.txt");
        assert_eq!(tree.part1_hits(3, 1), 240);
    }

    #[test]
    fn test_part2_sample() {
        let mut tree = Trees::new("../data/day3_sample.txt");
        assert_eq!(tree.part2_hits(), 336);
    }

    #[test]
    fn test_part2() {
        let mut tree = Trees::new("../data/day3.txt");
        assert_eq!(tree.part2_hits(), 2832009600);
    }
}
