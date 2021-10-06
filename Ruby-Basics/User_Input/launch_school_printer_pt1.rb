count = nil

loop do
  puts 'How many output lines do you want? Enter a number >= 3:'
  count = gets.chomp.to_i
  break if count >= 3

  puts "That's not enough lines."
end

until count.zero?
  puts 'Launch School is the best!'
  count -= 1
end
