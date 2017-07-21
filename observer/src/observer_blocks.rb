#!/usr/bin/env ruby

# Ruby has a pre-built implementation of the Observer pattern
require 'observer'

module Subject
  def initialize
    @observers = []   # This holds a bunch of Procs
  end

  # Add a block of code
  def add_observer(&observer)
    @observers << observer
  end

  # Wait, how do we do this now?
  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.call(self)   # Call each Proc
    end
  end
end

# This is the Subject class.
# It is the source of news; it is changing.
class Employee
  include Subject

  attr_reader :name, :title
  attr_accessor :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

# The Observers are now code blocks. See the tests.
