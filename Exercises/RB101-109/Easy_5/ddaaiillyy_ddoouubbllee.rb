# # Original solution
# def crunch(string)
#   new_string = ''
#   string.chars.each { |char| new_string += char unless char == new_string[-1] }
#   new_string
# end
#
# # Another solution using select and a case statement
# def crunch(string)
#   last = ''
#   arr = string.chars.select do |char|
#     case char == last
#     when true
#       last = char
#       false
#     else
#       last = char
#       true
#     end
#   end
#   arr.join
# end
#
# Regexp solution
def crunch(string)
  string.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
