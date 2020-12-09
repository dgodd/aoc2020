#!/usr/bin/ruby
require 'pry'

def any_two(numbers, num)
  numbers.each.with_index(1) do |x, i|
    numbers[i..].each do |y|
      return true if x + y == num
    end
  end
  false
end

def first_invalid(numbers, preamble)
  numbers[preamble..].each.with_index(preamble) do |num, index|
    prev = numbers[(index - preamble)...index]
    # p [num, index, prev, any_two(prev, num)]
    return num unless any_two(prev, num)
  end
end

puts "Part 1 - Sample"
numbers = File.read('data/day9_sample.txt').split(/\n/).map(&:to_i)
p first_invalid(numbers, 5)

puts "Part 1"
numbers = File.read('data/day9.txt').split(/\n/).map(&:to_i)
p first_invalid(numbers, 25)
