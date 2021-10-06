puts "Enter a number between 0 and 100:"
number = gets.chomp.to_i

if (number >= 0) && (number <= 50)
  puts "Number is between 0 and 50."
elsif (number >= 51) && (number <= 100)
  puts "Number is between 51 and 100."
elsif number > 100
  puts "Number is greater than 100."
else
  puts "Number is less than 0."
end
