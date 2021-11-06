puts '=> Enter a name:'
name = gets.chomp
name << (name.empty? ? 'Teddy' : '')
puts "#{name} is #{rand(20...180)} years old!"
