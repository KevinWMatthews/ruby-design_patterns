#!/usr/bin/env ruby

# This is the 'Component', the base class. This is what all things share in common.
class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
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

# This is a 'Composite'. It is a Task itself but contains (several) subtasks.
class MakeBatterTask < Task
  def initialize
    super('Make batter')
    @sub_tasks = []
    add_sub_task( AddDryIngredientsTask.new )
    add_sub_task( AddLiquidsTask.new )
    add_sub_task( MixTask.new )
  end

  def add_sub_task(task)
    @sub_tasks << task
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
  end

  def get_time_required
    time = 0.0
    @sub_tasks.each {|task| time += task.get_time_required}
    time
  end
end
