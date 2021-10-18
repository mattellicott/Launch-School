def find_fibonacci_index_by_length(length)
  counter = 2
  num1 = 1
  num2 = 1

  while num2.to_s.length < length
    num3 = num1 + num2
    num1 = num2
    num2 = num3
    counter += 1
  end
  counter
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
