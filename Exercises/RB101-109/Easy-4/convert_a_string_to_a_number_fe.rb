HEX = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}

def hexadecimal_to_integer(string)
  array = string.downcase.split('')
  array.map! { |x| HEX[x] }
  exponent = 0
  total = 0
  array.reverse_each do |num|
    total += num * (16**exponent)
    exponent += 1
  end
  total
end

puts hexadecimal_to_integer('4D9f') == 19871
