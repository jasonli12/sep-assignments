require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head, @tail, = nil, nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    @head ? @tail.next = node : @head = node
    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail
      @head, @tail, = nil, nil
    elsif @head
      current_node = @head
      while current_node.next != @tail
        current_node = current_node.next
      end
      current_node.next = nil
      @tail = current_node
    end
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head if @head
    while current_node
      puts current_node.data
      current_node = current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head === node && @head.next
      @head = @head.next
      node.next = nil
    elsif @head
      current_node = @head
      while current_node.next != node
        current_node = current_node.next
      end
     current_node.next = node.next
     @tail = current_node if @tail === node
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head if @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head.next if @head
    @head.next = nil
    @head = temp
  end
end
