# Questions:
# Rules:
# Output has the same amount of elements as input
# Each element in output is the value of the corresponding input element
#   plus the value of the previous input element
#
# Input: array of integers
# Output: array of integers
# Algorithm:
# -accept one array as argument
# -assign empty array, result, to track totals
# -assign variable, last, to track previous element, starting at 0
# -iterate over each element of input
#   -add element + last to result
#   -re-assign last to last + element
# -return result
#
# def running_total(arr)
#   result = []
#   last = 0
#   arr.each do |v|
#     result << v + last
#     last += v
#   end
#   result
# end

# Refactored
def running_total(arr)
  last = 0
  arr.map { |v| last += v }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
