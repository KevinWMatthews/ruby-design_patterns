#!/usr/bin/env ruby

require_relative '../src/composite.rb'

task = MakeBatterTask.new
puts task.get_time_required
puts task[0]
puts task[1]
puts task[2]

puts task[0].parent
puts task[1].parent
puts task[2].parent

puts task.total_number_of_tasks
puts task[0].total_number_of_tasks
