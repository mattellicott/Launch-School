[1, 2, 3].reject do |num|
  puts num
end

# Returns a new Array whose elements are all those from self for which the block
# returns false or nil:

# puts num will always return nil, so each the returned array will be [1, 2, 3]
