#!/usr/bin/ruby
require 'pry'

RUN = Struct.new(:done, :global_val)

def read(path)
  File.read(path).split("\n").map do |line|
    (op, val) = line.split(/\s+/)
    [op, val.to_i]
  end
end

def run(instructions)
  done = Hash.new(0)
  curr = 0
  global_val = 0
  while true
    if curr >= instructions.length
      return RUN.new(true, global_val)
    end
    break if done[curr] > 0
    done[curr] += 1
    line = instructions[curr]
    # p [curr, line]
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
  RUN.new(false, global_val)
end

def find_fix(path)
  instructions = read(path)
  instructions.each.with_index do |(op, _), index|
    instr = read(path)
    # puts "OP: #{op} ; INDEX: #{index}"
    case op
    when 'nop'
      instr[index][0] = 'jmp'
    when 'jmp'
      instr[index][0] = 'nop'
    else
      next
    end
    ans = run(instr)
    return [index, ans] if ans.done
  end
end

puts "Part 1 - Sample 1"
instructions = read('data/day8_sample.txt')
p run(instructions)

puts "Part 1"
instructions = read('data/day8.txt')
p run(instructions)

puts "Part 2 - Sample 2"
index, ans = find_fix('data/day8_sample.txt')
puts "DONE: LINE: #{index}: GLOBAL: #{ans.global_val}"

puts "Part 2"
index, ans = find_fix('data/day8.txt')
puts "DONE: LINE: #{index}: GLOBAL: #{ans.global_val}"
