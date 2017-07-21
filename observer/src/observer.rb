#!/usr/bin/env ruby

class Employee
  attr_reader :name, :title
  attr_accessor :salary

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end
end
