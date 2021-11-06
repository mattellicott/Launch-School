def average(arr)
  arr.map!(&:to_f)
  arr.sum / arr.size
end

puts average([1, 6]) == 3.5 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25.666666666666668
puts average([9, 47, 23, 95, 16, 52]) == 40.333333333333336
