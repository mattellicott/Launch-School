# 1
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if { |value| value.start_with?('s') }

puts arr

puts "\n"

# 2
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if { |value| value.start_with?('s', 'w') }

puts arr
