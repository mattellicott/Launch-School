stat1 = { name: "Matt", gender: "Male" }
stat2 = { age: "37", height: "6'1" }

puts ".merge combines the 2 hashes into a new hash without destroying the old ones."
p stat1.merge(stat2)
puts "stat1: #{stat1}"
puts "stat2: #{stat2}"

puts "\n"

puts ".merge! combines the 2 hashes, destroying the original hash."
p stat1.merge!(stat2)
puts "stat1: #{stat1}"
puts "stat2: #{stat2}"
