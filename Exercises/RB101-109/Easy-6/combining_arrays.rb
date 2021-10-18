def merge(arr1, arr2)
  arr1.insert(arr1.size, arr2).flatten.uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
