hsh = {
  first: ['the', 'quick'], second: ['brown', 'fox'],
  third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']
}
vowels = 'aeiouAEIOU'
string = ''

hsh.each do |key, value|
  value.each do |word|
    word.chars.each do |letter|
      string += letter if vowels.include?(letter)
    end
  end
end

p string
