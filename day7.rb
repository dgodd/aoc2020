#!/usr/bin/ruby
require 'pry'

def get_bags(path) 
  File.read(path).split("\n").map do |line|
    if line.match(/(.*) bags contain no other bags./)
      [$1]
    elsif line.match(/(.*?) bags contain (.*)\.$/)
      outer = $1
      inner = $2.split(/, /).map { |b| b.match(/\d (.*) bag/) && $1 }
      [outer] + inner
    end
  end
end
def invert_bags(bags)
  bags.each_with_object({}) do |bags, hash|
    bags[1..].each do |bag|
      hash[bag] ||= []
      hash[bag] << bags[0]
    end
  end
end
def all_containing(inverted_bags, bag)
  inverted_bags.fetch(bag, []).flat_map do |b|
    [b] + all_containing(inverted_bags, b)
  end.uniq
end

bags = invert_bags(get_bags('data/day7_sample.txt'))
puts "Day 7: Part 1: Sample: #{all_containing(bags, 'shiny gold').count}"

bags = invert_bags(get_bags('data/day7.txt'))
puts "Day 7: Part 1: #{all_containing(bags, 'shiny gold').count}"
