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

def contiguous_sum(numbers, num)
  numbers.each.with_index do |x, i|
    sum = x
    numbers[(i+1)..].each.with_index(i + 1) do |y, j|
      sum += y
      break if sum > num
      return numbers[i..j] if sum == num
    end
  end
end

def sum_min_max(numbers)
  numbers.min + numbers.max
end

puts "Part 1 - Sample"
numbers = File.read('data/day9_sample.txt').split(/\n/).map(&:to_i)
p first_invalid(numbers, 5) # 127

puts "\nPart 1"
numbers = File.read('data/day9.txt').split(/\n/).map(&:to_i)
p first_invalid(numbers, 25) # 21806024

puts "\nPart 2 - Sample"
numbers = File.read('data/day9_sample.txt').split(/\n/).map(&:to_i)
p contiguous_sum(numbers, 127)
p sum_min_max(contiguous_sum(numbers, 127))

puts "\nPart 2"
numbers = File.read('data/day9.txt').split(/\n/).map(&:to_i)
p sum_min_max(contiguous_sum(numbers, 21806024))
