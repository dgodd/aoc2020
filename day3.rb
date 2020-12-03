#!/usr/bin/ruby

# PART 1
pos = 0
hits = 0
File.read('data/day3.txt').split("\n").each.with_index do |line, idx|
  char = line.split('')[pos % line.length]
  # p [idx, line, pos, char]
  hits += 1 if char == '#'
  pos += 3
end
puts "PART 1: HITS: #{hits}"

# PART 2
lines = File.read('data/day3_sample.txt').split("\n")
[[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].each do |(right, down)|
  hits = 0
  x, y = [0, 0]
  while y < lines.length
    line = lines[y]
    char = line.split('')[x % line.length]
    # p [x, y, line, char]
    hits += 1 if char == '#'
    x += right
    y += down
  end
  puts "PART 2: Right #{right}, down: #{down}: HITS: #{hits}"
end
