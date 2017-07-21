#!/usr/bin/env ruby

# We could/will end up implementing several Observer patterns.
# If this is the case in your project, extract the mechanics
# of the observer pattern.
module Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
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
    super()   # Incorporate stuff from the module. Add parenthesis to send no arguments.
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

# These are the Observer classes.
# The need to be notified when the subject class changes.
class Payroll
  def update(changed_employee)
    puts("Cut a new check for #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end

class TaxMan
  def update(changed_employee)
    puts("Send #{changed_employee.name} a new tax bill!")
  end
end
