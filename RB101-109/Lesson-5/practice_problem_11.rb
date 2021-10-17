arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
#     [[ ], [3,  ,  ], [9], [  ,   , 15]]

arr2 = arr.map do |element|
  element.select do |int|
    int % 3 == 0
  end
end

p arr2
