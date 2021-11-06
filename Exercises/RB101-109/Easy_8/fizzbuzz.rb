def fizzbuzz(num1, num2)
  result = ''
  num1.upto(num2) do |i|
    result << case
              when (i % 3 == 0) && (i % 5 == 0) then 'FizzBuzz'
              when i % 5 == 0 then 'Buzz'
              when i % 3 == 0 then 'Fizz'
              else i.to_s
              end
    result << ', ' unless i == num2
  end
  puts result
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
