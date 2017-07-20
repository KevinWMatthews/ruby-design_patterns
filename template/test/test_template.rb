#!/usr/bin/env ruby

require_relative '../src/template.rb'

report = HtmlReport.new
report.output_report
puts
puts
report = PlainTextReport.new
report.output_report
