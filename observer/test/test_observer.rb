#!/usr/bin/env ruby

require_relative '../src/observer.rb'

fred = Employee.new("Fred", "AC Repairman", 30000.0)
puts fred.salary
# Give fred a raise
fred.salary = 35000.0
puts fred.salary
