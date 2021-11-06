# Questions:
# Rules:
# Only numeric characters will be in the input
# Output must be the input converted to a integer
# Can't use standard conversion methods from Ruby
#
# Input: string
# Output: integer
# Algorithm:
# -assign a constant array of strings of each digit, starting w/ '0'
# -accept 1 string as argument
# -reverse the string, convert it to an array, then iterate/map over each
#   element with the index
#   -return the index that contains the value of the element * 10 to the power
#     of the index
# -return the sum of the returned array
#
N = %w(0 1 2 3 4 5 6 7 8 9)
def string_to_integer(string)
  string.reverse.chars.map.with_index { |d, idx| N.index(d) * 10.pow(idx) }.sum
end

HEX = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
def hexadecimal_to_integer(string)
  string.downcase.reverse.chars.map.with_index do |d, idx|
    HEX.index(d) * 16.pow(idx)
  end.sum
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p hexadecimal_to_integer('4D9f') == 19871
