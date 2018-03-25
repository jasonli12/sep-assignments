require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    resize if (number_of_items.to_f + 1)/ size > @max_load_factor
    new_item_index = index(key, size)
    new_node = Node.new(key, value)
    if !@items[new_item_index]
      llist = LinkedList.new
      llist.add_to_tail(new_node)
      @items[new_item_index] = llist
    else
      llist = @items[index(key, size)]
      current_node = llist.head
      while current_node.next && current_node.key != key
        current_node = current_node.next
      end
      if !current_node.next
        llist.add_to_tail(new_node)
      end
    end
  end

  def [](key)
    llist = @items[index(key, size)]
    current_node = llist.head
    while current_node.next && current_node.key != key
      current_node = current_node.next
    end
    current_node.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    number_of_items == 0 ? 0 : number_of_items.to_f / size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  def number_of_items
    counter = 0
    @items.each do |llist|
      if llist
        current_node = llist.head
        counter += 1
        while current_node.next
          current_node = current_node.next
          counter += 1
        end
      end
    end
    return counter
  end

  # Resize the hash
  def resize
    #determine how many times to double before looping
    new_array_size = 2 * size
    temp = @items
    @items = Array.new(new_array_size)
    temp.each do |llist|
      if llist
        current_node = llist.head
        self[current_node.key]= current_node.value
        while current_node.next
          current_node = current_node.next
          self[current_node.key]= current_node.value
        end
      end
    end
  end

  def print
    p "The load factor is #{load_factor}"
    @items.each_with_index do |llist, index|
      if llist
        current_node = llist.head
        string = " " + current_node.value
        while current_node.next
          current_node = current_node.next
          string += ", followed by " + current_node.value
        end
        p "Index #{index} contains #{string}"
      end
    end
  end
end
