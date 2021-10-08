puts ">> Please enter an integer greater than 0:"
int = gets.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

case operation
when 's'
  total = (1..int).inject(:+)
  puts "The sum of the integers between 1 and #{int} is #{total}"
when 'p'
  total = (1..int).inject(:*)
  puts "The product of the integers between 1 and #{int} is #{total}"
end
