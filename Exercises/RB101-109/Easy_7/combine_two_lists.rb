def interleave(arr1, arr2)
  # new_array = []
  # arr1.each_index do |index|
  #   new_array << arr1[index] << arr2[index]
  # end
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
