# Questions:
# Requirements:
#   -sort input based on words for each number
# Input: array of integers
# Output: array of integers
# Algorithm:
#   -create an array of the words for 0..19 in order, words
#   -accept array as argument
#   -create new array, result, where input elements are swapped with words
#   -sort result
#   -convert result, where elements are the indices of the elements from words
#   -return result

WORDS = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten,
           eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen,
           eighteen, nineteen)

# def alphabetic_number_sort(numbers)
#   result = numbers.map { |i| WORDS[i] }.sort.map { |i| WORDS.index(i) }
#   result
# end

# REFACTORED
def alphabetic_number_sort(numbers)
  numbers.map { |i| WORDS[i] }.sort.map { |i| WORDS.index(i) }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
