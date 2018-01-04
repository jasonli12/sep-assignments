class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item
    self.top = item
  end

  def pop
    temp = @stack.delete(self.top)
    self.top = @stack.last
    return temp
  end

  def empty?
    @stack === [] ? true : false
  end
end
