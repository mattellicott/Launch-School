USERNAME = 'Matt'
PASSWORD = 'DErP'

loop do
  puts 'Please enter user name:'
  name = gets.chomp
  puts 'Please enter your password:'
  pass = gets.chomp
  break if name.match(USERNAME) && pass.match(PASSWORD)

  puts 'Authorization failed!'
end

puts 'Welcome!'
