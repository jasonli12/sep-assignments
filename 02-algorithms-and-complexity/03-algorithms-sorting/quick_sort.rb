def quick_sort(collection, first = 0,  last = collection.length - 1)
  pivot = collection[last]
  pivot_index = last
  i = first
  while i < pivot_index
    if collection[i] > pivot
      removed_element = collection.delete_at(i)
      pivot_index -= 1
      collection.insert((pivot_index + 1), removed_element)
    else
      i += 1
    end
  end
  if collection.size == 2
    return collection
  end
  left = collection[first..(pivot_index - 1)]
  right = collection[(pivot_index + 1)..last]
  if left.length > 1
    quick_sort(collection, first, pivot_index - 1)
  end
  if right.length > 1
    quick_sort(collection, pivot_index + 1, last)
  end
  return collection
end
