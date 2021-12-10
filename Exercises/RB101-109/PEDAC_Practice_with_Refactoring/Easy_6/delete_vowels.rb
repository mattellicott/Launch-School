# Input: array of strings
# Output: array of strings

# Rules: Remove the vowels(a, e, i, o, u)

# Map over each element of Input
#    Return the element without the vowels

def remove_vowels(arr)
  arr.map { |str| str.scan(/[a-z&&[^aeiou]]/i).join }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
