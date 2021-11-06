DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_signed_integer(string)
  digits = string.chars
  sign = case digits[0]
         when '-' then digits.shift
         when '+' then digits.shift
         end
  digits.map! { |char| DIGITS[char] }
  value = 0
  digits.each { |digit| value = 10 * value + digit }
  sign == '-' ? (0 - value) : value
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
