require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    current_node = root
    if node.rating < current_node.rating
      if !current_node.left
        current_node.left = node
      else
        current_node = current_node.left
        insert(current_node, node)
      end
    else
      if !current_node.right
        current_node.right = node
      else
        current_node = current_node.right
        insert(current_node, node)
      end
    end
  end

  # Recursive Depth First Search
  #base case -> keep track that we found
  def find(root, data)
    result = nil
    return root if root.title === data
    if root.left
      result = find(root.left, data)
    end
    if root.right && !result
      result = find(root.right, data)
    end
    return result
  end

  def delete(root, data)
    current_node = root
    if current_node.left
      if current_node.rating < current_node.left.rating
        prev_child = current_node.left
        current_node.left.left = current_node
        current_node.left.right = current_node.right
        current_node.left = prev_child.left
        current_node.right = prev_child.right
      end
      if current_node.left.title != data
        delete(current_node.left, data)
      else
        if !current_node.left.left && !current_node.left.right
          current_node.left = nil
        elsif current_node.left.left && current_node.left.right
          current_node.left.left.right =  current_node.left.right
          current_node.left = current_node.left.left
        elsif current_node.left.left
          current_node.left = current_node.left.left
        elsif current_node.left.right
          current_node.left = current_node.left.right
        end
      end
    elsif current_node.right
      if current_node.rating > current_node.right.rating
        prev_child = current_node.right
        current_node.right.left = current_node.left
        current_node.right.right = current_node
        current_node.left = prev_child.left
        current_node.right = prev_child.right
      end
      if current_node.right.title != data
        delete(current_node.right, data)
      else
        if !current_node.right.left && !current_node.right.right
          current_node.right = nil
        elsif current_node.right.left && current_node.right.right
          current_node.right.right.left =  current_node.right.left
          current_node.right = current_node.right.right
        elsif current_node.right.left
          current_node.right = current_node.right.left
        elsif current_node.right.right
          current_node.right = current_node.right.right
        end
      end
    end
  end

  # Recursive Breadth First Search
  def printf
    queue = [@root]
    while !queue.empty?
      temp = queue.shift
      print "#{temp.title}: #{temp.rating}\n"
      queue.push(temp.left)if temp.left
      queue.push(temp.right)if temp.right
    end
  end
end

root = Node.new("The Matrix", 87)
tree = BinarySearchTree.new(root)
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

tree.insert(root, pacific_rim)
tree.insert(root, district)
tree.printf
p tree.find(root, pacific_rim.title)
p tree.find(root, district.title)
