
# This method takes n arrays as input and combine them in sorted ascending  order
def better_written_ruby(*arrays)
  combined_array = arrays[0]
  (1..arrays.length-1).each do |i|
    combined_array.concat(arrays[i])
  end
  merge_sort(combined_array)
end

def merge_sort(collection)
  if collection.length <= 1
    collection
  else
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end
