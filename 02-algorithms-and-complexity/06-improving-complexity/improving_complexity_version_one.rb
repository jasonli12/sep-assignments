# This method takes n arrays as input and combine them in sorted ascending  order
def ok_written_ruby(*arrays)
  combined_array = arrays[0]
  (1..arrays.length-1).each do |i|
    combined_array.concat(arrays[i])
  end

  sorted_array = [combined_array.delete_at(0)]

  for val in combined_array
    i = 0
    while i < sorted_array.length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_array.length - 1
        sorted_array << val
        break
      end
      i+=1
    end
  end

  sorted_array
end
