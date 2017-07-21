#!/usr/bin/env ruby

class Employee
  attr_reader :name, :title
  attr_accessor :salary

  def initialize(name, title, salary, payroll)
    @name = name
    @title = title
    @salary = salary
    @payroll = payroll
  end

  def salary=(new_salary)
    @salary = new_salary
    # This works well when we only need to notify a single object.
    # What if there are several?
    # We would need to update the Employee class to update an
    # object that isn't an Employee....
    @payroll.update(self)
  end
end

class Payroll
  def update(changed_employee)
    puts("Cut a new check for #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end
