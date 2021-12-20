def merge_sort(array)
  n = array.size
  return array if n == 1

  a = array[0..((n / 2) - 1)]
  b = array[(n / 2)..-1]
  a = merge_sort(a)
  b = merge_sort(b)

  merge(a, b)
end

def merge(arr1, arr2)
  result = []
  idx = 0

  arr1.each do |value|
    while idx < arr2.size && arr2[idx] <= value
      result << arr2[idx]
      idx += 1
    end
    result << value
  end

  result.concat(arr2[idx..-1])
end

# p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim
#                Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18,
#              46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51,
#                       54]
