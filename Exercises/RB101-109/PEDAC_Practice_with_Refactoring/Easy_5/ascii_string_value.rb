# Questions:
# Rules:
# Explicit:
#   Return sum of ASCII values of every character in the string
# Implicit:
#   String can be empty
# Input: string
# Output: integer
# Algorithm:
#   -break string down into an array of characters
#   -map the array, returning ASCII value of each element
#   -return the sum of the array
#
# def ascii_value(string)
#   string.chars.map(&:ord).sum
# end

def ascii_value(string)
  string.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
