#!/usr/bin/env ruby

require_relative '../src/algorithm_proc.rb'

report = Report.new(&HTML_FORMATTER)
report.output_report()
puts
puts
report.formatter = PLAIN_TEXT_FORMATTER
report.output_report()
puts
puts
report = Report.new do |title, text|
  puts("*** This is a custom report ***")
  puts("You're Fired!")
end
report.output_report
