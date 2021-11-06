# Case sensitive
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(arr)
  arr.uniq.each { |word| puts "#{word} => #{arr.count(word)}" }
end

count_occurrences(vehicles)

# Case insensitive
vehicles_nocase = [
  'cAr', 'car', 'trUck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorCycle', 'car', 'truck'
]

def count_occurrences_nocase(arr)
  arr = arr.each(&:downcase!) # { |word| word.downcase! }
  arr.uniq.each { |word| puts "#{word} => #{arr.count(word)}" }
end

count_occurrences_nocase(vehicles_nocase)
