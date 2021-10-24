def transpose(array)
  new_array = Array.new(array[0].size) { Array.new(array.size) }
  0.upto(array[0].size - 1) do |a|
    0.upto(array.size - 1) do |b|
      new_array[a][b] = array[b][a]
    end
  end
  new_array
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
