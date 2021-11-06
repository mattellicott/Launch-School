# Questions:
# Rules:
# Concatenate in order: shorter string, longer string, shorter string
# Both inputs will always be different lengths
#
# Input: 2 strings
# Output: string
# Algorithm:
# -if string1 is shorter than string2
#   -string1 + string2 + string1
# -else
#   -string2 + string1 + string2
def short_long_short(string1, string2)
  if string1.size < string2.size
    string1 + string2 + string1
  else
    string2 + string1 + string2
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
