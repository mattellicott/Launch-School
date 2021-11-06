def ascii_value(string)
  total = 0
  string.each_char { |char| total += char.ord }
  total
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further Exploration: char.ord.mystery would be replaced with char.ord.chr
# If you try it with a longer string, it only returns the first character since
# ord() only returns the first character of a string.
