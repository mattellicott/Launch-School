OP = %w(+ - * / % **)

puts "==> Enter the num1 number:"
num1 = gets.to_i
puts "==> Enter the num2 number:"
num2 = gets.to_i

OP.each { |x| puts "==> #{num1} #{x} #{num2} = #{num1.public_send(x, num2)}" }
