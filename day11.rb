#!/usr/bin/ruby
require 'pry'

EMPTY = 1
FULL = 2
FLOOR = 3

def layout(path)
  File.read(path).split(/\n/).map do |line|
    line.split('').map do |c|
      {'L' => EMPTY, '.' => FLOOR, '#' => 'FULL'}.fetch(c)
    end
  end
end

def adjacent(seats, i, j)
  ((i-1)..(i+1)).flat_map do |row|
    ((j-1)..(j+1)).map do |col|
      seats[row][col] if seats[row] && row >= 0 && col >= 0 && (row != i || col != j)
    end
  end.compact
end

def see_others(seats, i, j)
  count = 0
  count += 1 if seats[i].any?(FULL) # Same row
  count += 1 if seats.map { |row| row[j] }.any?(FULL) # Same Column
  # First diagonal
  ((i - j)..[seats.length, seats.first.length].max).each.with_index do |x|
end

def next_seats(seats)
  new = []
  seats.each.with_index do |row, i|
    row.each.with_index do |loc, j|
      new[i] ||= []
      new[i][j] = case loc
                  when FLOOR
                    FLOOR
                  when EMPTY
                    adjacent(seats, i, j).none?(FULL) ? FULL : EMPTY
                  when FULL
                    adjacent(seats, i, j).count(FULL) >= 4 ? EMPTY : FULL
                  end
    end
  end
  new
end

def print_seats(seats)
  seats.each.with_index do |row, i|
    row.each.with_index do |loc, j|
      case loc
      when FLOOR then print '.'
      when EMPTY then print 'L'
      when FULL then print '#'
      end
    end
    print "\n"
  end
end

def run_seats(path)
  seats = layout(path)
  print_seats(seats)
  old_seats = nil
  while old_seats != seats
    old_seats = seats
    seats = next_seats(seats)
    puts '-------------'
    print_seats(seats)
  end
  seats.flatten.count(FULL)
end

puts "\nPART 1 - SAMPLE - ANS: #{run_seats('data/day11_sample.txt')}\n"
puts "\nPART 1 - ANS: #{run_seats('data/day11.txt')}\n"
