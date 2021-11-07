# Questions:
# Requirements:
#   -words should be separated by a space
#   -consecutive non-alphabetic characters should be replace by a space
#   -ouput should never have consecutive spaces
# Input: string
# Output: string
# Algorithm:
#   -accept 1 string as argument
#   -replace non-alphabetic characters with spaces
#     -use gsub and regex
#   -squeeze the result to condense spaces
#
def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze
end

p cleanup("---what's my +*& line?") == ' what s my line '
