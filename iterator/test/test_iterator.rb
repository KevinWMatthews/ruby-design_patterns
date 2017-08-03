#!/usr/bin/env ruby

require_relative '../src/iterator.rb'

array = [1, 2, 3]
iterator = ExternalIterator.new(array)
puts "External iterator"
while iterator.has_next?
  puts("item: #{iterator.next_item}")
end

puts "\nInternal iterator"
for_each_element(array) do |element|
  puts("item: #{element}")
end
