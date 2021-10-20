def greetings(name, status)
  puts "Hello, #{name.join(' ')}! "\
       "Nice to have a #{status[:title]} #{status[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
