DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def signed_integer_to_string(int)
  sign = ''
  (sign = (int.negative? ? '-' : '+')) unless int.zero?
  string = int.abs.digits.map! { |n| DIGITS[n] }.join('').reverse
  sign + string
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
