numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# The block updates numbers with each iteration by removing the leading element.
# each() still continues to increase the count for the index it is on through
# each iteration.
# 1
# 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# In this case, each iteration of the block removes the last index in the array.
# Rather than iterating 4 times, it only iterates twice.
# 1
# 2
