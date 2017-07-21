#!/usr/bin/env ruby

# Ruby has a pre-built implementation of the Observer pattern
require 'observer'

# This is the Subject class.
# It is the source of news; it is changing.
class Employee
  include Observable

  attr_reader :name, :title
  attr_accessor :salary

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    changed     # This must be done before calling notify_observers(). It lets the Observerable module know that the object really has changed.
    notify_observers(self)
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
