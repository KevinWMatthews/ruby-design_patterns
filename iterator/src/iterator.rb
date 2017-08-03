# This is an external iterator.
# The aggregate of data is separate from the iteration process.
# The iterator object provides access into the aggregate.
class ExternalIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end
