#!/usr/bin/ruby

# PART 1
REQUIRED_FIELDS = %w{byr iyr eyr hgt hcl ecl pid}
valid = 0
current = {}
File.read('data/day4.txt').split("\n").each do |line|
  if line.length == 0
    valid += (REQUIRED_FIELDS - current.keys).empty? ? 1 : 0
    p current
    puts valid
    current = {}
    next
  end

  current.merge!(Hash[line.split(/\s+/).map { |kv| kv.split(':', 2) }])
end
valid += (REQUIRED_FIELDS - current.keys).empty? ? 1 : 0
    p current
    puts valid
puts "PART 1: VALID: #{valid}"
