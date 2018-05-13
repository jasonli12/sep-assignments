def heap_sort(collection)
  new_collection = []
  while collection.size > 0
    collection = max_heapify(collection)
    new_collection.unshift(collection.shift)
  end
  return new_collection
end

def max_heapify(collection)
  swapped = false
  for i in 0...collection.length
    parent = collection[i]
    i == 0 ? child_one_index = 1 : child_one_index = 2 * i + 1
    child_two_index = child_one_index + 1
    collection[child_one_index] ? child_one = collection[child_one_index] : child_one = nil
    collection[child_two_index] ? child_two = collection[child_two_index] : child_two = nil

    if child_one && parent < child_one
      if child_two
        child_one > child_two ? swap(collection, i, child_one_index) : swap(collection, i, child_two_index)
      else
        swap(collection, i, child_one_index)
      end
      swapped = true
    elsif child_two && parent < child_two
      swap(collection, i, child_two_index)
      swapped = true
    end
  end

  if swapped
    max_heapify(collection)
  else
    return collection
  end
end

def swap(array, source_index, target_index)
  array[source_index], array[target_index] = array[target_index], array[source_index]
end
