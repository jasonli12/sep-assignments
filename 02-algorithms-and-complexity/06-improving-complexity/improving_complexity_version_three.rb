require_relative 'node'
# This method takes n arrays as input and combine them in sorted ascending  order
class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head, @tail, = nil, nil
  end

  def add(node)
    if !@head
      @head = node
      @tail = node
    elsif @head.data > node.data
      node.next = @head
      @head = node
    elsif @tail.data < node.data
      @tail.next = node
      @tail = node
    else
      current_node = @head
      while current_node.next.data < node.data
        current_node = current_node.next
      end
      node.next = current_node.next
      current_node.next = node
    end
  end

  def insert_nodes(collection)
    collection.each do |i|
      add(Node.new(i))
    end
  end

  def print
    current_node = @head if @head
    sorted_array = []
    while current_node
      sorted_array.push(current_node.data)
      current_node = current_node.next
    end
    sorted_array
  end
end

def cool_written_ruby(*arrays)
  combined_array = arrays[0]
  (1..arrays.length-1).each do |i|
    combined_array.concat(arrays[i])
  end
  ll = LinkedList.new
  ll.insert_nodes(combined_array)
  ll.print
end
