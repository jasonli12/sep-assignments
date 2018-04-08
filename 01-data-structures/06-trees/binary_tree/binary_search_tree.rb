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
  def find(root, data)
    return root if root.title === data
    return find(root.left, data) if root.left
    return find(root.right, data) if root.right
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
