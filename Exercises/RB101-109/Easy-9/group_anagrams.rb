words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
#if word.chars.difference(copy[i].chars) == []
result = []
copy = words.dup

words.each do |word|
  group = []
  copy.pop(0)
  0.upto(copy.size - 1) do |i|
    if word.delete(copy[i]) == ''
      group << copy[i]
      copy[i] = ''
    end
  end
  result << group unless group.empty?
end
0.upto(result.size - 1) { |i| p result[i] }
