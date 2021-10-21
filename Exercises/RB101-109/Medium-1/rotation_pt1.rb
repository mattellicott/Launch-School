def rotate_array(array)
  copy = array.dup

  array.each_with_index do |element, idx|
    copy[idx-1] = element
  end
  copy
end

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(int)
  rotate_array(int.to_s.chars).join.to_i
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

p rotate_string('abcd') == 'bcda'
p rotate_integer(1234) == 2341
