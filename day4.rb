#!/usr/bin/ruby

# PART 1
REQUIRED_FIELDS = %w{byr iyr eyr hgt hcl ecl pid}
valid = 0
current = {}
File.read('data/day4.txt').split("\n").each do |line|
  if line.length == 0
    valid += (REQUIRED_FIELDS - current.keys).empty? ? 1 : 0
    current = {}
    next
  end

  current.merge!(Hash[line.split(/\s+/).map { |kv| kv.split(':', 2) }])
end
valid += (REQUIRED_FIELDS - current.keys).empty? ? 1 : 0
puts "PART 1: VALID: #{valid}"

# PART 2
def is_valid(hash)
  return false unless hash['byr'].to_i >= 1920 && hash['byr'].to_i <= 2002
  return false unless hash['iyr'].to_i >= 2010 && hash['iyr'].to_i <= 2020
  return false unless hash['eyr'].to_i >= 2020 && hash['eyr'].to_i <= 2030
  (_, height, units) = hash['hgt'].to_s.match(/^(\d+)(cm|in)$/).to_a
  return false unless height && ((units == 'cm' && height.to_i >= 150 && height.to_i <= 193) || (units == 'in' && height.to_i >= 59 && height.to_i <= 76))
  return false unless hash['hcl'].to_s.match(/^#[0-9a-f]{6}$/)
  return false unless %w{amb blu brn gry grn hzl oth}.include?(hash['ecl'])
  return false unless hash['pid'].to_s.match(/^\d{9}$/)
  true
end

valid = 0
current = {}
File.read('data/day4.txt').split("\n").each do |line|
  if line.length == 0
    valid += is_valid(current) ? 1 : 0
    current = {}
    next
  end

  current.merge!(Hash[line.split(/\s+/).map { |kv| kv.split(':', 2) }])
end
valid += is_valid(current) ? 1 : 0
puts "PART 2: VALID: #{valid}"
