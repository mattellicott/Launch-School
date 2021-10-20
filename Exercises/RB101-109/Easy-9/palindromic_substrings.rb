def palindromes(string)
  list = substrings(string)
  p_list = []

  list.each do |substring|
    p_list << substring if (substring == substring.reverse) && substring.size > 1
  end
  p_list
end

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

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
p palindromes('Ma-dam') == ['madam', 'ada']
