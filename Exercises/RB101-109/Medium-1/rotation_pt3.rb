def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(num1, n)
  digits = num1.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

def max_rotation(int)
  digits = int
  n = int.to_s.size

  while n > 0
    digits = rotate_rightmost_digits(digits, n)
    n -= 1
  end
  digits
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
