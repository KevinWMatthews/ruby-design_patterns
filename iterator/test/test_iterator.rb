#!/usr/bin/env ruby

require_relative '../src/iterator.rb'

array = [1, 2, 3]
iterator = ExternalIterator.new(array)

while iterator.has_next?
  puts("item: #{iterator.next_item}")
end
