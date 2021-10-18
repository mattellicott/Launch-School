def reverse!(array)
  array_copy = array.dup
  index = 0

  while index < array_copy.size
    array[index] = array_copy[array_copy.size - index - 1]
    index += 1
  end
  array
end

p reverse!([1,2,3,4])
p reverse!(%w(a b e d c))
p reverse!(['abc'])
p reverse!([])
