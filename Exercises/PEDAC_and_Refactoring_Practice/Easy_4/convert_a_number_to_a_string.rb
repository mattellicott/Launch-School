# Questions:
# Rules:
# Do not use standard Ruby conversion methods
# Convert integer to string of integers
#
# Input: integer
# Output: string
# Algorithm:
# -assign constant, DIGITS, as array of digits from 0 to 9
# -accept 1 integer as argument
# -break apart the digits of input into an array
#   -iterate over the array
#     -append the element that has a index matching the digit
#   -join the elements together
#   -reverse the resulting string
#
DIGITS = %w(0 1 2 3 4 5 6 7 8 9)
def integer_to_string(int)
  int.digits.map { |d| DIGITS[d] }.join.reverse
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
