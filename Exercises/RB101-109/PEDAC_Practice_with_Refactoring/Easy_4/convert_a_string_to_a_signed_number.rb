# Questions:
# Rules:
# Output a negative integer if the string starts with a '-'
# Output a positive integer if the string starts with '+' or digit
#
# Input: string
# Output: integer
# Algorithm:
# -remove, by mutation, the first character of string if it is a '+'
# -if the first character is a '-'
#   -call the string_to_integer method with the 2nd-last characters
#   -otherwise, call the string_to_integer method with the full string
#
N = %w(0 1 2 3 4 5 6 7 8 9)
def string_to_integer(string)
  string.reverse.chars.map.with_index { |d, idx| N.index(d) * 10.pow(idx) }.sum
end

def string_to_signed_integer(str)
  str.slice!(0) if str[0] == '+'
  str[0] == '-' ? -string_to_integer(str[1..-1]) : string_to_integer(str)
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
