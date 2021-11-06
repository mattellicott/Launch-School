# Questions:
# Rules:
# Input is always > 1
# Looking for the sum of:
#   multiples of 3 between 1 and input
#   multiples of 5 between 1 and input
#   use only unique numbers to calculate the sum
#
# Input: integer
# Output: integer
# Algorithm:
# -assign array, multiples, to []
# -iterate through all integers from 1 to input
#   -add the current integer to the array if it divided by 3 leaves no remainder
#   -add the current integer to the array if it divided by 5 leaves no remainder
# -remove duplicate values in the array
# -return the sum of the values in the array
def multisum(n)
  1.upto(n).with_object([]) { |i, m| m << i if i % 3 == 0 || i % 5 == 0 }.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
