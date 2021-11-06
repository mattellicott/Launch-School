# def word_cap(string)
#   string.split.map(&:capitalize).join(' ')
# end

def word_cap(string)
  result = string.split.map do |word|
    word.downcase!
    word[0] = word[0].upcase
    word
  end
  result.join(' ')
end

# def word_cap(string)
#   array = []
#   string.downcase.split.each do |word|
#     word[0] = word[0].upcase
#     array << word
#   end
#   array.join(' ')
# end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
