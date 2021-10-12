# def running_total(array)
#   sum = 0
#   array.map! { |x| sum = sum + x }
# end

def running_total(array)
  sum = 0
  array = array.each_with_object([]) { |element, arr| arr << sum += element }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
