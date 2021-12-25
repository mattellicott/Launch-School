require 'pry'
def numericals(str)
  char_hsh = {}
  result = ''
  str.each_char do |c|
    if char_hsh.key?(c)
      char_hsh[c] += 1
    else
      char_hsh[c] = 1
    end
    result << char_hsh[c].to_s
  end
  result
end

puts numericals('hello')