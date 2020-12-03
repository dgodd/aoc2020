#!/usr/bin/ruby

pos = 0
hits = 0
File.read('data/day3.txt').split("\n").each.with_index do |line, idx|
  char = line.split('')[pos % line.length]
  p [idx, line, pos, char]
  hits += 1 if char == '#'
  pos += 3
end
puts "HITS: #{hits}"
