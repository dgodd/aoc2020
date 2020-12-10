#!/usr/bin/ruby
require 'pry'

numbers = File.read('data/day10_sample.txt').split(/\n/).map(&:to_i).sort
numbers << (numbers[-1] + 3)
numbers << 0
numbers.sort!
diff = Hash.new(0)
numbers.each_cons(2).each do |(a, b)|
  p [a, b]
  diff[b - a] += 1
end
p diff
puts "Part 1 - Sample: #{diff[1] * diff[3]}"

numbers = File.read('data/day10.txt').split(/\n/).map(&:to_i).sort
numbers << (numbers[-1] + 3)
numbers << 0
numbers.sort!
diff = Hash.new(0)
numbers.each_cons(2).each do |(a, b)|
  p [a, b]
  diff[b - a] += 1
end
p diff
puts "Part 1: #{diff[1] * diff[3]}"
