#!/usr/bin/env ruby

# This is the 'Component', the base class. This is what all things share in common.
class Task
  attr_accessor :name, :parent

  def initialize(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0.0
  end

  def total_number_of_tasks
    1
  end
end

# This is a 'Leaf'. It is the smallest building block and can not be subdivided.
class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1.0   # 1 minute: add flour and sugar
  end
end

class AddLiquidsTask < Task
  def initialize
    super('Add wet ingredients')
  end

  def get_time_required
    1.0
  end
end

# Another leaf
class MixTask < Task
  def initialize
    super('Mix the batter')
  end

  def get_time_required
    3.0   # Minutes
  end
end

class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
    task.parent = self
  end

  def <<(task)
    @sub_tasks << task
    task.parent = self
  end

  def [](index)
    @sub_tasks[index]
  end

  def []=(index, new_value)
    @sub_tasks[index] = new_value
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    time = 0.0
    @sub_tasks.each {|task| time += task.get_time_required}
    time
  end

  def total_number_of_tasks
    total = 0
    @sub_tasks.each {|task| total += task.total_number_of_tasks}
    total
  end
end

# This is a 'Composite'. It is a Task itself but contains (several) subtasks.
class MakeBatterTask < CompositeTask
  def initialize
    super('Make batter')
    self << AddDryIngredientsTask.new
    self << AddLiquidsTask.new
    self << MixTask.new
  end
end
