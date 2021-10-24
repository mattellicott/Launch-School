def transpose!(array)
  copy = array.map { |a| a.map { |b| b } }
  copy.each_with_index do |outer, a|
    outer.each_with_index { |inner, b| array[b][a] = inner }
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)

p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
