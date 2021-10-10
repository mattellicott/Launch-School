def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def power(num1, num2)
  return nil if num2 < 0
  return 1 if num2.zero?

  result = num1
  (num2 - 1).times { result = multiply(result, num1) }
  result
end

# puts square(5) == 25
# puts square(-8) == 64
puts power(-5, 3)
puts power(0, 0)
