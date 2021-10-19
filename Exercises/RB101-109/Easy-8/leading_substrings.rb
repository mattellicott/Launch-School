def leading_substrings(string)
  result = []
  last = ''
  string.chars.each_with_index do |element, idx|
    result << last + element
    last = result[idx]
  end
  result
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
