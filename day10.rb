#!/usr/bin/ruby
require 'pry'

def numbers(path)
  nums = File.read(path).split(/\n/).map(&:to_i).sort
  nums << (nums[-1] + 3)
  nums << 0
  nums.sort!
end

diff = Hash.new(0)
numbers('data/day10_sample.txt').each_cons(2).each do |(a, b)|
  #p [a, b]
  diff[b - a] += 1
end
#p diff
puts "Part 1 - Sample: #{diff[1] * diff[3]}"

numbers('data/day10.txt').each_cons(2).each do |(a, b)|
  #p [a, b]
  diff[b - a] += 1
end
# p diff
puts "Part 1: #{diff[1] * diff[3]}"

@memo = {}
def recurse_max3(nums, prev = 0, path = [])
  # puts "CALL: #{path.inspect}, #{nums.inspect}"
  puts "PATH: #{path.inspect}" if nums.length <= 1
  return 1 if nums.length <= 1
  sum = 0
  nums.each.with_index(1) do |n, index|
    break if n > (prev + 3)
    rest = nums[index..]
    # p [n, nums, index, rest]
    @memo[[rest, n]] ||= recurse_max3(rest, n, path+[n])
    sum += @memo[[rest, n]]
  end
  sum
end
puts "Part 2 - Sample: #{recurse_max3(numbers('data/day10_sample_small.txt')[1..])}"
puts "Part 2 - Sample: #{recurse_max3(numbers('data/day10_sample.txt')[1..])}"
puts "Part 2: #{recurse_max3(numbers('data/day10.txt')[1..])}"
