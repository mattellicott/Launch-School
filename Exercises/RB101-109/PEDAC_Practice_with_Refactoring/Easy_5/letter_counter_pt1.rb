# Questions:
# Requirements:
#   -output keys are equivalent to word sizes
#   -output values are equivalent to the amount of words with sizes matching key
# Input: string
# Output: hash
# Algorithm:
#   -accept 1 string as argument
#   -assign empty hash, hash
#   -split the string into an array, words, delimited by ' '
#   -iterate over each word in the array
#     -add the size of the word to the hash as a key with value, 1
#       -if the key already exists, increase the value of it by 1
#   -return the hash
# def word_sizes(string)
#   hash = {}
#   string.split.each do |word|
#     if hash.key?(word.size)
#       hash[word.size] += 1
#     else
#       hash[word.size] = 1
#     end
#   end
#   hash
# end

def word_sizes(string)
  hash = {}
  string.split.each { |w| hash[w.size] ? hash[w.size] += 1 : hash[w.size] = 1 }
  hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
