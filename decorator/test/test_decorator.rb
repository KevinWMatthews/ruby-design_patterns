#!/usr/bin/env ruby

require_relative '../src/decorator.rb'

writer = EnhancedWriter.new('out.txt')
writer.write_line("Plain line")
checksum = writer.checksumming_write_line("Checksummed line")
puts "checksum: #{checksum}"
writer.timestamping_write_line("Timestamped line")
writer.close
