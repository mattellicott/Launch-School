arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr2 = arr.sort_by do |element|
  element.select(&:odd?)
end

p arr2
