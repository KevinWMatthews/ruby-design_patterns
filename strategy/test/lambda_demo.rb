#!/usr/bin/env ruby

# A Proc is an object that holds a block of code
# (the block is between the do/end or {})
# If we simply use this syntax, Ruby will package the code block into a Proc object.
# We can assign this to a variable.
# We can execute this block by using the call() method.
hello = lambda do
  puts('Hello')
  puts('I am inside a proc')
end
hello.call

puts
puts


# Proc objects retain access to all variables that are currently in scope.
name = 'John'
proc = Proc.new do
  name = 'Mary'
end

puts(name)
proc.call
puts(name)

puts
puts


# Proc objects return a value
return_42 = lambda {42}
puts(return_42.call)

puts
puts


# Proc objects can accept an argument
argument = lambda {|a| a}
puts(argument.call(1))

multiply = lambda {|x, y| x * y}
n = multiply.call(4, 5)
puts(n)

puts
puts


# All this proc stuff has a special syntax: yield
# Ruby does a lot of work for you. Hang on tight...

# This method implicitly requires a block as an argument...
def run_it
  puts("Before yield")
  yield
  puts("After yield")
end

something = lambda {puts 'Inside the proc block'}
run_it(&something)    # the & signifies that the argument is a Proc object
puts

def run_it_exlicit(&block)
  puts("Before yield")
  yield
  puts("After yield")
end

something = lambda {puts 'Inside the proc block'}
run_it_exlicit(&something)    # the & signifies that the argument is a Proc object
puts

# Rather than forcing things to be passed around,
# Ruby simplifies the syntax for us: we can define the block as the method is called
def run_it_ruby
  puts("Before yield")
  yield
  puts("After yield")
end

run_it_ruby do
  puts('I am a block')
end
puts

# All this can be done with a parameter
# This is useful if your method (object) has some data that it needs to pass to the block
def run_it_with_parameter
  puts("Before yield")
  yield(42)
  puts("After yield")
end

run_it_with_parameter do |x|
  puts("The block was passed #{x}")
end
