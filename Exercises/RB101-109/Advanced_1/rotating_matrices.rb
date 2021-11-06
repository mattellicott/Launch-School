def rotate90(array)
  new_array = Array.new(array[0].size) { Array.new(array.size) }
  0.upto(new_array[0].size - 1) do |a|
    (new_array.size - 1).downto(0) do |b|
      new_array[b][a] = array[a][b]
    end
  end
  new_array.map { |v| v.reverse }
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
# 1 0 -- 0 0 # 0 0 -- 0 1
matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
