#!/usr/bin/ruby
require 'pry'

def get_groups(path) 
  groups = [[]]
  File.read(path).split("\n").each do |line|
    if line == ''
      groups << []
    else
      groups[-1] << line
    end
  end
  groups
end
def group_uniq(groups)
  groups.map do |group|
    group.flat_map { |w| w.split('') }.uniq
  end
end
def sum_questions(groups)
  groups.sum { |a| a.length }
end

groups = group_uniq(get_groups('data/day6_sample.txt'))
puts "Day 6: Part 1: Sample: #{sum_questions(groups)}"

groups = group_uniq(get_groups('data/day6.txt'))
puts "Day 6: Part 1: #{sum_questions(groups)}"
