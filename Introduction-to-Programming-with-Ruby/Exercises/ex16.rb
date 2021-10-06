contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
entries = [:email, :address, :phone]

contacts.each do |key, value|
  entries.each do |entry|
    value[entry] = contact_data.shift
  end
end

puts "JOE: #{contacts["Joe Smith"]}"
puts "\n"

# BONUS
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
          ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
entries = [:email, :address, :phone]

contacts.each_with_index do |(key, value), index|
  entries.each do |entry|
    value[entry] = contact_data[index].shift
  end
end

puts "JOE: #{contacts["Joe Smith"]}"
puts "SALLY: #{contacts["Sally Johnson"]}"
