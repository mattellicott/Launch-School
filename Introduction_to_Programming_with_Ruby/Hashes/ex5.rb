data = { name: "Matt", gender: "Male", age: "37", height: "6'1" }

puts "Does the value, Matt, exist in the hash?"
puts data.value?("Matt")

puts "Does the value, Jim, exist in the hash?"
puts data.value?("Jim")
