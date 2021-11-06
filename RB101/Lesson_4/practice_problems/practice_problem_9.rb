{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# map() is found in the Enumerable class. It returns a new array with the
# results of the block for every element. When no condition in an if statement
# evaluates as true, it returns nil.
# => [nil, 'bear']
