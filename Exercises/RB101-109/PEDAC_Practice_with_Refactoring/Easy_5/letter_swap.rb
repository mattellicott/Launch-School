# Questions:
# Requirements:
#   -retain spacing and character case
#   -string will contain words and spaces only, no extra punctuation
# Input: string
# Output: string
# Algorithm:
#   -accept 1 string as argument
#   -split string and assign as array, words
#   -iterate over each word
#     -swap first and last letter of each word
#   -join words back together with spaces

# def swap(string)
#   words = string.split
#   words.map do |word|
#     word[0], word[-1] = word[-1], word[0]
#     word
#   end.join(' ')
# end
def swap(string)
  string.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
