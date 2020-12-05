#!/usr/bin/ruby

def row(str)
  str.gsub('F', '0').gsub('B', '1').to_i(2)
end
def seat(str)
  str.gsub('L', '0').gsub('R', '1').to_i(2)
end
def seat_id(str)
  str.gsub('F', '0').gsub('B', '1').gsub('L', '0').gsub('R', '1').to_i(2)
end
puts "ROW: FBFBBFF -> 44 == #{row('FBFBBFF')} #{seat('RLR')}}"
puts "SEAT ID: BFFFBBFRRR -> 567 == #{seat_id('BFFFBBFRRR')}"
puts "SEAT ID: FFFBBBFRRR -> 119 == #{seat_id('FFFBBBFRRR')}"
puts "SEAT ID: BBFFBBFRLL -> 820 == #{seat_id('BBFFBBFRLL')}"

all_ids = File.read('data/day5.txt').split("\n").map do |line|
  seat_id(line)
end
puts "MAX: #{all_ids.max}"

missing = (0..955).to_a - all_ids.sort
([-1] + missing + [-1]).each_cons(3).each do |(before,val,after)|
  next if (before + 1) == val || (val + 1) == after

  puts "MY SEAT: #{val}"
end
