# Input: string
# Output: string

# Collapse consecutive duplicate characters to a single character
# Combine the resulting single characters

# Initialize a copy of the Input, str_copy
# Initialize an empty empty Array, letters

# Iterate through each character of str_copy and add it to letters if the last
#   element of letters doesn't match the current character
# Combine letters into a string
#

def crunch(str)
  str.chars.each.with_object([]) do |c, arr|
    arr << c unless arr.last == c
  end.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
