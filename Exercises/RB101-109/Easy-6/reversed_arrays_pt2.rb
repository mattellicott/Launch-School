def reverse(array)
  array.inject([]) do |new_array, element|
    new_array.unshift(element)
  end
end

def reverse(array)
  array.each_with_object([]) do |element, new_array|
    new_array.unshift(element)
  end
end
# def reverse(array)
#   array_copy = array.dup
#   new_array = []
#
#   while array_copy.size > 0
#     new_array.push(array_copy.pop)
#   end
#   new_array
# end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true
