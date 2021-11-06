# def multisum(int)
#   array = []
#   1.upto(int) { |x| array.push(x) if (x % 3 == 0) || (x % 5 == 0) }
#   array.sum
# end

def multisum(int)
  array = []
  1.upto(int) { |x| array.push(x) if (x % 3 == 0) || (x % 5 == 0) }
  array.inject(:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
