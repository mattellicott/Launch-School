NUMBERS = %w(zero one two three four five six seven eight nine)

# def word_to_digit(string)
#   string.split.map do |word|
#     x = word.split(/\w/)
#     if NUMBER.any?(word.scan(/\w/).join)
#       x[1] = NUMBER.index(word.scan(/\w/).join)
#       x.join('')
#     else
#       word
#     end
#   end.join(' ')
# end
def word_to_digit(string)
  NUMBERS.each do |word|
    string.gsub!(/\b#{word}\b/i, NUMBERS.index(word).to_s)
  end
  string
end

p word_to_digit('Please call me at  FIVE five five one two three four. Thanks.')#\
#              == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

#string.replace
