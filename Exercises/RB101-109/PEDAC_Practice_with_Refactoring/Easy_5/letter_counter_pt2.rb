# Questions:
# Requirements:
#   -modify method from previous exercise, letter_counter_pt1
#   -do not count non-letters
# Input: string
# Output: hash
# Algorithm:
#   -accept 1 string as argument
#   -assign empty hash, hash
#   -split the string into an array, words, delimited by ' '
#   -iterate over each word in the array
#     -add the letter count of the word to the hash as a key with value, 1
#       -if the key already exists, increase the value of it by 1
#   -return the hash
#
def word_sizes(string)
  hash = {}
  string.split.each do |word|
    letter_count = word.count("A-Za-z")
    hash.key?(letter_count) ? hash[letter_count] += 1 : hash[letter_count] = 1
  end
  hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
