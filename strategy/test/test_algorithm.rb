#!/usr/bin/env ruby

require_relative '../src/algorithm.rb'

report = Report.new(HTMLFormatter.new)
report.output_report()
puts
puts
report.formatter = PlainTextFormatter.new
report.output_report()
