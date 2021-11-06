# Questions:
# Rules:
# Use the previously coded integer_to_string method
# Use the previous constant, DIGITS
# Prepend a '+' if positive input, '-' if negative input
#
# Input: integer
# Output: string
# Algorithm:
# -return '0' if input is 0
# -return '+' + integer_to_string(input.abs) if input is positive
# -return '-' + integer_to_string(input.abs) if input is negative
DIGITS = %w(0 1 2 3 4 5 6 7 8 9)
def integer_to_string(int)
  int.digits.map { |d| DIGITS[d] }.join.reverse
end

def signed_integer_to_string(int)
  return '0' if int == 0
  (int.positive? ? '+' : '-') + integer_to_string(int.abs)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
