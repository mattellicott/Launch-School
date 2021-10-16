['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# Iterates the given block for each element with an arbitrary object, obj,
# and returns obj

# The returned object will be a hash based on the arguments given.
# hash[value[0]] refers to the first index of each element, or in this case, the
# first letter, which will be used as a key. value refers to each element of the
# input array.
# Returns a hash => { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }
