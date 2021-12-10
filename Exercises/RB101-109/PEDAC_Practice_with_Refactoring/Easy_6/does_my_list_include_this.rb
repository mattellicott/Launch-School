# Input: array of integers, integer
# Output: boolean

# Return true or false, dependent on whether the integer is found in the array

# Remove all duplicate elements from the array
# Iterate over the array
#   Return true if current element equals n
# Return false

def include?(arr, n)
  arr.uniq.each { |v| return true if v == n }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
