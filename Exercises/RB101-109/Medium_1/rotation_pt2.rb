def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(num1, n)
  array = num1.to_s.chars
  first_half = array[0..-n-1]
  second_half = array[-n..-1]
  (first_half + rotate_array(second_half)).join.to_i
end

# def rotate_rightmost_digits(num1, n)
#   digits = num1.to_s.chars
#   digits[-n..-1] = rotate_array(digits[-n..-1])
#   digits.join.to_i
# end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
