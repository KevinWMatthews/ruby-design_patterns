#!/usr/bin/env ruby

require_relative '../src/observer_blocks.rb'

fred = Employee.new("Fred", "AC Repairman", 30000.0)

# These code blocks will be stored as Proc objects in the Subject class.
fred.add_observer() do |changed_employee|
  puts("Cut a new check for #{changed_employee.name}!")
  puts("His salary is now #{changed_employee.salary}!")
end

fred.add_observer() do |changed_employee|
  puts("Send #{changed_employee.name} a new tax bill!")
end

puts "Initial salary:"
puts fred.salary
puts

# Give fred a raise
fred.salary = 35000.0
puts fred.salary
puts

# Give fred another raise
fred.salary = 90000.0
puts fred.salary
