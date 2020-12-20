extern crate pest;
#[macro_use]
extern crate pest_derive;

pub mod day1;
pub mod day2;
pub mod day3;

fn main() {
    println!("Hello, world! {:?}", day1::numbers("../data/day1_sample.txt"));
}
