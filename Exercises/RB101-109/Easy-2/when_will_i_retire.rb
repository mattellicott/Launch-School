print 'What is your age? '
age = gets.to_i
print 'At what age would you like to retire? '
retire_age = gets.to_i

years_left = retire_age - age
year = Time.now.year

puts "\nIt's #{year}. You will retire in #{year + years_left}"
puts "You have only #{years_left} years of work to go!"
