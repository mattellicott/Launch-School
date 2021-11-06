['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# Use the docs. count iterates over each element and returns the sum of each
# case where str.length < 4 is true. Returns 2
