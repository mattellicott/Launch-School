ORDINAL_NUMBERS = %w[1st 2nd 3rd 4th 5th last]

numbers = []
last_number = nil
6.times do |num|
  puts "==> Enter the #{ORDINAL_NUMBERS[num]} number:"
  num < 5 ? numbers.push(gets.to_i) : last_number = gets.to_i
end

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end
