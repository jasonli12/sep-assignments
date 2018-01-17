require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head, @tail, = nil, nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head
      @tail.next = node
      @tail = node
    else
      @head = node
      @tail = node
    end

  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail
      @head, @tail, = nil, nil
    elsif @head
      current_node = @head
      while current_node.next && current_node.next != @tail
        current_node = current_node.next
      end
      current_node.next = nil
      @tail = current_node
    end
  end

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

      if @tail === node
        current_node.next = nil
        @tail = current_node
      else
         current_node.next = node.next
      end
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

  # This method finds the nth node.
  def find_n_node(n)
    if @head
      current_node = @head
      counter = 1
      while current_node.next && counter < n
        current_node = current_node.next
        n += 1
      end
      return current_node
    end
  end

  # This method removes the nth node.
  def remove_n_node(n)
    if @head
      node_before = find_n_node(n - 1)
      target_node = node_before.next
      node_after = target_node.next

      if @head === target_node
        @head = target_node.next
        target_node.next = nil
      elsif target_node
        node_before.next = node_after
      end
    end
  end
end
