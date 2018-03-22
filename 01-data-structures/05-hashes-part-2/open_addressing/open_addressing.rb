require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    current_index = index(key, size)
    new_node = Node.new(key, value)
    if next_open_index(current_index) == -1
      resize
      self[key] = value
    else
      @items[next_open_index(current_index)] = new_node
    end
  end

  def [](key)
    current_index = index(key, size)
    while @items[current_index] && @items[current_index].key != key
      if current_index === size - 1
        current_index = 0
      else
        current_index += 1
      end
    end
    if @items[current_index]
      return @items[current_index].value
    else
      return nil
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  def number_of_items
    counter = 0
    @items.each do |item|
      counter += 1 if item
    end
    return counter
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    if number_of_items == size
      return -1
    else
      current_index = index
      while @items[current_index] && current_index < size
        if current_index === size - 1
          current_index = 0
        else
          current_index += 1
        end
      end
      return current_index
    end

  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    new_array_size = 2 * size
    temp = @items
    @items = Array.new(new_array_size)
    temp.each do |item|
      self[item.key] = item.value if item
    end
  end
end
