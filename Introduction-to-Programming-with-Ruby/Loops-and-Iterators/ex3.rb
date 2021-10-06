def counter(num)
  if num >= 0
    puts num
    counter(num-1)
  end
end


puts "Enter a number:"
x = gets.chomp.to_i

counter(x)
