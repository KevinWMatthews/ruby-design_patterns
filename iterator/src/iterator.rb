# This is an external iterator.
# The aggregate of data is separate from the iteration process.
# The iterator object provides access into the aggregate.
#
# In this case the client application drives the iteration.
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


# This is an internal iterator.
# We pass it an array and a block,
# and the array (I guess we could extend the Array class?)
# calls the block for each of its own sub-objects.
#
# The aggergate drives the iteration; the client can not slow things down.
def for_each_element(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end
