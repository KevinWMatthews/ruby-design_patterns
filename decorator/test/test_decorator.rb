#!/usr/bin/env ruby

require_relative '../src/decorator.rb'

writer = SimpleWriter.new('out.txt')
writer.write_line('Plain line')
writer.close

writer = NumberingWriter.new(SimpleWriter.new('numbered.txt'))
writer.write_line('This line is numbered.')
writer.write_line('So is this one.')
writer.close

writer = CheckSummingWriter.new(SimpleWriter.new('checksummed.txt'))
writer.write_line('This file is checksummed.')
writer.close
puts "checksum: #{writer.check_sum}"

writer = TimeStampingWriter.new(SimpleWriter.new('timestamped.txt'))
writer.write_line('This line has a time stamp.')
writer.close

writer = TimeStampingWriter.new(NumberingWriter.new(SimpleWriter.new('numbered_and_timestamped.txt')))
writer.write_line('This file has both')
writer.write_line('timestamps')
writer.write_line('and line numbers')
writer.close
