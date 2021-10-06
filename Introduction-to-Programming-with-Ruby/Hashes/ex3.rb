data = { name: "Matt", gender: "Male", age: "37", height: "6'1" }

puts "KEYS:"
data.each_key { |k| puts k }

puts "\n"

puts "VALUES:"
data.each_value { |v| puts v }

puts "\n"

puts "KEYS AND VALUES:"
data.each { |k,v| puts "#{k} = #{v}" }
