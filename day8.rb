#!/usr/bin/ruby
require 'pry'

instructions = File.read('data/day8.txt').split("\n").map do |line|
  (op, val) = line.split(/\s+/)
  [op, val.to_i]
end
done = Hash.new(0)
curr = 0
global_val = 0
while true
  puts "GLOBAL: #{global_val}"
  break if done[curr] > 0
  done[curr] += 1
  line = instructions[curr]
  p line
  case line[0]
  when 'nop'
    curr += 1
  when 'acc'
    global_val += line[1]
    curr += 1
  when 'jmp'
    curr += line[1]
  else
    raise "UNEXPECTED: #{line.inspect}"
  end
end
puts "GLOBAL: #{global_val}"
