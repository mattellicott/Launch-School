print 'What is your name? '
name = gets.chomp

puts name.end_with?('!') ? "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?" : "Hello #{name}."
