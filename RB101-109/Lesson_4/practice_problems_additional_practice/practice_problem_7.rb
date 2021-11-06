statement = "The Flintstones Rock"
hash = {}

char_array = statement.split('')

loop do
  break if char_array.empty?

  current_char = char_array.shift
  hash.key?(current_char) ? hash[current_char] += 1 : hash[current_char] = 1
end

p hash
