require_relative 'node'

class MinBinaryHeap
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def insert(node)
    queue = [@root]
    array = [0]
    while !queue.empty?
      temp = queue.shift # root comes out
      array.push(temp)
      queue.push(temp.left) if temp.left
      queue.push(temp.right) if temp.right
    end
    array.push(node)
    rotate(array, array.size - 1)
    array.each_with_index do |node, index|
      next if index === 0
      @root = node if index === 1
      node.left = array[2 * index]
      node.right = array[2 * index + 1]
    end
  end

  def rotate(array, index)
    parent_index = index / 2
    return if index <= 1
    return if array[parent_index].rating < array[index].rating
    swap(array, index, parent_index)
    rotate(array, parent_index)
  end

  def swap(array, source_index, target_index)
    array[source_index], array[target_index] = array[target_index], array[source_index]
  end

  def find(data)
    result = nil
    queue = [@root]
    while !queue.empty?
      temp = queue.shift
      if temp.title === data
        result = temp
        break
      end
      queue.push(temp.left) if temp.left
      queue.push(temp.right) if temp.right
    end
    return result
  end

  def delete(data)
    queue = [@root]
    array = [0]
    while !queue.empty?
      temp = queue.shift
      array.push(temp)
      queue.push(temp.left) if temp.left
      queue.push(temp.right) if temp.right
    end

    target_index = nil

    array.each_with_index do |node, index|
      next if index === 0
      if node.title === data
        target_index = index
        break
      end
    end

    if target_index
      rotate_down(array, target_index)
      # p array
      array.each_with_index do |node, index|
        next if index === 0
        @root = node if index === 1
        if node
          node.left = array[2 * index]
          node.right = array[2 * index + 1]
        end
      end
    end
  end

  def rotate_down(array, index)
    child_one_index = 2 * index
    child_two_index = child_one_index + 1
    child_one = array[child_one_index]
    child_two = array[child_two_index]

    if child_one && child_two
      if child_one.rating < child_two.rating
        swap(array, index, child_one_index)
        rotate_down(array, child_one_index)
      else
        swap(array, index, child_two_index)
        rotate_down(array, child_two_index)
      end
    elsif child_one
      swap(array, index, child_one_index)
      rotate_down(array, child_one_index)
    elsif child_two
      swap(array, index, child_two_index)
      rotate_down(array, child_two_index)
    else
      array[index] = nil
    end
  end

  def printf
    queue = [@root]
    while !queue.empty?
      temp = queue.shift
      print "#{temp.title}: #{temp.rating}\n"
      queue.push(temp.left) if temp.left
      queue.push(temp.right) if temp.right
    end
  end
end

root = Node.new("The Matrix", 87)
heap = MinBinaryHeap.new(root)
pacific_rim = Node.new("Pacific Rim", 72)
braveheart = Node.new("Braveheart", 78)
jedi = Node.new("Star Wars: Return of the Jedi", 80)
donnie = Node.new("Donnie Darko", 85)
inception = Node.new("Inception", 86)
district = Node.new("District 9", 90)
shawshank = Node.new("The Shawshank Redemption", 91)
martian = Node.new("The Martian", 92)
hope = Node.new("Star Wars: A New Hope", 93)
empire = Node.new("Star Wars: The Empire Strikes Back", 94)
mad_max_2 = Node.new("Mad Max 2: The Road Warrior", 98)

heap.insert(pacific_rim)
heap.insert(district)
heap.insert(braveheart)
heap.insert(inception)
heap.insert(jedi)
heap.insert(empire)
heap.insert(donnie)
# puts "Before delete"
heap.printf
p heap.find("Inception")
# heap.delete("Star Wars: Return of the Jedi")
# puts "Delete complete"
# heap.printf
# p heap.find("Donnie Darko")
