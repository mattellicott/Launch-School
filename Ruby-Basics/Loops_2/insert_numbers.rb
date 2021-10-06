numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers.append(input)
  break if numbers.size == 5
end

puts numbers
