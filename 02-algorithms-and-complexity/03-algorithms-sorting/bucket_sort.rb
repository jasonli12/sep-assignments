require_relative './quick_sort'

def bucket_sort(collection)
  bucket_list = []
  new_collection = []
  n = collection.length
  n.times do
    bucket_list.push([])
  end
  for i in 0...n
    bucket_number = n * collection[i]
    bucket_list[bucket_number].push(collection[i])
  end

  for i in 0...n
    if !bucket_list[i].empty?
      quick_sort(bucket_list[i])
    end
  end

  for i in 0...n
    if !bucket_list[i].empty?
      new_collection.concat(bucket_list[i])
    end
  end
  return new_collection
end
