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
    return nil if data === nil
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
    target_node = find(root, data)
    target_node.title = nil if target_node
    target_node.rating = nil if target_node
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
