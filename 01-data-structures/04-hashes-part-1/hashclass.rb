class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    new_item_index = index(key, size)
    new_hash_item = HashItem.new(key, value)

    if !@items[new_item_index]
      @items[new_item_index] = new_hash_item
    elsif @items[new_item_index].key == key &&  @items[new_item_index].value != value
      resize
    elsif @items[new_item_index].key != key
      resize
      self[key] = value
    end
  end


  def [](key)
    internal_index = index(key, size)
    @items[internal_index].value
  end

  def resize
    new_array_size = 2 * size
    temp = @items
    @items = Array.new(new_array_size)
    temp.each do |item|
      if item
        self[item.key]= item.value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end
end
