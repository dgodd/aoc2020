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

max_id = File.read('data/day5.txt').split("\n").map do |line|
  id = seat_id(line)
  puts id
  id
end.max
puts "MAX: #{max_id}"
