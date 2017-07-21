#!/usr/bin/env ruby

require_relative '../src/observer.rb'

payroll = Payroll.new
tax_man = TaxMan.new
fred = Employee.new("Fred", "AC Repairman", 30000.0)
fred.add_observer(payroll)
fred.add_observer(tax_man)

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
