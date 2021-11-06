[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# map() iterates over each element of the given array and replaces it with the
# result from the block.
# 1 is not > 1, so the first value returned is 1.
# 2 is > 1, so the second value returned is nil(puts num)
# 3 is > 1, so the second value returned is nil(puts num)
# => [1, nil, nil]
# It also outputs:
# 2
# 3
