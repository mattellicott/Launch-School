def substrings(string)
  result = []

  0.upto(string.size) do |i|
    result << leading_substrings(string[i..-1])
  end
  result.flatten
end

def leading_substrings(string)
  last = ''
  result = []
  string.chars.each_with_index do |element, idx|
    result << last + element
    last = result[idx]
  end
  result
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
